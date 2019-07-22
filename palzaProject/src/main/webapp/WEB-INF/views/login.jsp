<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>MainPage</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="${path}/resources/mystyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="${path}/resources/afterstyle.css">
<style>
.btn-outline-success{
	color:#000000;
	border-color: #000000;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#login').click(function(){
			var id_frm = $('#id').val();
			var pw_frm = $('#pw').val();
			$.ajax(   {
				url: "logined",
				data: { "id":id_frm , "pw" : pw_frm },
				method : "post",
				success : function(result){
// 					alert("통신성공"+result);
					result = $.trim(result);
					if (result == 'logined')
					{
						alert('로그인 성공');
						opener.location.reload();
						window.close();
					}else
					{
						$('#id').val('');
						$('#pw').val('');
						alert('아이디 패스워드 확인 하세요.');	
					}
				},
				error : function(){
					alert("통신에러");
				}
				
			}   );
		});
	});
</script>
</head>
<body>
	<div class="container-fluid" style="width:510px;background-color: #eee;">
		<div class="row">
			<div class="col loginmain">
				<h1>로그인</h1>
			</div>
		</div>
		<form name="logined" action="logined" method="post">
			<div class="row">
				<div class="col">
					<input type="text" class="form-control" id="id" name="id" placeholder="Palza 아이디" style="font-size:21px; margin-bottom: 10px;">
					<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호" style="font-family:initial;font-size:21px; margin-bottom: 10px;">
				</div>
			</div>
			<div class="row" style="display:inline-block; margin-left: 6px;">
				<div class="col">
					<input type="checkbox" class="form-check-input" id="idchk">아이디 저장
				</div>
			</div>
			<div class="row " style="margin-top: 20px;">
				<div class="col">
					<input id="login" type="button" value="로그인" class="form-control login-try">					
				</div>
			</div>
			<div class="row ">
				<div class="col login-find" >
					<a href="javascript:window.open('findid', '_blank', 'width=510,height=600,left=700,top=200');" onclick="location.href='findid'">아이디 찾기</a>
					<a href="javascript:window.open('findpwd', '_blank', 'width=510,height=600,left=700,top=200');" onclick="location.href='findpwd'">비밀번호 찾기</a>
					<a href="#" onclick="javascript:opener.location.href='join';self.close();">회원가입</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>