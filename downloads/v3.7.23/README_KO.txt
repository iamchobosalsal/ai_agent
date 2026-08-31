AI One-touch Beginner v3.7.23 설치 안내
========================================

처음 설치하는 사용자에게 권장하는 AI One-touch v3.7.23 설치본입니다.

설치 방법
1. GitHub에서 받은 ai_agent-main.zip의 압축을 완전히 해제합니다.
2. 이 폴더의 package-info.json에 기록된 버전과 인증서 지문을 확인합니다.
3. 1_Install_AI_OneTouch_Beginner_Internal.bat을 우클릭하여 관리자 권한으로 실행합니다.
4. 설치가 끝나면 바탕화면의 AI One-touch Beginner 바로가기를 실행합니다.
5. 자세한 화면 설명은 AI_OneTouch_v3.7_Beginner_Usage_Guide.html을 확인합니다.

주의 사항
- 이 설치본은 공인 코드서명이 아닌 자체서명 MSIX입니다.
- 설치 배치파일은 Trust 폴더의 공개 인증서를 현재 PC에 등록합니다.
- 서명용 개인키는 이 배포본에 포함되어 있지 않습니다.
- Smart App Control, Defender 또는 조직의 AppLocker/WDAC 정책에 따라 설치가 차단될 수 있습니다.
- 압축 파일 내부에서 BAT을 바로 실행하지 말고 반드시 압축을 먼저 해제하세요.

언어모델 다운로드
- 처음 설치할 때 선택한 언어모델을 추가로 내려받으므로 시간이 오래 걸릴 수 있습니다.
- 진행률, 내려받은 용량, 속도, 남은 시간 또는 마지막 확인 시각이 갱신되면 정상 진행 중입니다.
- 모델 다운로드 중에는 런처와 LM Studio를 강제로 종료하지 마세요.

제거 방법
- 3_Remove_AI_OneTouch_Beginner_Internal.bat을 관리자 권한으로 실행합니다.

문제가 생겼을 때
1. Windows를 재부팅하고 다시 시도합니다.
2. 저장소 ZIP을 새 폴더에 다시 풀고 설치 BAT을 관리자 권한으로 실행합니다.
3. 그래도 실행되지 않으면 Reset_Tool_LMStudio.exe로 환경을 초기화한 뒤 재설치합니다.

Reset_Tool_LMStudio.exe에서는 모델 삭제 여부를 직접 선택할 수 있습니다. 초기화 전에 화면의 선택 항목을 반드시 확인하세요.
