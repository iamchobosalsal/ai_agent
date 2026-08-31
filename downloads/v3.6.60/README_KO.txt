AI One-touch v3.6.60 설치 안내
==============================

이 폴더에는 AI One-touch v3.6.60 설치 파일과 초기화 도구가 들어 있습니다.

설치 방법
1. GitHub에서 받은 ai_agent-main.zip의 압축을 완전히 해제합니다.
2. 이 폴더의 package-info.json에 기록된 버전과 인증서 지문을 확인합니다.
3. 1_Install_AI_OneTouch_Internal.bat을 우클릭하여 관리자 권한으로 실행합니다.
4. 설치가 끝나면 바탕화면의 AI One-touch Internal 바로가기를 실행합니다.
5. 자세한 화면 설명은 AI_OneTouch_v3.6_Installation_and_Usage_Guide.html을 확인합니다.

주의 사항
- 이 설치본은 공인 코드서명이 아닌 자체서명 MSIX입니다.
- 설치 배치파일은 Trust 폴더의 공개 인증서를 현재 PC에 등록합니다.
- 서명용 개인키는 이 배포본에 포함되어 있지 않습니다.
- Smart App Control, Defender 또는 조직의 AppLocker/WDAC 정책에 따라 설치가 차단될 수 있습니다.
- 압축 파일 내부에서 BAT을 바로 실행하지 말고 반드시 압축을 먼저 해제하세요.

제거 방법
- 3_Remove_AI_OneTouch_Internal.bat을 관리자 권한으로 실행합니다.

문제가 생겼을 때
1. Windows를 재부팅하고 다시 시도합니다.
2. 저장소 ZIP을 새 폴더에 다시 풀고 설치 BAT을 관리자 권한으로 실행합니다.
3. 그래도 실행되지 않으면 Reset_Tool.exe로 런처 환경을 초기화한 뒤 재설치합니다.

Reset_Tool.exe는 런처 실행 환경, Hermes 설정과 기록, RAG 데이터를 초기화합니다. LM Studio 모델과 LM Studio 자체 설정은 기본적으로 보존되므로 삭제 항목을 화면에서 확인하세요.
