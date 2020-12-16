# 환경 텍스트 감성 분류기 구축 및 활용

## 연구목표
- 환경 SNS 데이터 수집 감성분석, 결과 - 발신을 주기적으로 반복하는 '환경텍스트 감성 분류기 구축'
- 2018~2019년 개발한 기후변화 감성분류기를 환경 전 분야로 확장
- 감성분류 결과의 추이를 시각화 하여 확인할 수 있는 웹 기반 유저 인터페이스 제공 

![](https://github.com/keibigdata/dyjin_2020/blob/master/1_%ED%99%98%EA%B2%BD%20%ED%85%8D%EC%8A%A4%ED%8A%B8_%EA%B0%90%EC%84%B1_%EB%B6%84%EB%A5%98%EA%B8%B0_%EA%B5%AC%EC%B6%95_%EB%B0%8F%20_%ED%99%9C%EC%9A%A9/image/F1.png?raw=true)

## 학습데이터의 구성
- 이전년도 연구에서 구축한 구축한 기후변화 텍스트 5 만건 활용
- 환경 SNS 텍스트(네이버 환경뉴스 댓글, 트위터 댓글) 650만 건을 새롭게 수집하고, 기존 기후변화 감성분류기에 적용하여 긍정/부정 확률이 매우 높은 자료 14만건 추출
- 트위터의 경우 키워드 사전 구축 및 활용 (검색식 정의)
- 최종적으로 준지도 학습을 이용하여 학습 데이터를 기존 5 만 건에서 18만 건으로 확대
- 성능 평가 : 기존 데이터 대상 분류 정확도 1% 향상 확인(78.7% → 79.7%) 

![](https://github.com/keibigdata/dyjin_2020/blob/master/1_%ED%99%98%EA%B2%BD%20%ED%85%8D%EC%8A%A4%ED%8A%B8_%EA%B0%90%EC%84%B1_%EB%B6%84%EB%A5%98%EA%B8%B0_%EA%B5%AC%EC%B6%95_%EB%B0%8F%20_%ED%99%9C%EC%9A%A9/image/F3.png?raw=true)


## 모형 정보

![](https://github.com/keibigdata/dyjin_2020/blob/master/1_%ED%99%98%EA%B2%BD%20%ED%85%8D%EC%8A%A4%ED%8A%B8_%EA%B0%90%EC%84%B1_%EB%B6%84%EB%A5%98%EA%B8%B0_%EA%B5%AC%EC%B6%95_%EB%B0%8F%20_%ED%99%9C%EC%9A%A9/image/F2.png?raw=true)

## 성능 요약
- 0.5 기준으로 부정/긍정을 분류 경우

![](https://github.com/keibigdata/dyjin_2020/blob/master/1_%ED%99%98%EA%B2%BD%20%ED%85%8D%EC%8A%A4%ED%8A%B8_%EA%B0%90%EC%84%B1_%EB%B6%84%EB%A5%98%EA%B8%B0_%EA%B5%AC%EC%B6%95_%EB%B0%8F%20_%ED%99%9C%EC%9A%A9/image/F4.png)

- 0.7 기준으로 부정/긍정을 분류 경우

![](https://github.com/keibigdata/dyjin_2020/blob/master/1_%ED%99%98%EA%B2%BD%20%ED%85%8D%EC%8A%A4%ED%8A%B8_%EA%B0%90%EC%84%B1_%EB%B6%84%EB%A5%98%EA%B8%B0_%EA%B5%AC%EC%B6%95_%EB%B0%8F%20_%ED%99%9C%EC%9A%A9/image/F5.png)

## 감성분류 웹 서비스 
- KEI 원내에서 http://data01.kei.re.kr/sentiment 에서 수행 가능
- 2010~2019년도 네이버 환경뉴스 댓글, 트위터 데이터 감성분류 완료
- R Shiny를 통해 결과 표출 App 구현




## 파일 설명
