# 키워드 빈도수 및 트렌드 분석

## 주요기능
- 형태소 분석기 설정
- 전체 기간에 대한 키워드 빈도수 출력
- 일별 키워드 빈도수 출력
- 일별 키워드 빈도수 트렌드 출력
- 포함단어를 통해 특정 키워드를 분석에 포함 : 이 경우는 형태소 분석과 관계없이 스트링 매칭 알고리즘 활용으로 일치 횟수 계산
- 'date' 필드가 없을시에는 전체 기간에 대한 키워드 빈도수만 계산함

## 키워드 빈도수 및 트렌드 분석 웹 서비스
- KEI 원내에서 http://data01.kei.re.kr/ka 에서 수행 가능
- R Shiny를 통해 연관분석 기반 키워드 네트워크 분석 App 구현
- 연관분석 결과, 키워드 네트워크, 네트워크 지표 출력

<img src = "https://github.com/keibigdata/dyjin_2020/blob/master/4.%20%ED%82%A4%EC%9B%8C%EB%93%9C_%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC_%EB%B6%84%EC%84%9D_W2V/images/1.png?raw=true">

<img src = "https://github.com/keibigdata/dyjin_2020/blob/master/4.%20%ED%82%A4%EC%9B%8C%EB%93%9C_%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC_%EB%B6%84%EC%84%9D_W2V/images/3.png?raw=true">

