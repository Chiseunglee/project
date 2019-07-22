<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>MainPage</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="${path}/resources/mystyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${path}/resources/afterstyle.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
    //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
$('document').ready(function(){
	$('#find').click(function(){
		daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	                $('.address1').val(data.address);
	                $('.address2').val(data.zonecode);
	            }
	        }).open();
	    });
	});
}) ;
    
</script> 
<style>

</style>
</head>
<body style="background-color: #eee">
	<div class="container-fluid" style="width: 40%;background-color: #ffffff">
		<div class="row header" >
			<div class="col ">
				<a href="main" ><img class="imglogo" src="resources/main1.png" ></a>
			</div>
		</div>
		<hr>
		<div class="row ">
			<div class="col">
				<h1 class="jointitle">Palza 회원가입</h1>
			</div>
		</div>
		
		<form name="joined" action="joined" method="POST">
			<div class="row">
				<div class="col">
				<h3>필수정보</h3>
					<input type="text" class="form-control joinbox" name="id" placeholder="Palza 아이디" maxlength="20" >
					<input type="password" class="form-control joinbox" name="pw" placeholder="비밀번호" style="font-family:initial;font-size:21px; margin-bottom: 10px;" >
					<input type="password" class="form-control joinbox" name="pwchk" placeholder="비밀번호확인" style="font-family:initial;font-size:21px; margin-bottom: 10px;" >
					<input type="text" class="form-control joinbox" name="name" placeholder="이름" >
					<input type="email" class="form-control joinbox" name="email" placeholder="이메일" >
					<input type="text" class="form-control joinbox address2" name="address1" placeholder="번지 주소" style="width:85%;display:inline;">
					<input type="button" id="find" class="form-control joinbox" name="address" style="width:100px;display:inline;background-color: #99FF99;" value="주소찾기">
					<input type="text" class="form-control joinbox address1" name="address2" placeholder="도로명 주소" >
					<input type="text" class="form-control joinbox address" name="address3" placeholder="상세 주소" >
					<input type="tel" class="form-control joinbox" name="tel" placeholder="전화번호" >
					<input type="submit" class="form-control login-try" value="회원가입 완료">
				</div>
			</div>
			
			
		</form>
		<%@ include file="footer.jsp" %>
		
	</div>

</body>
</html>