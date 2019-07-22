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


<script type="text/javascript">
$(document).ready(function(){
   $('.cart_off').click(function(){
      var obj = $(this);
      var img_ = obj.children('img');
      var span = obj.children('span');
      var temp = obj.attr('pd_id');
      
      
      $.ajax({
         url: "${path}/cart_push",
         type: "post",
         data: { "id":  temp , "value": img_.attr('chk')},
         success: function(result){
            if(result=='push'){
               img_.attr('chk', 'full');
               span.text('장바구니 담김');
               img_.attr('src','${path}/resources/check.png');
            }
            else if(result=='back'){
               img_.attr('chk', 'blank');
               span.text('장바구니');
               img_.attr('src','${path}/resources/basket.png');
            }
            else{
               alert("로그인이 필요합니다");
            }
         },
         error : function(e){
            alert(e.status);
         }
      }) 
      
      
      
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

   <div class="container">

      <div class="row header" >

         <div class="col" >

         <%@ include file="header.jsp" %>

            <%@ include file="category.jsp" %>

         </div>

      </div>

      <hr>   
		 <form action="buyitem" method="POST">
           		<input  type="hidden" name="id" value="${sessionScope.mId}">
           		<input type="hidden" name="pd_id" value="${item.pd_id}">
         <div class="row" style="margin-left: 20px;">

           <div class="col-sm-4 justify-content-center" >
           		

               <img src="/resources/${item.img}" align="right" style="width:100%">

            </div>

            <div class="col-sm-8" >

            <div>

               <ul class="itemlist">

                  <li><h2>${item.pd_name}</h2></li>

                  <li style="margin-top: 40px;">판매자 :${item.rg_id} </li>

               </ul>

            </div>

            <hr />

            <div>

               <ul class="itemlist">

                  <li>판매가: <fmt:formatNumber value="${item.price}"

                        pattern="#,###"/> 원

                  </li>

               </ul>

            </div>

            <hr />

            <div>

               <ul class="itemlist">

               <li>상품내용 :  ${item.pd_desc}</li>

               </ul>

            </div>

            <hr />

            <ul class="itemlist">

               <li><a style="font-size: 18px; color: blue;" id="HashTag">해시태그란</a>

                 </li>

            </ul>
			
            <ul>

             <li>
             	
					<input style="width:150px; height:60px; margin-left: 20px; background-color: #99CCFF;" type="submit" class="btn btn-info" value="구매하기">    
            	

          <button style="width:150px; height:60px;  margin-left: 20px; background-color: #99CCFF;" type="button" pd_id="${item.pd_id}"  class="cart_off btn btn-info">
            <c:if test="${item.id eq null}"><img style="margin-left: -20px; margin-right: 12px;" chk="blank" src="resources/basket.png"/><span class="cart">장바구니</span></c:if>
            <c:if test="${item.id ne null}"><img style="margin-left: -8px;" src="resources/check.png" chk="full"/><span class="cart">장바구니 담김</span></c:if>
         </button>
               </li>               
            </ul>
			
         </div>
			
 

      </div>
	</form>
  
	
            

      <%@ include file="footer.jsp" %>

   
 </div>
</body>

</html>

 

 

 

