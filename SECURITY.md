# Security Policy

## 민감정보 보호

GitHub Issue, 로그 또는 화면 캡처를 공유할 때 다음 정보를 반드시 제거해 주세요.

- Telegram Bot Token과 Chat ID
- Slack App Token과 Bot Token
- API 키, 인증서와 개인 접근 토큰
- Windows 사용자 이름과 개인 파일 경로
- 사내 IP, 도메인과 외부 접속 주소
- 등록 문서의 내용과 개인 대화 기록

민감정보가 포함된 로그를 공개 Issue에 올리지 마세요.

## 로컬 Agent 사용 시 주의사항

Hermes Agent와 추가 스킬은 사용자가 허용한 범위에서 파일, 명령 실행, 네트워크 및 메신저 기능을 사용할 수 있습니다. 신뢰할 수 없는 스킬이나 설정을 추가하기 전에 출처와 권한을 확인하세요.

Telegram·Slack 연동에는 반드시 허용 사용자 또는 Chat ID 목록을 설정하세요. Team Server의 내부 HTTP 포트를 인터넷에 직접 공개하지 말고 VPN 또는 올바르게 구성된 HTTPS 역방향 프록시를 사용하세요.

## 취약점 제보

보안 문제에는 재현 방법과 영향을 포함하되 토큰, 개인정보, 실제 사내 자료는 첨부하지 마세요. 민감하지 않은 문제는 GitHub Issues를 이용할 수 있습니다.

