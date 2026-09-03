# AI One-touch v3.6.77

기존 대시보드와 상세 진행 로그를 유지하면서 Cloud API, 로컬 문서 RAG와 실행 안정성을 보강한 v3.6 최신 배포본입니다.

## 주요 변경 사항

- 로컬 AI와 Cloud API 실행 방식 선택
- API 키 암호화 저장, 모델 목록 불러오기와 연결 확인
- Hermes Cloud API 도구 호출 및 재연결 안정화
- 16GB급 GPU용 Gemma 4 26B A4B IT QAT와 65K 컨텍스트
- Qwen3-Embedding-0.6B 기반 범용 자연어 RAG
- 문서 드래그앤드롭 및 문서 상태 복구
- 한·영 화면 전환과 시작 상태 표시 안정화
- 재실행 시 기존 창을 재사용하는 단일 실행 처리

## 설치

저장소에서 **Code → Download ZIP**을 선택하고 압축을 푼 뒤 `downloads/v3.6.77` 폴더의 `1_Install_AI_OneTouch_Internal.bat`을 관리자 권한으로 실행하세요.

처음 설치하는 PC에서는 함께 제공되는 공개 인증서를 등록하기 위해 관리자 권한이 필요합니다. 서명용 개인키는 배포 파일에 포함되어 있지 않습니다.

자세한 사용법은 `downloads/v3.6.77/AI_OneTouch_v3.6_Installation_and_Usage_Guide.html`을 확인하세요.

## 파일 검증

- MSIX SHA-256: `F1C7EE9159F39826E774728978DD246D657B96EEFDC85886A690344721A3D15C`
- Reset Tool SHA-256: `E083B087C75A89A32787FEF28A12E86B884C8CA9D47B4D8CA203182DB94CEE93`
- 인증서 지문: `8CC6F5032FF17B38DA3D4676916ECE159DFCF24C`
