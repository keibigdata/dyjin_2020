##################################################################
# W2V 서비스
##################################################################

rm(list=ls())
#setwd("~/2020_일반과제_기후변화_감성분류기_구축/2020_일반과제_감성분석")
options(shiny.maxRequestSize=5000*1024^2) 
options(shiny.plot.res=300)
setwd("/srv/shiny-server/wv")

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
library(readxl)
library(writexl)
library(tidyverse)
library(lubridate)
library(zoo)
library(plotly)
library(vroom)
library('igraph')
library(igraph)
library(network)
library(sna)
library(ggplot2)
library(GGally)
library(wordVectors)
library(tm)

loadfonts()
showtext_auto()
font_add("NanumBarunGothic", "NanumBarunGothic.ttf")
indi_num <- 100
thres <- 0.7
max_kw_num <- 30
min_num <- 20
s_date <- Sys.Date()
rn <- sample(1:100000000,1)
fn <- paste("./result/morphed_", s_date,"__",rn,".csv",sep="")

# Define UI for data upload app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("W2V 기반 키워드 네트워크 분석 서비스"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Select Dataset
      fileInput('file1', '엑셀 파일 선택(*.xlsx)',  accept = c(".xlsx")),
      
      # Input: Select number of rows to display ----
      textInput(inputId = "ws", label = "윈도우 크기", value = 5),
      textInput(inputId = "vs", label = "임베딩 벡터 차원", value = 10),
      textInput(inputId = "max_kw_num", label = "키워드 갯수", value = 30),
      textInput("s_words", "불용어",value = ""),
      
      radioButtons("disp", "Display",
                   choices = c(Head = "head",
                               All = "all"),
                   selected = "head"),
      
      actionButton("do", "분석실행"), 
      width=2
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("데이터", DT::dataTableOutput("data")),
                  tabPanel("키워드 빈도수", tableOutput("morph_result")),
                  tabPanel("키워드 네트워크", plotOutput("nw_result", width = "100%", height= 800))
      )
    )
  )
)




# Define server logic to read selected file ----
server <- function(input, output,session)
{
  df <- reactive({     
    req(input$file1)
    file <- input$file1
    df <- read_excel(file$datapath,1)
    df
  })      
  
  output$data <- DT::renderDataTable({
    df <- df()
    if(input$disp == "head") {
      return(head(df))
    }
    else {
      return(df)
    }
    
  })
  
  m1 <- eventReactive(input$do,{
    df <- df()
    print(df)
    baseData <- df()
    parsedData <- baseData
    content <- as.vector(unlist(baseData$text))
    text <- r_extract_noun(content, language = "ko")
    s_words = input$s_words
    
    #분석 결과 가져오기
    
    result_mat <- data.frame(text)
    #write_xlsx(result_mat, path = fn)
    write.csv(result_mat, file = fn, fileEncoding="UTF-8")
    
    corp <- Corpus(VectorSource(as.vector(unlist(result_mat))))
    s_words <- unlist(strsplit(s_words,","))
    tdm <- TermDocumentMatrix(corp, control=list(wordLengths=c(4,Inf), stopwords=s_words))
    
    #분석 결과 가져오기
    
    m <- as.matrix(tdm) 
    v <- sort(rowSums(m),decreasing=TRUE) # 빈도수를 기준으로 내림차순 정렬
    d <- data.frame(word = names(v),freq=v)  # 데이터 프레임 생성
    max_kw_num = input$max_kw_num
    d[1:max_kw_num,]
  })
  
  
  output$morph_result <- renderTable({
    m1()
  })
  
  output$nw_result <- renderPlot({
    #모델 Training
    
    m <- m1()
    kw_list <- as.vector(unlist(m[,"word"]))
    model = train_word2vec(fn, threads=3, vectors=input$vs, window=input$ws) 
    rnames <- rownames(model@.Data)
    result_mat <- model@.Data
    
    
    idx <- c()
    for(k in kw_list){
      idx <- c(idx,which(rnames == k))
    }
    
    result_mat <- result_mat[idx,]
    
    g <- 1 - cosineDist(result_mat,result_mat)
    
    thres <- quantile(g,0.7)
    #g <- g[-didx,-didx]
    
    #w_list <- w_list[-didx]
    #colnames(g) <- w_list
    g[g < thres] = 0
    
    
    ## Make Network
    net <- network(g, directed=FALSE)
    net %v% "size" <- ifelse(betweenness(net) > quantile(betweenness(net),0.7), "big", "small")
    col = c("small" = "skyblue", "big" = "tomato")
    ggnet2(net, "kamadakawai",label=TRUE,label.size = 6, color = "size", size=round(degree(net) / max(degree(net)) * 15),palette = col,max_size = 20,legend.position = 0,edge.label.alpha = 0)
    
  })
  
}



# Create Shiny app ----
shinyApp(ui, server)