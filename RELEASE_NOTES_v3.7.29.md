# AI One-touch v3.7.29

처음 사용하는 사람을 위한 화면을 유지하면서 GPU 교체 감지, 16GB GPU 모델 선택과 화면 상태 표시를 안정화한 최신 초보자용 배포본입니다.

## 주요 변경 사항

- GPU 이름·VRAM 변경 감지와 모델 권장값 재평가
- 16GB급 GPU에서 Gemma 4 12B와 Gemma 4 26B A4B IT QAT 선택
- Gemma 4 26B QAT의 GPU 우선 실행과 65K 컨텍스트
- 시작 직후 잘못된 실행 상태가 보이던 현상 수정
- 한·영 전환 시 문구가 순간적으로 섞이던 현상 수정
- 문서 RAG, 다운로드 진행 상태 및 재실행 복구 보강

## 설치

저장소에서 **Code → Download ZIP**을 선택하고 압축을 푼 뒤 `downloads/v3.7.29` 폴더의 `1_Install_AI_OneTouch_Beginner_Internal.bat`을 관리자 권한으로 실행하세요.

처음 설치하는 PC에서는 함께 제공되는 공개 인증서를 등록하기 위해 관리자 권한이 필요합니다. 서명용 개인키는 배포 파일에 포함되어 있지 않습니다.

자세한 사용법은 `downloads/v3.7.29/AI_OneTouch_v3.7_Beginner_Usage_Guide.html`을 확인하세요.

## 파일 검증

- MSIX SHA-256: `485806F166F5616F6438888BB354918387EBE76C3BF933A7B7A249E116351E1D`
- Reset Tool SHA-256: `BF2E06923679F1A7BFBAA53E9477A3A4DC40F1E89D26FC66D043DFF25301A872`
- 인증서 지문: `8CC6F5032FF17B38DA3D4676916ECE159DFCF24C`
