# 딥러닝을 활용한 해양오염 예측도구 개발 및 적용 연구 (기본과제)

## 활용 데이터
- 유기물질, 부유물질, 가시거리 위성자료
- 수위, 유속, 수온, 염분의 수치모형 

![](https://github.com/keibigdata/dyjin_2020/blob/master/2_%ED%95%B4%EC%96%91%EC%98%A4%EC%97%BC_%EB%94%A5%EB%9F%AC%EB%8B%9D_%EC%98%88%EC%B8%A1/%EA%B7%B8%EB%A6%BC/F1_2.png?raw=true)

## 모형 구성의 목표
- 위성자료와 수치모형 자료를 함께 활용하여 클로로필-a를 추정하기 위한 딥러닝 모형을 구축

![](https://github.com/keibigdata/dyjin_2020/blob/master/2_%ED%95%B4%EC%96%91%EC%98%A4%EC%97%BC_%EB%94%A5%EB%9F%AC%EB%8B%9D_%EC%98%88%EC%B8%A1/%EA%B7%B8%EB%A6%BC/F3.png?raw=true)


## 1. CNN 모델 I : 48×27  이미지를 7장을 받게 받아 클로로필-a 이미지 출력

### 1) 모형 정보

![](https://github.com/keibigdata/dyjin_2020/blob/master/2_%ED%95%B4%EC%96%91%EC%98%A4%EC%97%BC_%EB%94%A5%EB%9F%AC%EB%8B%9D_%EC%98%88%EC%B8%A1/%EA%B7%B8%EB%A6%BC/F4.png?raw=true)

### 2) RMSE 예측 오차

- 검증 데이터셋 : 0.463
- 테스트 데이터셋 : 0.436


### 3) RMSE 평균 경우 예측 결과 : 예측값, 실측값 이미지 비교시 큰 경향은 잡지만 값 비교시 많은 차이 존재

- 예측 이미지

<img src="https://github.com/keibigdata/dyjin_2020/blob/master/2_%ED%95%B4%EC%96%91%EC%98%A4%EC%97%BC_%EB%94%A5%EB%9F%AC%EB%8B%9D_%EC%98%88%EC%B8%A1/%EC%98%88%EC%B8%A1%EA%B2%B0%EA%B3%BC/CNN%EB%AA%A8%ED%98%95_I_%EC%9D%B4%EB%AF%B8%EC%A7%80_%EC%9D%B4%EB%AF%B8%EC%A7%80_%EC%98%88%EC%B8%A1/A1_PRED.png" width="30%" height="30%"/>

- 실측 이미지

<img src="https://github.com/keibigdata/dyjin_2020/blob/master/2_%ED%95%B4%EC%96%91%EC%98%A4%EC%97%BC_%EB%94%A5%EB%9F%AC%EB%8B%9D_%EC%98%88%EC%B8%A1/%EC%98%88%EC%B8%A1%EA%B2%B0%EA%B3%BC/CNN%EB%AA%A8%ED%98%95_I_%EC%9D%B4%EB%AF%B8%EC%A7%80_%EC%9D%B4%EB%AF%B8%EC%A7%80_%EC%98%88%EC%B8%A1/A1_TRUE.png" width="30%" height="30%"/>

- 실제값/예측값 사이의 R2 그래프

<img src="https://github.com/keibigdata/dyjin_2020/blob/master/2_%ED%95%B4%EC%96%91%EC%98%A4%EC%97%BC_%EB%94%A5%EB%9F%AC%EB%8B%9D_%EC%98%88%EC%B8%A1/%EC%98%88%EC%B8%A1%EA%B2%B0%EA%B3%BC/CNN%EB%AA%A8%ED%98%95_I_%EC%9D%B4%EB%AF%B8%EC%A7%80_%EC%9D%B4%EB%AF%B8%EC%A7%80_%EC%98%88%EC%B8%A1/A1_R2.png" width="50%" height="50%"/>


## 2. CNN 모델 II : 7×7 이미지를 7장을 받게 받아 클로로필-a 값 출력

### 1) 분할 이미지 구축 방법 요약

![](https://github.com/keibigdata/dyjin_2020/blob/master/2_%ED%95%B4%EC%96%91%EC%98%A4%EC%97%BC_%EB%94%A5%EB%9F%AC%EB%8B%9D_%EC%98%88%EC%B8%A1/%EA%B7%B8%EB%A6%BC/F6.png?raw=true)

### 2) 모형 정보
![](https://github.com/keibigdata/dyjin_2020/blob/master/2_%ED%95%B4%EC%96%91%EC%98%A4%EC%97%BC_%EB%94%A5%EB%9F%AC%EB%8B%9D_%EC%98%88%EC%B8%A1/%EA%B7%B8%EB%A6%BC/F5.png?raw=true)

### 3) RMSE 예측 오차

- 검증 데이터 : 0.191
- 테스트 데이터 : 0.167


### 4) RMSE 평균 경우 예측 결과 

- 예측값, 실측값 이미지 비교시 거의 유사한 형태를 나타냄 (최악의 경우에도 큰 트렌드는 어느정도 추적하는것으로 나타남)

- 예측 이미지

<img src="https://github.com/keibigdata/dyjin_2020/blob/master/2_%ED%95%B4%EC%96%91%EC%98%A4%EC%97%BC_%EB%94%A5%EB%9F%AC%EB%8B%9D_%EC%98%88%EC%B8%A1/%EC%98%88%EC%B8%A1%EA%B2%B0%EA%B3%BC/CNN%EB%AA%A8%ED%98%95_II_%EB%B6%84%ED%95%A0%EC%9D%B4%EB%AF%B8%EC%A7%80_%EA%B0%92_%EC%98%88%EC%B8%A1/A1_PRED.png" width="30%" height="30%"/>

- 실제 이미지

<img src="https://github.com/keibigdata/dyjin_2020/blob/master/2_%ED%95%B4%EC%96%91%EC%98%A4%EC%97%BC_%EB%94%A5%EB%9F%AC%EB%8B%9D_%EC%98%88%EC%B8%A1/%EC%98%88%EC%B8%A1%EA%B2%B0%EA%B3%BC/CNN%EB%AA%A8%ED%98%95_II_%EB%B6%84%ED%95%A0%EC%9D%B4%EB%AF%B8%EC%A7%80_%EA%B0%92_%EC%98%88%EC%B8%A1/A1_TRUE.png" width="30%" height="30%"/>

- 실제값/예측값 사이의 R2 그래프

<img src="https://github.com/keibigdata/dyjin_2020/blob/master/2_%ED%95%B4%EC%96%91%EC%98%A4%EC%97%BC_%EB%94%A5%EB%9F%AC%EB%8B%9D_%EC%98%88%EC%B8%A1/%EC%98%88%EC%B8%A1%EA%B2%B0%EA%B3%BC/CNN%EB%AA%A8%ED%98%95_II_%EB%B6%84%ED%95%A0%EC%9D%B4%EB%AF%B8%EC%A7%80_%EA%B0%92_%EC%98%88%EC%B8%A1/A1_R2.png" width="50%" height="50%"/>


## 3. 변수별 모형 구성 : RMSE 예측오차 (클수록 나쁨)

- CDOM : 0.231
- TSS : 0.526
- VIS : 0.492
- VELOCITY : 0.651
- SALINITY : 0.648
- TEMP : 0.545
- WATERLEVEL : 0.653
- ALL + CDOM제외 : 0.330
- ALL : 0.191

## 4. 추가 파일설명
### 1) 모델 : 모델정보 저장
- CNN_Model_I.h5 : CNN 몯레 I케라스 모델 파일
- CNN_Model_II.h5 : CNN 모델 II 케라스 모델 파일 

### 2) 예측결과/CNN모형_I_이미지_이미지_예측 : CNN모형_I 예측 결과  
- L로 시작 파일 : RMSE 오차가 가장 낮은 경우 결과
- H로 시작 파일 : RMSE 오차가 가장 높은 경우 결과
- A로 시작 파일 : RMSE 오차가 평균적인 경우 결가
- TRUE로 끝나는 파일 : 실제 데이터
- PRED로 끝나는 파일 : 예측 데이터
- RMSE.xlsx : 128개 이미지에 대한 각 RMSE 오차
- II_ALL.xlsx : 학슥과정

### 3) 예측결과/CNN모형_II_분할이미지_값_예측 : CNN모형_II 예측 결과  
- L로 시작 파일 : RMSE 오차가 가장 낮은 경우 결과
- H로 시작 파일 : RMSE 오차가 가장 높은 경우 결과
- A로 시작 파일 : RMSE 오차가 평균적인 경우 결가
- TRUE로 끝나는 파일 : 실제 데이터
- PRED로 끝나는 파일 : 예측 데이터
- RMSE.xlsx : 128개 이미지에 대한 각 RMSE 오차
- II_ALL.xlsx : 학슥과정
