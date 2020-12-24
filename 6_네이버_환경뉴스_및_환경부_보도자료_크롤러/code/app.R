##################################################################
# 웹 텍스트 수집기
##################################################################

rm(list=ls())
setwd("/srv/shiny-server/tc")
#setwd("~/2020_웹_텍스트_크롤러")

options(shiny.maxRequestSize=5000*1024^2) 
options(shiny.plot.res=300)
options(encoding="EUC-KR")

# Shiny
library(shiny)
library(NLP4kec)
library(readr)
library(KoNLP)
library(arules)
library(igraph)
library(combinat)
library(DT)
library(showtext)
library(extrafont)
library(tidyverse)
library(writexl)
library(lubridate)
library(vroom)
#loadfonts()
showtext_auto()
font_add("NanumBarunGothic", "NanumBarunGothic.ttf")


# Define UI for data upload app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("웹 텍스트 수집기"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Select a file ----
      radioButtons("corpus", "문서집단 선택",
                   choices = c("네이버 환경뉴스" = "naver",
                               "환경부 보도자료" = "me"),
                   selected = "head"),
      
      #tags$h5(tags$b("날짜필터링")),
      textInput(inputId = "start_date", label = "StartDate", value = "20190101"),
      textInput(inputId = "end_date", label = "EndDate", value = "20191231"),
      
      textInput(inputId = "search_exp", label = "내용필터링", value = ""),
      
      # Horizontal line ----
      
      
      # Input: Select number of rows to display ----
      radioButtons("disp", "Display",
                   choices = c(Head = "head",
                               All = "all"),
                   selected = "head"),
      
      actionButton("load_data", "데이터 로드"),
      width=2
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("데이터 보기 및 저장", DT::dataTableOutput("data"), downloadButton("dBtn", "Download"))
      )
    )
    
  )
)


##################################################################
# 연구동향 분석 서비스
##################################################################


s_date <- Sys.Date()
rn <- sample(1:100000000,1)
fn1 <- paste("./result/", s_date,"_",rn,".csv",sep="")

nn_dir <- "/media/Data/Naver_News/result/"
nn <- vroom(paste(nn_dir,"indexing.txt",sep=""),delim=",",col_names=FALSE)
nn <- nn[,c(1,2,5)]

mn_dir <- "/media/Data/Me_Report/result/"
mn <- vroom(paste(mn_dir,"indexing.txt",sep=""),delim=",",col_names=FALSE)
mn <- mn[,c(1,2,4)]
fn <- paste("./result/output_",rn,".xlsx",sep="")
fn2 <- paste("output_",s_date, "_", rn,".xlsx",sep="")

# Define server logic to read selected file ----
server <- function(input,output,session) {
  result_df <- NULL
  observeEvent(input$load_data, {
    result_df <- reactive({                
      isolate({
        input$load_data
        tdir <- NULL
        if(input$corpus == "naver") {
          result_df <- nn
          tdir <- nn_dir 
        }
        else {
          result_df <- mn
          tdir <- mn_dir
        }
        
        # 날짜 필터링
        colnames(result_df) <- c("date","title","text")
        start_date <- input$start_date
        end_date <- input$end_date
        
        start_idx <- which(result_df$date >= ymd(start_date))
        end_idx <- which(result_df$date <= ymd(end_date))
        
        
        c_idx <- intersect(start_idx,end_idx)
        
        if(length(c_idx) > 0){
          result_df <- result_df %>% slice(c_idx)
        }
        else{
          result_df <- NULL
        }
        
        
        for(i in 1:nrow(result_df)){
          fn <- paste(tdir,substr(result_df[i,3],10,100),sep="")
          temp <- read_lines(fn)
          temp <- gsub("\\\"\\\"", "\"", temp)
          temp <- temp[-2]
          result_df[i,3] <- paste(temp,collapse=" ")
        }
        
        #print(df$date)
        print(colnames(result_df))

        
        # 내용 필터링
        result_df <- result_df %>% filter(grepl(input$search_exp,title))
      })
      result_df
    })      
    output$data <- renderDataTable({
      write_xlsx(result_df(), path = fn)
      if(input$disp == "head") {
        return(head(result_df()))
      }
      else {
        return(result_df())
      }
      
    }, options = list(columnDefs = list(list(
      targets = c(1,2,3),
      render = JS(
        "function(data, type, row, meta) {",
        "return type === 'display' && data.length > 150 ?",
        "'<span title=\"' + data + '\">' + data.substr(0, 150) + '...</span>' : data;",
        "}")
    ))), callback = JS('table.page(3).draw(false);')
    )
    
    
    output$dBtn <- downloadHandler(
      filename = function(){
        fn2
      },
      content = function(file){
        file.copy(fn, file)
      }
    )
    
  })
  
  
}

# Create Shiny app ----
shinyApp(ui, server)
