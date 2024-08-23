# 🔥 **2024-1학기 Prometheus 5기 Project**

## **테무에서 산 콴다**
이 프로젝트는 수학 문제 풀이 공부 서비스입니다. 사용자가 수학 문제 사진을 업로드하면, 해당 문제의 단원을 파악하고 상세한 풀이를 제공 합니다. 이를 통해 단순한 해설지 제공을 넘어, 문제 풀이 접근 방식을 이해하는 데 도움을 줍니다. 또한, 유사 문제를 추천하여 학습자가 취약
한 부분을 반복 학습할 수 있도록 돕습니다.

## 프로젝트 구성

- **문제 인식**: 사용자가 업로드한 사진을 분석하여 문제의 단원을 자동으로 인식합니다.
- **상세 풀이 제공**: 단순한 답안 제공을 넘어, 문제 풀이의 접근 방식을 상세히 설명합니다.
- **유사 문제 추천**: 사용자가 학습한 내용을 바탕으로 유사한 문제를 추천하여 반복 학습을 돕습니다.

## 사용된 모델 
이 프로젝트에서 사용된 주요 모델들은 다음과 같습니다:

1. **Pix2Text**:
   - **역할**: 이 모델은 수학 문제 이미지를 LaTeX 언어로 변환하는 역할을 합니다.
   - **특징**: 수식과 한글이 포함된 데이터셋을 이용해 학습되었으며, 수학 문제의 이미지를 텍스트로 정확하게 변환할 수 있도록 최적화되었습니다. 이를 통해 이미지에서 텍스트를 추출하고, 추출된 텍스트를 LaTeX 형식으로 변환하여 수학식을 처리합니다.
   - **[Pix2Text GitHub Repository](https://github.com/breezedeus/Pix2Text)**

2. **KoELECTRA**:
   - **역할**: 한국어로 작성된 수학 문제의 텍스트를 이해하고, Replaced Token Detection 기법을 활용하여 정확한 문제의 단원 분류 및 문제 풀이에 필요한 텍스트 분석을 수행합니다.
   - **특징**: 한국어로 학습된 KoELECTRA small v3 모델을 사용하며, 모든 입력 토큰에 대해 Replaced Token Detection을 통해 학습했습니다. 이를 통해 한국어 수학 문제의 텍스트 분석 정확도를 높였습니다.
   - **[KoELECTRA GitHub Repository](https://github.com/monologg/KoELECTRA)**

3. **MACM**:
   - **역할**: 이 모델은 수학 문제의 의미를 이해하고, 문제 풀이의 주요 단계들을 결정하는 데 활용됩니다.
   - **특징**: MACM은 수학 문제의 의미적 맥락을 분석하고, 그에 맞는 문제 해결 전략을 제안하는 데 사용됩니다. 이 모델은 문제 풀이의 접근 방식을 세밀하게 조정하는 역할을 합니다.


## 실행 방법
이 프로젝트를 로컬 환경에서 실행하려면 다음 단계를 따라주세요.


## 사용 예시
서비스의 기본 사용 흐름은 다음과 같습니다:

1. 사용자가 수학 문제 사진을 업로드합니다.
2. 시스템은 문제의 단원을 분석하고, 문제 풀이를 제공합니다.
3. 풀이와 함께 유사한 문제를 추천받아 추가 학습을 진행합니다.

## 라이선스

