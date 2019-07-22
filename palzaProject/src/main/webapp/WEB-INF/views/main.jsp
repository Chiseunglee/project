<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style>
a{
 color:#000000;
}
.btn-outline-success{
	color:#000000;
	border-color: #000000;
}
</style>
</head>
<body>
	<div class="container" >
		<div class="row header" >
			<div class="col" >
			<%@ include file="header.jsp" %>
			 <%@ include file="category.jsp" %>
			</div>
		</div>
		<hr>
		<div class="row">
			
			<div class="col-sm">
				<div class="row">
					<div class="col-sm-12 ">
						<div id="myslide" class="carousel slide" data-ride="carousel">
							<ul class="carousel-indicators">
								<li data-target="#myslide" data-slide-to="0" class="active"></li>
								<li data-target="#myslide" data-slide-to="1"></li>
								<li data-target="#myslide" data-slide-to="2"></li>
							</ul>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="${path}/resources/slide3.png" alt="광고1">
								</div>
								<div class="carousel-item">
									<img src="${path}/resources/slide2.png" alt="광고2">
								</div>
								<div class="carousel-item">
									<img src="${path}/resources/slide1.jpg" alt="광고 3">
								</div>
							</div>
							<a class="carousel-control-prev" href="#demo" data-slide="prev">
								<span class="carousel-control-prev-icon"></span>
							</a>
							<a class="carousel-control-next" href="#demo" data-slide="next">
								<span class="carousel-control-next-icon"></span>
							</a>
						</div>
					</div>
				</div>
				<hr>
				<div class="row cardmargin">
				             <c:forEach items="${list}" var="dto">
                  <div class="col" style="margin-top: 15px;">
                     <ul>
                        <li>
                           <div class="card" style="width: 300px; border: 0px;">
                              <a href="itemview?pd_id=${dto.pd_id}" class="btn btn-primary stretched-link" style="background-color: #F9F9F9; color: #000000; border-color: #F9F9F9;">
                                   <img class="card-img-top" style="width: 278px; height:200px; position: relative; top: 0px; left: 0px; z-index: 100; opacity: 1; transition: opacity 500ms linear 0s;"   src="/resources/${dto.img}" alt="Card image">
                                 <div class="card-body">
                                    <h4 class="card-title">${dto.pd_name}</h4>
                                    <p class="card-text">${dto.rg_id}</p>
                                    <span>가격: <fmt:formatNumber value="${dto.price}" pattern="#,###"/></span>
                                       
                                 </div>
                              </a>
                           </div>
                    
                        </li>
                     </ul>
                  
                  </div>
               </c:forEach>
				</div>
				</div>
								
			</div>
		</div>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>