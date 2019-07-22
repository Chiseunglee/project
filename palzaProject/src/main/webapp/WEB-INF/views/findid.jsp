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

</head>

<body>

 

 

<div class="container-fluid" style="width:510px;background-color: #eee;">

		<div class="row">

			<div class="col loginmain">

				<h1>아이디찾기</h1>

			</div>

		</div>

		<form name="findidcheck" action="findidcheck" method="post">

			<div class="row">

				<div class="col">

					<input type="text" class="form-control" id="name" name="name" placeholder="이름" style="font-size:21px; margin-bottom: 10px;">

					<input type="email" class="form-control" id="email" name="email" placeholder="E메일" style="font-size:21px; margin-bottom: 10px;">

				</div>

			</div>

			<div class="row " style="margin-top: 20px;">

				<div class="col">

					<input id="find" type="submit" value="찾기" class="form-control login-try">					

				</div>

			</div>

		</form>

	</div>

</body>

</html>