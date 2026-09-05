AI One-touch Beginner v3.7.34 - 무료 내부 서명 MSIX 배포 도구
==================================================

v3.7.34 업데이트
- Windows의 Hermes browser-use 한글·특수문자 입출력을 UTF-8로 처리합니다.
- 설치 및 AI/메신저 시작 시 호환되는 Hermes 파일에만 적용하며 원본을 백업합니다.
- 업데이트 설치 후 런처에서 AI를 껐다 켜면 실행 중인 Hermes에도 반영됩니다. PC 재부팅은 필요 없습니다.
- 이번 수정으로 모델, RAG, 답변 규칙, 브라우저 권한이나 검색 재시도 정책을 바꾸지 않습니다.

배포 경로 고정 원칙
- 이 폴더(C:\ai_agent_project\internal_distribution_v3.7)는 v3.7 전용입니다.
- v3.7 내부 배포의 빌드, 임시 파일, MSIX, 압축 폴더와 최종 ZIP은 모두 이 폴더 안에서만 처리합니다.
- C:\ai_agent_project\v3.7은 런처 원본을 읽는 용도로만 사용하며 배포본을 그곳에 만들지 않습니다.
- v3.6 배포본은 이 폴더에서 만들지 않습니다.

목적
- v3.7 왕초보용 LM Studio 런처를 별도 앱으로 설치합니다.
- v3.6 일반판과 동시에 설치할 수 있으며 데이터 경로와 패키지 ID가 분리됩니다.
- 회사/팀 내부 PC에 배포할 수 있도록 자체 인증서로 서명한 MSIX를 만듭니다.
- Smart App Control, Defender 또는 App Control 정책을 끄거나 삭제하지 않습니다.

중요한 한계
- 이 방식은 공인 코드 서명이 아니라 내부 배포용 자체 서명입니다.
- 대상 PC마다 최초 1회 관리자 권한으로 내부 코드 서명 인증서를 신뢰해야 합니다.
- 조직에서 별도 WDAC/AppLocker 정책으로 자체 인증서를 금지하면 관리자 정책 변경이 필요합니다.
- 런처가 나중에 내려받아 실행하는 Hermes/LM Studio/PowerShell 스크립트까지 자동으로 공인 신뢰되는 것은 아닙니다.

빌드 PC에서
1. C:\ai_agent_project\internal_distribution_v3.7\Build_Internal_MSIX.ps1을 실행합니다.
2. output 폴더와 AI_OneTouch_v3.7_Beginner_Internal_Distribution.zip이 생성됩니다.
3. 최초 빌드 직후 Backup_Internal_Private_Key.ps1로 개인 키를 별도 보관합니다.
4. PRIVATE-KEY-BACKUP 폴더와 PFX 파일은 절대 배포하지 않습니다.

대상 PC에서
1. ZIP 전체를 압축 해제합니다.
2. package-info.json에 기록된 인증서 지문을 배포 담당자가 전달한 값과 비교합니다.
3. 1_Install_AI_OneTouch_Beginner_Internal.bat을 관리자 권한으로 실행합니다.
4. 설치가 끝나면 바탕화면의 'AI One-touch Beginner' 바로가기를 더블 클릭합니다.
5. 바탕화면 바로가기가 보이지 않을 때는 시작 메뉴의 AI One-touch Beginner를 실행합니다.
6. 자세한 화면 설명과 Discord 연결 방법은 AI_OneTouch_v3.7_Beginner_Usage_Guide.html을 엽니다.

Discord 빠른 연결
1. Discord 왼쪽 + 버튼에서 봇을 사용할 서버를 만듭니다.
2. 런처의 '메신저 연결' > Discord > 'Discord Bot 설정 열기'를 누릅니다.
3. Developer Portal에서 Application과 Bot을 만든 뒤 Bot Token을 런처에 입력합니다. Client ID나 Application ID가 아닙니다.
4. Bot > Privileged Gateway Intents에서 Message Content Intent를 켭니다.
5. Discord 사용자 설정 > 고급 > 개발자 모드를 켜고 내 프로필에서 '사용자 ID 복사'를 누릅니다.
6. 복사한 숫자를 런처의 '허용 사용자 ID'에 넣습니다. 역할·채널·알림 채널 ID는 처음에는 비워도 됩니다.
7. Developer Portal > OAuth2 > URL Generator에서 bot, applications.commands를 선택합니다.
8. View Channels, Send Messages, Read Message History, Attach Files 권한을 선택하고 생성된 주소로 봇을 서버에 초대합니다.
9. 런처에서 '설정 저장' > '저장하고 연결'을 누르고 메인 화면에서 AI를 켭니다.
10. 서버 채널에서는 '@봇이름 안녕'처럼 멘션해서 사용합니다. DM은 멘션 없이 사용할 수 있습니다.

Discord 문제 해결
- 'PrivilegedIntentsRequired': Developer Portal에서 Message Content Intent를 켜고 다시 연결합니다.
- 봇이 서버에 없음: OAuth2 URL Generator로 봇을 해당 서버에 초대합니다.
- 봇이 오프라인: 런처에서 저장하고 연결한 뒤 메인 화면에서 AI를 켭니다.
- 온라인인데 답이 없음: @봇이름 멘션과 허용 사용자 ID를 확인합니다.
- Bot Token은 비밀번호이므로 화면 캡처·채팅·문서·GitHub에 올리지 마십시오. 노출 시 즉시 Reset Token을 실행합니다.

바탕화면 바로가기
- 설치 BAT가 현재 Windows 사용자의 바탕화면에 바로가기를 자동으로 만듭니다.
- 기존 설치 PC도 새 배포본의 설치 BAT을 다시 실행하면 바로가기가 생성됩니다.
- 제거 BAT을 실행하면 이 바로가기도 함께 삭제됩니다.

BAT 자체가 차단되는 경우
- Trust 폴더의 CodeSigning 인증서는 '로컬 컴퓨터 > 신뢰할 수 있는 사용자'와 '신뢰할 수 있는 게시자'에 설치합니다.
- 그 다음 MSIX 파일을 더블 클릭해 설치합니다.
- 인증서 지문이 package-info.json과 다르면 설치하지 마십시오.

제거
- 3_Remove_AI_OneTouch_Beginner_Internal.bat을 관리자 권한으로 실행합니다.
- 바탕화면의 AI One-touch Beginner 바로가기도 함께 삭제합니다.
- 다른 AI One-touch 패키지가 남아 있으면 공용 내부 인증서는 보존합니다.

문제가 생겼을 때
1. Windows를 재부팅하고 바탕화면 바로가기로 다시 실행합니다.
2. 새 ZIP을 새 폴더에 완전히 푼 뒤 설치 BAT을 관리자 권한으로 다시 실행합니다.
3. 그래도 실행되지 않으면 Reset_Tool_LMStudio.exe로 초기화한 뒤 설치 BAT을 다시 실행합니다.
4. 더 이상 사용하지 않을 때는 제거 BAT을 실행합니다.

업데이트
- 같은 인증서 개인 키로 더 높은 PackageVersion을 빌드하면 대상 PC에 인증서를 다시 설치할 필요가 없습니다.
- 개인 키를 잃으면 기존 설치와 동일 게시자로 업데이트할 수 없으므로 안전하게 백업하십시오.
Reset_Tool_LMStudio.exe
- v3.7 런처 실행 환경, Hermes 설정/기록/RAG 데이터와 LM Studio 환경을 정리할 때 사용합니다.
- 모델 삭제 여부는 도구 화면의 선택 사항을 따릅니다.
- MSIX LocalState와 이전 버전 가상 경로도 함께 확인합니다.
