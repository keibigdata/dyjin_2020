# 키워드 네트워크 분석 - 연관분석 활용

## 연관분석
- 연관분석은 일련의 사건들 사이의 규칙을 발견하기 위해 적용 하는 방법론으로 장바구니 분석으로 알려져 있음, 즉 장바구니에 어떤 요소들이 동시에 들어갈 것인지를 분석하는 방법론임
- 대표 사례로 어떤 사람이 우유를 샀을 때 이 사람이 빵, 계란 등을 같이 살것인지? 를 분석하는 것임
- 이를 텍스트 분석 방법론에 적용하면 사례로 문장 내에서 '환경’이라는 키워드가 나타났을 때 주로 어떤 키워드가 같이 연관디어 나타나는지를 통계적으로 분석하는 것임
- P(A) : 문서(트랜젝선)에서 키워드 A가 등장할 확률 (100개의 문서중 키워드 A가 등장한 문서의 수 비율)
- P(B) : 문서(트랜젝선)에서 키워드 B가 등장할 확률 (100개의 문서중 키워드 B가 등장한 문서의 수 비율)
- 지지도(Support) : 두 키워드 A, B가 같은 문서에서 동시에 발생할 확률을 의미, P(A ∩ B)로 나타 낼 수 있음
- 신뢰도(Confidence) : 문서에서 키워드 A가 나타났을 때, 키워드 B가 같은 문서 내에서 발생할 확률을 의미, P(B | A)로 표현 할수 있음
- 지지도의 경우 대부분의 문서에서 나타나는 키워드가 있을 경우 그 키워드와 다른 키워드 사이의 값은 항상 크게 나타나며, 신뢰도는 키워드 A가 소수의 문서에서 나타났지만 키워드 B가 같이 등장하는 확률이 높을 경우 높은 신뢰도 값을 가지게 됨
- 향상도(Lift) :  키워드 A와 B의 향상도는 P(A ∩ B) / P(A)P(B) 로 표현할 수 있으며, 두 키워드가 독립일 때와 비교하면 두키워드가 얼마나 동시에 얼마나 발생하는지를 의미한다. 즉 키워드 A와 키워드B가 동시에 나타날 확률 (지지도)값에 각각의 키워드가 나타날 문서에 확률을 나누어 주는 일종의 패널티로써 역할수행함 



## 네트워크 구성 방법
- 연관분석(Association analysis) 활용


<img src = "https://github.com/keibigdata/dyjin_2020/blob/master/3_%ED%82%A4%EC%9B%8C%EB%93%9C_%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC_%EB%B6%84%EC%84%9D_%EC%97%B0%EA%B4%80%EB%B6%84%EC%84%9D/images/2.png?raw=true">

- 1개의 그래프는 노드(Node)와 엣지(Edge)를 정의함으로써 구성할수 있음
- 노드 : 연관분석 결과 나타난 모든 키워드 (Rhs, Lhs 한번 이상)
- 엣지 : 연관분석 결과 조건을 만족하는 모든 관계 (무방향)
- 노드 크기 : 연결 중심성 (Degree Centrality)
- 노드 색깔 : 개 중심성 (Between Centrality)


## 키워드 네트워크 분석 웹 서비스
- KEI 원내에서 http://data01.kei.re.kr/kn 에서 수행 가능
- R Shiny를 통해 연관분석 기반 키워드 네트워크 분석 App 구현
- 연관분석 결과, 키워드 네트워크, 네트워크 지표 출력
<img src = "https://github.com/keibigdata/dyjin_2020/blob/master/3_%ED%82%A4%EC%9B%8C%EB%93%9C_%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC_%EB%B6%84%EC%84%9D_%EC%97%B0%EA%B4%80%EB%B6%84%EC%84%9D/images/1.png?raw=true">


## 사용 팁
- SUPPORT 중심으로 설정 (0.5 -> 0.4 -> 0.3 순으로) 큰 값에서 작은 값으로 설정
- SUPPORT를 처음부터 낮은값을 설정할 경우 무한루프에 빠지는 현상이 발생함
- 문서가 클 시에는 형태소 분석 수행 별도로 수행권장
- 기본적으로 정렬순서는 SUPPORT, 노드가 1개 노드에 집중될시 LIFT로 할 경우 분산되는 효과

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

