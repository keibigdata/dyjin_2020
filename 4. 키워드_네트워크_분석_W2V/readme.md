# 키워드 네트워크 분석 - 연관분석 활용

## 단어 임베딩
- 단어 임베딩은 단어들을 고차원의 좌표공간에(벡터)로 매핑해주는 방법론으로 유사한 단어들은 서로 가까운 좌표에 매핑됨
- 단어 임베딩은 단어들을 고차원의 좌표공간에(벡터)로 매핑해주는 방법론으로 유사한 단어들은 서로 가까운 좌표에 매핑됨



## 네트워크 구성 방법
- 연관분석(Association analysis) 활용


<img src = "https://github.com/keibigdata/dyjin_2020/blob/master/3_%ED%82%A4%EC%9B%8C%EB%93%9C_%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC_%EB%B6%84%EC%84%9D_%EC%97%B0%EA%B4%80%EB%B6%84%EC%84%9D/images/2.png?raw=true">

- 1개의 그래프는 노드(Node)와 엣지(Edge)를 정의함으로써 구성할수 있음
- 노드 : 연관분석 결과 나타난 모든 키워드 (Rhs, Lhs 한번 이상)
- 엣지 : 연관분석 결과 조건을 만족하는 모든 관계 (무방향)
- 노드 크기
- 노드 색깔


## 키워드 네트워크 분석 웹 서비스
- KEI 원내에서 http://data01.kei.re.kr/kn 에서 수행 가능
- R Shiny를 통해 연관분석 기반 키워드 네트워크 분석 App 구현
- 연관분석 결과, 키워드 네트워크, 네트워크 지표 출력
<img src = "https://github.com/keibigdata/dyjin_2020/blob/master/3_%ED%82%A4%EC%9B%8C%EB%93%9C_%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC_%EB%B6%84%EC%84%9D_%EC%97%B0%EA%B4%80%EB%B6%84%EC%84%9D/images/1.png?raw=true">

 - 윈도우 크기 : 1개의 단어 매핑 시 주위 몇 개의 단어를 고려할 것인지?
 - 임베딩 차원 : 각 키워드를 몇차원의 벡터로 임베딩 할 것인지?
    - 키워드 개수 : 몇 개의 키워드로 네트워크를 구성할 것인지?
    - 불용어 : 불용어 입력 

## 주요 사례
- 2019년 네이버 환경뉴스 제목 분석 (3만건)

<img src = "https://github.com/keibigdata/dyjin_2020/blob/master/3_%ED%82%A4%EC%9B%8C%EB%93%9C_%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC_%EB%B6%84%EC%84%9D_%EC%97%B0%EA%B4%80%EB%B6%84%EC%84%9D/images/3.png?raw=true">


- 미세먼지 : 고농도 미세먼지, 중국, 공기청정기, 저감, 마스크, 차량 N부제, 노후경유차 등
- 기후변화 : 온실가스 배출, 감축, 대응, 멸종위기종 등
- 쓰레기/폐기물 : 처리, 수출, 시설, 업체, 해양 쓰레기 등
- 기타 : 인천 수돗물, 석탄발전소, 태풍 링링, 돼지열병, 가습기 살균제 

## 추가 파일설명
1) 코드 
- code/app.R : 웹 RShiny 코드

