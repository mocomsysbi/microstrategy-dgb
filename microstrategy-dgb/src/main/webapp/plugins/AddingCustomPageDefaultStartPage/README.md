# DGB 커스터마이징 웹

DeskTop 페이지 커스터마이징
/webapp/plugins/AddingCustomPageDefaultStartPage/WEB-INF/xml/pageConfig.xml

### 2019-01-31 개발 완료 및 서버 적용방법
  1. 환경파일 설정
  	 /src/resources/mstr.properties (환경파일 설정)
     MSTR 서버, 프로젝트명
  
  2. 로그인 모드 변경
	/servlet/mstrWebAdmin 접속
  	기본값 속성 - 로그인 모드 변경(트러스트된 인증 요청)
  	
  3. MSTR 사용자 트러스트 인증 변경
  	사용자 - 신뢰된 인증요청(사용자 ID 입력)
  
  4. 서버 트러스트 관계 설정
  	서버 - 트러스트 관계 설정
  	I 서버 환경 설정 - SSO 구성 URL 확인
 
  5. Web 배포
  	Jeus 배포(JAVA 1.8)
  	
  6. 환경파일 토큰 설정 
	배포위치\WEB-INF\xml\211-MSTR1-PSH.token 값 확인
	/src/resources/mstr.properties (환경파일 설정) 토큰 값 변경

  7. ROOT 폴더 설정
  	/webapp/plugins/AddingCustomPageDefaultStartPage/jsp/Desktop_Content.jsp
  	26번째 라인 ROOT 폴더 지정 (예 : 공용개체/리포트)

### 기본 화면설명
  1. 기본 로그인시 ROOT 폴더 1뎁스 구조 가져옴
  2. 폴더 클릭시 1뎁스씩 가져오는 구조(ajax 비동기)