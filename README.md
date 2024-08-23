# 🔥 **2024-1학기 Prometheus 5기 Project**

## **테무에서 산 콴다**

![Overview](https://github.com/vivamini7/math-solving/blob/main/images/overview.gif)

이 프로젝트는 수학 문제 풀이 공부 서비스입니다. 사용자가 수학 문제 사진을 업로드하면, 해당 문제의 단원을 파악하고 상세한 풀이를 제공 합니다. 이를 통해 단순한 해설지 제공을 넘어, 문제 풀이 접근 방식을 이해하는 데 도움을 줍니다. 또한, 유사 문제를 추천하여 학습자가 취약
한 부분을 반복 학습할 수 있도록 돕습니다.


## 프로젝트 구성

- **문제 인식**: 사용자가 업로드한 사진을 분석하여 문제의 단원을 자동으로 인식합니다.
- **상세 풀이 제공**: 단순한 답안 제공을 넘어, 챗봇 풀이를 제공합니다.
- **유사 문제 추천**: 사용자가 학습한 내용을 바탕으로 유사한 문제를 추천하여 반복 학습을 돕습니다.

## 사용 예시
서비스의 기본 사용 흐름은 다음과 같습니다:

1. 사용자가 수학 문제 사진을 업로드합니다.
2. 시스템은 문제의 단원을 분석하고, 문제 풀이를 제공합니다.
3. 풀이와 함께 유사한 문제를 추천받아 추가 학습을 진행합니다.

## 워크플로우

아래는 이 프로젝트의 전체적인 워크플로우를 나타낸 다이어그램입니다:

![워크플로우 다이어그램](https://github.com/vivamini7/math-solving/blob/main/images/workflow.jpg)


## 메서드 
이 프로젝트에서 사용된 주요 모델들은 다음과 같습니다:

1. **Math OCR - Pix2Text**:
   - **역할**: 이 모델은 수학 문제 이미지를 LaTeX 언어로 변환하는 역할을 합니다.
   - **특징**: 수식과 한글이 포함된 데이터셋을 이용해 학습되었으며, 수학 문제의 이미지를 텍스트로 정확하게 변환할 수 있도록 최적화되었습니다. 이를 통해 이미지에서 텍스트를 추출하고, 추출된 텍스트를 LaTeX 형식으로 변환하여 수학식을 처리합니다.
   - **[Pix2Text GitHub Repository](https://github.com/breezedeus/Pix2Text)**

2. **Chapter Prediction - KoELECTRA**:
   - **역할**: 한국어로 작성된 수학 문제의 텍스트를 이해하고, Replaced Token Detection 기법을 활용하여 정확한 문제의 단원 분류 및 문제 풀이에 필요한 텍스트 분석을 수행합니다.
   - **특징**: 한국어로 학습된 KoELECTRA small v3 모델을 사용하며, 확률과 통계 문제-단원 데이터셋을 학습시켜 수학문제 text를 input으로 받아 14개의 소단원으로 분류하도록 fine-tuning 시켰습니다.
   - **[KoELECTRA GitHub Repository](https://github.com/monologg/KoELECTRA)**

3. **Explanation - MACM**:
   - **역할**: 복잡한 수학 문제를 해결하기 위해 다중 에이전트를 활용하는 방식으로, 문제의 조건을 지속적으로 탐색하며 해결하는 역할을 합니다.
   - **특징**: MACM(Multi-Agent System for conditional Mining)은 MATH Benchmark에서 가장 뛰어난 성능을 보여주는 prompting method로, 복잡한 수학 문제를 해결하기 위해 다중 에이전트를 활용하여 문제의 조건을 지속적으로 탐색하는 방식으로 문제를 해결합니다.
   - 이 방식은 MATH Benchmark에서 뛰어난 성능을 보여주었으며, 원 논문에서는 GPT-4를 사용했지만, 본 프로젝트에서는 속도 및 비용 절감을 위해 GPT-4o mini를 사용했습니다.
   - **[MACM GitHub Repository](https://github.com/bin123apple/MACM)**

4. **Similar Problem Recommendation**:
   - 확률과 통계 데이터셋을 벡터화화여 TF-IDF(term frequency-inverse document frequency)를 활용하여 유사도를 계산하고, 유사도가 가장 높은 문제를 추천해줍니다.

## 사용된 데이터셋

이 프로젝트에서 사용된 주요 데이터셋과 그 생성 방법은 다음과 같습니다:

| 데이터셋                              | 특징                                                                                  | 출처 / 생성 방법                                                    |
|------------------------------------------|---------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| **확률과 통계 단원별 문제집 데이터셋**   | 시중 문제집에서 단원별, 소단원별로 10문제씩 텍스트 데이터 생성                        | 다양한 출판사의 시중 문제집에서 추출                                 |
| **확률과 통계 모의고사 기출문제 데이터셋** | 1년치 모의고사 기출문제에서 텍스트 데이터를 추출                                      | 교육청 및 각종 모의고사 기출문제에서 데이터 생성                    |

OpenAI API를 활용하여 GPT-4o를 사용해 문제 이미지에서 latex 기호를 활용한 문제 text를 추출하여 학습에 사용하였습니다.

## 결과 예시
업로드한 문제 이미지에 대한 단원 예측, 해설, 유사 문제 추천 텍스트를 출력합니다.

![Result1](https://github.com/vivamini7/math-solving/blob/main/images/result1.png)
![Result2](https://github.com/vivamini7/math-solving/blob/main/images/result2.png)

## 실행 방법
이 프로젝트를 로컬 환경에서 실행하려면 다음 단계를 따라주세요.

### Clone this repository
```bash
git clone https://github.com/vivamini7/math-solving.git
cd math-solving
```

### Install requirements
```bash
pip install -r Pix2Text/requirements.txt
pip install -r MACM/requirements.txt
pip install -r web/requirements.txt
```
### Run Flask API server
```bash
python web/app.py
```

### Run Flutter app
```bash
cd temu_qanda
flutter run -d chrome
```

## 설치 및 의존성
### Install Flutter SDK

Flutter 프로젝트를 실행하기 위한 환경을 설정합니다. Chrome을 시뮬레이터로 사용하는 방법을 설명합니다.

1. **Flutter 설치**: Flutter SDK를 설치합니다. [[설치 방법]](https://docs.flutter.dev/get-started/install)

2. **Flutter 환경 설정**: Flutter 설치와 관련된 설정을 검사하고, 필요한 설치가 완료되었는지 확인합니다.
```bash
flutter doctor
```

3. **Chrome 시뮬레이터 실행**: Chrome이 설치되어 있다면 flutter 프로젝트를 실행합니다.
```bash
flutter run -d chrome
```

## 참조 자료
- (https://www.sciencedirect.com/science/article/abs/pii/S0031320319300263?fr=RR-2&ref=pdf_download&rr=8b77fb950b5b30dc)
- (https://arxiv.org/pdf/2404.04735v1)


## 라이선스

