<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	</head>

	<body>
	<c:set var="path" value="${pageContext.request.contextPath }" />
				<div class="navbar navbar-light " style="background-color: #F9F9F9;height:200px;">  
					<div class="col-sm-3"><a class="navbar-brand" href="main"><img  class="imgmain" src="resources/main.png"></a></div>
					
					<div class="col-sm-9 d-none d-md-block ">
						<div class="row-sm" style="margin-bottom: 50px;">
						<ul class="nav justify-content-end">
							<c:choose>
								<c:when test="${empty sessionScope.mId}">
									<li class="nav-item"><a class="nav-link active"
									href="javascript:window.open('login', '_blank', 'width=510,height=600,left=700,top=200');">로그인</a></li>
									<li class="nav-item"><a class="nav-link" href="join">회원가입</a></li>
									<li class="nav-item"><a class="nav-link" href="board">고객센터</a></li>									
								</c:when>
								<c:when test="${not empty sessionScope.mId}">
									<li class="nav-item"><a class="nav-link active"	href="logout">로그아웃</a></li>
									<li class="nav-item"><a class="nav-link" href="mypage?id=${sessionScope.mId}">마이페이지</a></li>
									<li class="nav-item"><a class="nav-link" href="additem">상품등록</a></li>
									<li class="nav-item"><a class="nav-link" href="cartitem">장바구니</a></li>
								</c:when>
							</c:choose>
						</ul>
						</div>
						<div class="row-sm">
							<form class="form-inline justify-content-center" style="margin-left: -100px; ">
								<input class="form-control mr-sm-2 " style="width:400px;  display: inline;" type="search" placeholder="Search" aria-label="Search">
								<button style="display: inline" class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
							</form>
						</div>
						
					</div>
					
					<div class="d-none d-sm-block d-md-none dropdown">
						<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Dropdown button
						</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="#">Action</a>
							<a class="dropdown-item" href="#">Another action</a>
							<a class="dropdown-item" href="#">Something else here</a>
						</div>
					</div>
				</div>


</body>
</html>