<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>fastcampus</title>
  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: "Noto Sans KR", sans-serif;
    }
    .container {
      width : 50%;
      margin : auto;
    }
    .writing-header {
      position: relative;
      margin: 20px 0 0 0;
      padding-bottom: 10px;
      border-bottom: 1px solid #323232;
    }
    input {
      width: 100%;
      height: 35px;
      margin: 5px 0px 10px 0px;
      border: 1px solid #e9e8e8;
      padding: 8px;
      background: #f8f8f8;
      outline-color: #e6e6e6;
    }
    textarea {
      width: 100%;
      background: #f8f8f8;
      margin: 5px 0px 10px 0px;
      border: 1px solid #e9e8e8;
      resize: none;
      padding: 8px;
      outline-color: #e6e6e6;
    }
    .frm {
      width:100%;
    }
    .btn {
      background-color: rgb(236, 236, 236); /* Blue background */
      border: none; /* Remove borders */
      color: black; /* White text */
      padding: 6px 12px; /* Some padding */
      font-size: 16px; /* Set a font size */
      cursor: pointer; /* Mouse pointer on hover */
      border-radius: 5px;
    }
    .btn:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<div id="menu">
  <ul>
    <li id="logo">fastcampus</li>
    <li><a href="<c:url value='/'/>">Home</a></li>
    <li><a href="<c:url value='/board/list'/>">Board</a></li>
    <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
    <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
    <li><a href=""><i class="fa fa-search"></i></a></li>
  </ul>
</div>
<script>
  let msg = "${msg}";
  if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
  if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");

</script>
<div class="container">
  <h2 class="writing-header">게시판 ${mode=="new" ? "글쓰기" : "읽기"}</h2>
  <form id="form" class="frm" action="" method="post">
    <input type="hidden" name="bno" value="${boardDto.bno}">

    <input name="title" type="text" value="<c:out value='${boardDto.title}'/>" placeholder="  제목을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><br>
    <textarea name="content" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><c:out value="${boardDto.content}"/></textarea><br>

    <c:if test="${mode eq 'new'}">
      <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 등록</button>
    </c:if>
    <c:if test="${mode ne 'new'}">
      <button type="button" id="writeNewBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 글쓰기</button>
    </c:if>
    <c:if test="${boardDto.writer eq loginId}">
      <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i> 수정</button>
      <button type="button" id="removeBtn" class="btn btn-remove"><i class="fa fa-trash"></i> 삭제</button>
    </c:if>
    <button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>
  </form>
</div>
<br>
<br>
<div id="comment_container" class="comment_frm" action="" method="post" style="padding-left: 25%">
<%--  <form id="comment_form" class="comment_frm" action="" method="post" style="padding-left: 25%">--%>
    <c:forEach var="comment" items="${commentList}">
      <div data-commenter="${comment.commenter}" data-cno="${comment.cno}" data-pcno="${comment.pcno}">
      작성자 :
      <input name="cmt" type="text" data-bno="${comment.bno}" style="width: 300px" value="<c:out value='${comment.commenter}'/>" readonly="readonly"><br>
      <textarea name="cmt_content" style="width: 600px" rows="5" readonly="readonly"><c:out value='${comment.comment}'/></textarea><br>
      <button type="button" id="cmt_modifyBtn" class="btn cmt-modify"><i class="fa fa-edit"></i> 수정</button>
      <button type="button" id="cmt_removeBtn"  class="btn cmt-remove"><i class="fa fa-trash"></i> 삭제</button>
      <button type="button" id="cmt_replyBtn" class="btn cmt-reply"><i class="fa fa-reply"></i> 답글</button>
      <br>
      <br>
      </div>
    </c:forEach>
<%--  </form>--%>
    <div>
      <form id="new_comment_form" class="comment_frm" action="" method="post">
        <textarea name="newCmt_content"style="width: 600px" rows="5" placeholder="당신의 소중한 댓글을 입력해주세요"></textarea><br>
      </form>
    </div>
    <div>
      <button type="button" id="cmtBtn" class="btn cmt-write" style="font-size: 20pt;width: 150pt;height: 60pt">댓글 등록</button>
    </div>
</div>

<script>

  $(document).ready(function(){

    let formCheck = function() {
      let form = document.getElementById("form");
      if(form.title.value=="") {
        alert("제목을 입력해 주세요.");
        form.title.focus();
        return false;
      }
      if(form.content.value=="") {
        alert("내용을 입력해 주세요.");
        form.content.focus();
        return false;
      }
      return true;
    }
    // 게시글 함수 영역
    $("#writeNewBtn").on("click", function(){
      location.href="<c:url value='/board/write'/>";
    });
    $("#writeBtn").on("click", function(){
      let form = $("#form");
      form.attr("action", "<c:url value='/board/write'/>");
      form.attr("method", "post");
      if(formCheck())
        form.submit();
    });
    $("#modifyBtn").on("click", function(){
      let form = $("#form");
      let isReadonly = $("input[name=title]").attr('readonly');
      // 1. 읽기 상태이면, 수정 상태로 변경
      if(isReadonly=='readonly') {
        $(".writing-header").html("게시판 수정");
        $("input[name=title]").attr('readonly', false);
        $("textarea").attr('readonly', false);
        $("#modifyBtn").html("<i class='fa fa-pencil'></i> 등록");
        return;
      }
      // 2. 수정 상태이면, 수정된 내용을 서버로 전송
      form.attr("action", "<c:url value='/board/modify${searchCondition.queryString}'/>");
      form.attr("method", "post");
      if(formCheck())
        form.submit();
    });
    $("#removeBtn").on("click", function(){
      if(!confirm("정말로 삭제하시겠습니까?")) return;
      let form = $("#form");
      form.attr("action", "<c:url value='/board/remove${searchCondition.queryString}'/>");
      form.attr("method", "post");
      form.submit();
    });
    $("#listBtn").on("click", function(){
      location.href="<c:url value='/board/list${searchCondition.queryString}'/>";
    });

    // 댓글 함수 영역
    let bno = ${boardDto.bno};
    let pcno = null;

    $("#cmtBtn").click(function () {
      let comment = $("textarea[name=newCmt_content]").val();

      if (comment.trim() == '') {
        alert("댓글을 입력해주세요");
        $("textarea[name=newCmt_content]").focus()
        return;
      }

      $.ajax({
        type: 'POST',       // 요청 메서드
        url: '/ch4/comments?bno=' + bno,  // 요청 URI
        headers: {"content-type": "application/json"}, // 요청 헤더
        data: JSON.stringify({pcno: pcno,bno: bno, comment: comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
        success: function (result) {
          alert(result);
          location.reload()
        },
        error: function () {
          alert("error")
        } // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()
      pcno = null;
    });

    $("#comment_container").on("click", "#cmt_removeBtn", function () {
      let cno = $(this).parent().attr("data-cno")

      $.ajax({
        type: 'DELETE',       // 요청 메서드
        url: '/ch4/comments/' + cno + '?bno=' + bno,  // 요청 URI
        success: function (result) {
          alert(result);       // result는 서버가 전송한 데이터
          location.reload();
        },
        error: function () {
          alert("error")
        } // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()
    });

    $("#comment_container").on("click", "#cmt_modifyBtn", function () {

      let isReadonly = $(this).parent().children("textarea").attr('readonly');

      // 1. 읽기 상태이면, 수정 상태로 변경
      if(isReadonly) {
        $(this).parent().children("textarea").attr('readonly', false);
        $(this).html("<i class='fa fa-pencil'></i> 수정 제출");
        return;
      }
      // 2. 수정 상태이면, 수정 내용을 담아 서버에 전송
      let comment = $(this).parent().children("textarea").val();
      let cno = $(this).parent().attr("data-cno");

      console.log(comment);
      console.log(cno);

      if (comment.trim() == '') {
        alert("댓글을 입력해주세요");
        $("input[name=comment]").focus()
        return;
      }

      $.ajax({
        type: 'PATCH',       // 요청 메서드
        url: '/ch4/comments/' + cno,  // 요청 URI
        headers: {"content-type": "application/json"}, // 요청 헤더
        data: JSON.stringify({cno: cno, comment: comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
        success: function (result) {
          alert(result);
        },
        error: function () {
          alert("error")
        } // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()
      $(this).parent().children("textarea").attr('readonly', true);
      $(this).html("<i class='fa fa-pencil'></i> 수정");
    });

    $("#comment_container").on("click", "#cmt_replyBtn", function () {
      // 1. 답글을 누르면, 댓글 입력 폼에 @작성자 표시
      let commenter = $(this).parent().attr('data-commenter');

      $("textarea[name='newCmt_content']").val("@" + commenter + " ");
      $("textarea[name='newCmt_content']").focus();

      pcno = $(this).parent().attr('data-pcno');
      // 댓글 등록을 누르면 pcno가 담겨서 서버에 전송
    });
  });

</script>
</body>
</html>