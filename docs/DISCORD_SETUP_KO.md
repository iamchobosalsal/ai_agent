# Discord 연결 가이드 — 처음 사용하는 사람용

이 문서는 AI One-touch와 Discord를 처음 연결하는 과정을 처음부터 설명합니다.

## 준비할 것

- Discord 계정
- 봇을 사용할 Discord 서버
- AI One-touch v3.6.81 이상 또는 v3.7.31 이상

## 1. Discord 서버 만들기

1. Discord 왼쪽의 `+` 버튼을 누릅니다.
2. `직접 만들기`를 선택합니다.
3. 서버 이름을 정하고 생성합니다.
4. 이미 봇을 사용할 서버가 있다면 이 단계는 건너뜁니다.

## 2. Discord Bot 만들기

1. AI One-touch에서 `메신저 연결`을 엽니다.
2. `Discord`를 선택합니다.
3. `Discord Bot 설정 열기`를 누릅니다.
4. Discord Developer Portal에서 `New Application`을 누릅니다.
5. 앱 이름을 입력하고 생성합니다.
6. 왼쪽 메뉴에서 `Bot`을 선택한 뒤 `Add Bot`을 누릅니다.

## 3. Bot Token 넣기

1. Developer Portal의 `Bot` 화면에서 `Reset Token` 또는 `Copy`를 누릅니다.
2. 복사한 긴 문자열을 AI One-touch의 `Bot Token` 칸에 붙여 넣습니다.

`Client ID`나 `Application ID`가 아닙니다. Bot Token은 봇의 비밀번호이므로 화면 캡처, 채팅, 문서, GitHub에 올리지 마세요. 노출했다면 즉시 `Reset Token`으로 새 토큰을 만드세요.

## 4. Message Content Intent 켜기

1. Developer Portal의 `Bot` 화면 아래로 내려갑니다.
2. `Privileged Gateway Intents`에서 `Message Content Intent`를 켭니다.
3. 변경 내용을 저장합니다.

이 설정이 꺼져 있으면 `PrivilegedIntentsRequired` 오류가 나거나 봇이 메시지 내용을 읽지 못할 수 있습니다.

## 5. 내 Discord 사용자 ID 찾기

1. Discord 왼쪽 아래의 톱니바퀴를 눌러 `사용자 설정`을 엽니다.
2. `고급`으로 이동합니다.
3. `개발자 모드`를 켭니다.
4. 내 프로필 또는 내 이름을 오른쪽 클릭합니다.
5. `사용자 ID 복사`를 누릅니다.
6. 복사한 숫자를 AI One-touch의 `허용 사용자 ID`에 붙여 넣습니다.

여기에 넣는 값은 내 Discord 계정의 숫자 사용자 ID입니다. `Client ID`나 `Application ID`가 아닙니다.

`허용 역할 ID`, `허용 채널 ID`, `기본 알림 채널 ID`는 특정 역할이나 채널로 제한하거나 알림을 보낼 때만 사용합니다. 처음 연결할 때는 비워 두어도 됩니다.

## 6. 봇을 서버에 초대하기

1. Developer Portal에서 `OAuth2` → `URL Generator`로 이동합니다.
2. Scopes에서 `bot`, `applications.commands`를 체크합니다.
3. Bot Permissions에서 다음 권한을 체크합니다.
   - View Channels
   - Send Messages
   - Read Message History
   - Attach Files
4. 화면 아래에 생성된 주소를 엽니다.
5. 1단계에서 만든 서버를 선택하고 승인합니다.
6. Discord 서버의 멤버 목록에 봇 이름이 보이는지 확인합니다.

## 7. AI One-touch에서 연결하고 사용하기

1. AI One-touch에서 `설정 저장`을 누릅니다.
2. `저장하고 연결`을 누릅니다.
3. 메인 화면으로 돌아가 `AI 켜기`를 누릅니다.
4. Discord 서버에서 봇이 온라인으로 바뀔 때까지 기다립니다.
5. 서버 채널에서 `@봇이름 안녕`처럼 봇을 멘션해 질문합니다.

`서버 채널에서 멘션할 때만 답변`을 끄면 허용된 채널의 일반 메시지에도 반응합니다. 봇에게 보내는 DM에서는 멘션 없이 사용할 수 있습니다.

## 연결이 안 될 때

- `PrivilegedIntentsRequired`: Developer Portal에서 Message Content Intent를 켜고 다시 연결합니다.
- 봇이 서버에 없음: OAuth2 URL Generator로 봇을 해당 서버에 초대합니다.
- 봇이 오프라인: AI One-touch에서 저장하고 연결한 뒤 AI를 켭니다.
- 온라인인데 답이 없음: 서버 채널에서 `@봇이름`으로 멘션했는지 확인합니다.
- 특정 사람만 답이 없음: `허용 사용자 ID`가 그 사람의 Discord 숫자 사용자 ID인지 확인합니다.
- 계속 실패함: AI One-touch의 진행 로그에서 Discord 오류 문구를 확인합니다. Bot Token 자체는 공유하지 마세요.
