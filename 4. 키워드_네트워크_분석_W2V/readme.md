# 키워드 네트워크 분석 - Word2Vec 활용

## 단어 임베딩
- 단어 임베딩은 단어들을 고차원의 좌표공간에(벡터)로 매핑해주는 방법론으로 유사한 단어들은 서로 가까운 좌표에 매핑됨

<img src = "https://github.com/keibigdata/dyjin_2020/blob/master/4.%20%ED%82%A4%EC%9B%8C%EB%93%9C_%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC_%EB%B6%84%EC%84%9D_W2V/images/1.png?raw=true">

<img src = "https://github.com/keibigdata/dyjin_2020/blob/master/4.%20%ED%82%A4%EC%9B%8C%EB%93%9C_%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC_%EB%B6%84%EC%84%9D_W2V/images/3.png?raw=true">

- 엣지 : 코사인 유사도가 0.7 이상인 경우 (향후 입력으로 받도록 수정 예정)
- 노드 크기 : 엣지의 합
- 노드 색깔 : 



## 키워드 네트워크 분석 웹 서비스
- KEI 원내에서 http://data01.kei.re.kr/kn2 에서 수행 가능
- R Shiny를 통해 연관분석 기반 키워드 네트워크 분석 App 구현
- 키워드 분석 결과, 상위 N개 키워드 네트워크 분석 결과 출력


<img src = "https://github.com/keibigdata/dyjin_2020/blob/master/4.%20%ED%82%A4%EC%9B%8C%EB%93%9C_%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC_%EB%B6%84%EC%84%9D_W2V/images/2.png?raw=true">

- 윈도우 크기 : 1개의 단어 매핑 시 주위 몇 개의 단어를 고려할 것인지?
- 임베딩 차원 : 각 키워드를 몇차원의 벡터로 임베딩 할 것인지?
- 키워드 개수 : 몇 개의 키워드로 네트워크를 구성할 것인지?
- 불용어 : 불용어 입력 

## 주요 사례
- 2010~2019 KEI 보고서 제목 분석

<img src = "https://github.com/keibigdata/dyjin_2020/blob/master/4.%20%ED%82%A4%EC%9B%8C%EB%93%9C_%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC_%EB%B6%84%EC%84%9D_W2V/images/4.png?raw=true">
  

## 추가 파일설명
1) 코드 
- code/app.R : 웹 RShiny 코드

