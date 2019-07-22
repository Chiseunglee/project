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
<script>
$(document).ready(function(){
	$('#cancel').click(function(){
		window.location.href="${path}/main";
	});
});
</script>
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
		<div class="container" style="background-color: #eee;">
		<form action="additemed" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col">
					<h2>상품등록</h2>
					<hr/>
					<h5>상품명 </h5>
					<input type="text" class="form-control" name="pd_name">
					<h5>판매가격 </h5>
					<input type="text" class="form-control" name="price" placeholder="(원은 제외)">
					<div class="form-group">
					  <label for="sel1">카테고리 : </label>
					  <select class="form-control" name="categories">
					    <option value="1">의류</option>
					    <option value="2">가전</option>
					    <option value="3">가구</option>
					    <option value="4">전자</option>
					    <option value="5">도서</option>
					    <option value="6">생활</option>
					    <option value="7">미용</option>
					    <option value="8">잡화</option>					   
					  </select>
					</div>
					<h5>상품 내용</h5>
					<textarea class="form-control" name="pd_desc" rows="5"></textarea>
					<h5>해시태그(원하는태그를달아주세요)</h5>
					<input type="text" class="form-control" name="해시태그" placeholder="#comment/#comment">
					<h5>파일첨부</h5>
					<input type="file" class="form-control" name="file1" placeholder="file">
					<hr/>
					<input type="submit"  value="상품 등록" class="form-control additem">
					<input type="reset" id="cancel" value="상품 취소" class="form-control additem">					
				</div>
			</div>
		</form>
		</div>	
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>