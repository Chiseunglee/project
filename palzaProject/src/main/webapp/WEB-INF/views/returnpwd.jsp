<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<html>

<head>

<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" href="${path}/resources/mystyle.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<link rel="stylesheet" href="${path}/resources/afterstyle.css">

<title>Insert title here</title>

</head>

<body>

 

<div class="container-fluid" style="width:510px;background-color: #eee;">

      <div class="row">

         <div class="col loginmain">

            <h1>비밀번호 조회 결과</h1>

         </div>

            

      </div>

      

   </div>

   

   <div class="container-fluid" style="width:510px;">

      <div class="row" style="margin-top: 20px;">         
         <div class="col text-center">   
            <h1>회원님의 비밀번호는<br>${findpwdcheck}입니다.</h1>
         </div>
      </div>
      <div class="row">
         <div class="col">
            <form action="login">
               <input type = "submit" class= "form-control login-try" value = "로그인화면으로">
            </form>   
         </div>
      </div>
   </div>

 

</body>

</html>