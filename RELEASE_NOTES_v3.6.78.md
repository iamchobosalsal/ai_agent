# AI One-touch v3.6.78

진행 로그를 편하게 읽을 수 있도록 스크롤 동작을 개선하고, LM Studio가 사용자 지정 컨텍스트를 내부 블록 크기에 맞춰 정상 정렬했을 때 AI 시작이 실패하던 문제를 수정한 v3.6 최신 배포본입니다.

## 주요 변경 사항

- 진행 로그를 위로 올린 상태에서는 새 로그가 추가돼도 읽던 위치 유지
- 로그가 맨 아래에 있을 때만 새 항목 자동 추적
- 임의의 사용자 지정 컨텍스트에 대한 LM Studio 256토큰 단위 상향 정렬 허용
- 요청값보다 작은 컨텍스트나 무관한 큰 값은 계속 오류로 처리
- Radeon AI PRO R9700에서 AMD ROCm 런타임 확인
- Qwen 3.6 35B-A3B, Q8 KV 캐시, 사용자 지정 210K 컨텍스트 실제 로드 검증
- Hermes Desktop과 Telegram·Slack Gateway 실행 완료 검증
- 전체 회귀 테스트 42개 통과

## 설치

저장소에서 **Code → Download ZIP**을 선택하고 압축을 푼 뒤 `downloads/v3.6.78` 폴더의 `1_Install_AI_OneTouch_Internal.bat`을 관리자 권한으로 실행하세요.

상위 버전 설치 시 기존 설정, API 연결 정보, RAG 문서와 내려받은 LM Studio 모델은 유지됩니다. 처음 설치하는 PC에서는 함께 제공되는 공개 인증서를 등록하기 위해 관리자 권한이 필요합니다. 서명용 개인키는 포함되어 있지 않습니다.

자세한 사용법은 `downloads/v3.6.78/AI_OneTouch_v3.6_Installation_and_Usage_Guide.html`을 확인하세요.

## 파일 검증

- MSIX SHA-256: `3DA07E44352F1AA2DBAE5C36C742F06BAFA43D45BC8C6DAA973C977E1602D764`
- Reset Tool SHA-256: `9CCB7AFA793FBB2F9FC192209FE91AF631EE883293DD55C5D199912505481BDF`
- 인증서 지문: `8CC6F5032FF17B38DA3D4676916ECE159DFCF24C`
