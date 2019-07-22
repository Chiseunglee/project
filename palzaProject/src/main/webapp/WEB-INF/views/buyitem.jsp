<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style>
a{
 color:#000000;
}
.btn-outline-success{
	color:#000000;
	border-color: #000000;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#doview').click(function(){
			$('#frm').attr("action","/ex/itemview");
			$('#frm').submit();
		});
	});
</script>
</head>
<body>

	<div class="container">
		<div class="row header" >
			<div class="col" >
			<%@ include file="header.jsp" %>
				<%@ include file="category.jsp" %>
			</div>
		</div>
		<hr>		
      		<div class="row">
      			<div class="col">
      			
					<h4>배송정보</h4>
					<hr />
					<ul class="itemlist">
                	  <li>주문자 : ${custom.id} </li>
               		  <li style="margin-top: 40px;">연락처 : ${custom.tel } </li>
              		</ul>
              		<ul class="itemlist">
                	  <li>배송지 주소 : ${custom.address } </li>
               		  <li style="margin-top: 40px;">도로명 주소 : </li>
               		  <li style="margin-top: 40px;">상세 주소 : </li>
              		</ul>              	
				</div>
			</div>

			<form id="frm">
				<input type="hidden" name="pd_id" value="${seller.pd_id }"/>
				<input type="hidden" name="pd_name" value="${seller.pd_name }"/>
			<div style="margin-top: 100px;">
			
				<h4>주문상품 정보</h4><hr/>
				<div class="table-responsive-sm">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>상품이미지</th>
								<th>상품명</th>
								<th>판매자</th>
								<th>가격</th>
								<th>상세정보</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><img src="/resources/${seller.img }"
									style="width: 60px; height: 60px;"></td>
								<td style="font-size: 20px;">${seller.pd_name}</td>
								<td style="font-size: 20px;">${seller.rg_id}</td>
								<td style="font-size: 20px; color: red;"> 
								<fmt:formatNumber value="${seller.price}" pattern="#,###" />원
								</td>								
								<td><input id="doview" style="background-color: #99CCFF;" class="btn btn-primary"  type="button" value="보러가기"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			</form>

			<div>
				<button style="margin-left: 20px; background-color: #99CCFF;"  type="button" class="btn btn-info">주문서로
					넘어가는 구매하기</button>
			</div>
   
				
		<%@ include file="footer.jsp" %>
	</div>

</body>
</html>