# 키워드 빈도수 및 트렌드 분석

## 주요기능
- 형태소 분석기 설정
- 전체 기간에 대한 키워드 빈도수 출력
- 일별 키워드 빈도수 출력
- 일별 키워드 빈도수 트렌드 출력
- 포함단어를 통해 특정 키워드를 분석에 포함 : 빈도수와 상관없이 일일 키워드 빈도수 및 트렌드 출력에 포함
- 'date' 필드가 없을시에는 전체 기간에 대한 키워드 빈도수만 계산함

## 키워드 빈도수 및 트렌드 분석 웹 서비스
- KEI 원내에서 http://data01.kei.re.kr/ka 에서 수행 가능
- R Shiny를 통해 App 구현

<img src = "https://github.com/keibigdata/dyjin_2020/blob/master/5_%ED%82%A4%EC%9B%8C%EB%93%9C_%EB%B9%88%EB%8F%84_%EB%B0%8F_%ED%8A%B8%EB%A0%8C%EB%93%9C_%EB%B6%84%EC%84%9D/images/1.png?raw=true">

## 추가 파일설명
1) 코드 
- code/app.R : 웹 RShiny 코드
