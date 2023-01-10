<div align=center> 
    <h1> 📘 Spring 및 MyBatis를 활용한 게시판 제작 </h1>
</div>
<p align="center"> 
  <img src="https://user-images.githubusercontent.com/101246806/206644063-72efe15c-5d7f-4318-9dcd-2f7bc33264c6.png" width= "800"/>
</p>
<div align=center> 
  <div align=left>
  <h3> - Spring / MyBatis를 활용한 첫 프로젝트입니다. (Maven 기반) <br/>
       - Spring MVC 패턴 / DI / AOP 등 주요 개념 총 학습하여 활용했습니다. <br/> 
       - 쿠키와 세션을 로그인 상태 유지에 활용하였습니다. <br/>
       - JSP / Jquery / Ajax를 활용한 뷰 제작을 진행했습니다.
    <h3>
    </div>
</div>

# 💨 구현한 기능
### - 로그인 기능
<p align="left"> 
  <img src="https://user-images.githubusercontent.com/101246806/211679708-ccba339c-567a-44d2-8c83-d87cffe990e3.gif">
</p>

- **로그인하지 않은 상태에서 게시판**으로 이동하려하면 로그인 페이지로 이동됩니다.
- 이메일이 DB에 존재하지 않거나, 해당 이메일의 비밀번호가 일치하지 않으면 위처럼 **에러 메시지를 출력**합니다.
- ‘아이디 기억’ **체크박스**에 체크를 하고 로그인을 하면
- 다음부터 로그인 페이지에 다시 도착하면, 해당 이메일이 그대로 표시된 상태로 나옵니다.
- 로그인 성공 시, 메인 Home 페이지로 이동되며 **상단 바**에 ID=(로그인한 ID)로 표시됩니다.
- 로그인한 상태에서, 해당 ID=(로그인한 ID) 버튼을 누르면 **로그아웃**이 되어 홈으로 이동됩니다.

 <br/>

### - 게시글 CRUD
<p align="left"> 
  <img src="https://user-images.githubusercontent.com/101246806/211679917-7290be45-e003-4e23-b218-e56843024290.gif">
</p> 

- 글쓰기, 수정, 삭제 등 게시판의 기본 CRUD를 구현하였습니다.

 <br/>

### - 댓글 / 대댓글 기능
<p align="left"> 
  <img src="https://user-images.githubusercontent.com/101246806/211680021-2c4f180b-226e-4a2d-bc3e-4ed6f20d0b0b.gif">
</p> 

- **빈 댓글** 내용을 입력 후, 댓글 등록 버튼을 누를 시, ‘댓글을 입력해주세요’ 메시지가 호출됩니다.
- 기본적인 댓글 등록, 수정, 삭제를 구현하였습니다.
- **답글 버튼**을 누르면 댓글 입력 폼에 ‘**@답글을 달 작성자명** ’ 문자열이 자동으로 추가됩니다.

 <br/>

### - 글 검색 기능
<p align="left"> 
  <img src="https://user-images.githubusercontent.com/101246806/211680166-530f97a3-fec8-4a6b-8048-5064534fd88b.gif">
</p> 

- “제목 + 내용 / 제목만 / 작성자명”으로 구분지어 포함하는 게시글만 검색 가능합니다.

<div align="center"> 
    <h3> 프로젝트 기간 : 2022.06.01 ~ 2022.06.14 </h3>
</div>
<br/>
  
# :sparkler: 기술스택
<p align="left"> 
  <img src="https://user-images.githubusercontent.com/101246806/206646238-05a8c4ad-e510-4378-bf0a-e08da0ec8a24.png" width= "400"/>
</p>
  
<br/>

