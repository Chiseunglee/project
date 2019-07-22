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
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
               <h4>나의 장바구니 목록</h4><hr/>
            <div >
            <table class="table table-bordered text-center" style="width:80%; margin: 0 auto; vertical-align: middle;">
                  <thead>
                     <tr>
                        <th>NO</th>
                        <th>상품이미지</th>
                        <th>상품명</th>
                        <th>판매자</th>
                        <th>가격</th>
                        <th>등록날짜</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${list}" var="dto">
                     <tr>
                        <td>${dto.rnum }</td>
                        <td style="width:80px"><img src="/resources/${dto.img }"
                           style="width: 60px; height: 60px;"></td>
                        <td style="text-weight:bold">${dto.pd_name}</td>
                        <td>${dto.rg_id}</td>
                        <td><fmt:formatNumber value="${dto.price}"
                              pattern="#,###"/>원</td>
                        <td> ${dto.rg_date}</td>
                        
                     </tr>
                     </c:forEach>
                  </tbody>
               </table> 
               </div>        
            </div>
         </div>
      
   
            
      <%@ include file="footer.jsp" %>
   </div>
</body>
</html>