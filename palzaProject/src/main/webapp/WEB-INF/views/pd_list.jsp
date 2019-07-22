<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>MainPage</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="${path}/resources/mystyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${path}/resources/afterstyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<style>
a {
   color: #000000;
}
.btn-outline-success {
   color: #000000;
   border-color: #000000;
}
</style>
<script type="text/javascript">
   $(document).ready(function(){
      $('.cart_off').click(function(){
         var obj = $(this);
         var img_ = obj.children('img');
         var temp = obj.attr('pd_id');
         
         $.ajax({
            url: "${path}/cart_push",
            type: "post",
            data: { "id":  temp , "value": img_.attr('chk')},
            success: function(result){
               if(result=='push'){
                  img_.attr('src','${path}/resources/heart_full.png');
                  img_.attr('chk', 'full');
               }
               else if(result=='back'){
                  img_.attr('src','${path}/resources/heart_blank.png');
                  img_.attr('chk', 'blank');
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
</head>
<body>
   <div class="container">
      <div class="row header">
         <div class="col">
            <%@ include file="header.jsp"%>
            <%@ include file="category.jsp"%>
         </div>
      </div>
      <hr>
      <div class="row">
         <div class="col-sm">
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
                           <p class="text-center" style="width: 300px;z-index: 500; background-color: #F9F9F9; color: #000000; border-color: #F9F9F9;">
                      
                                        <button class="cart_off btn btn-primary" pd_id="${dto.pd_id}" type="button">
                                        <c:if test="${dto.id eq null}"><img src="resources/heart_blank.png" chk="blank" /></c:if>
                                        <c:if test="${dto.id ne null}"><img src="resources/heart_full.png" chk="full" /></c:if>
                                        </button>
                                       </p>
                        </li>
                     </ul>
                  
                  </div>
               </c:forEach>
            </div>
         </div>
      </div>
      <!-- paging -->
      <div style="display: flex; justify-content: center; margin-top: 15px;">
         <ul class="pagination">
            <c:if test="${paging.curPage eq 1 }">
               <li class="page-item disabled">
                  <a class="page-link" href="${path }/pd_list?cate_id=${paging.cate_id}&currentpage=${paging.curPage - 1}">Previous</a>
               </li>
            </c:if>
            <c:if test="${paging.curPage ne 1 }">
               <li class="page-item">
                  <a class="page-link" href="${path }/pd_list?cate_id=${paging.cate_id}&currentpage=${paging.curPage - 1}">Previous</a>
               </li>
            </c:if>
            <c:forEach var="i" begin="${paging.startPage }"   end="${paging.endPage }">
               <c:if test="${paging.curPage eq i }">
                  <li class="page-item active">
                     <a class="page-link" href="${path }/pd_list?cate_id=${paging.cate_id}&currentpage=${i}">${i }</a>
                  </li>
               </c:if>
               <c:if test="${paging.curPage ne i }">
                  <li class="page-item">
                     <a class="page-link" href="${path }/pd_list?cate_id=${paging.cate_id}&currentpage=${i}">${i }</a>
                  </li>
               </c:if>
            </c:forEach>
            <c:if test="${paging.curPage eq paging.totalPage }">
               <li class="page-item disabled">
                  <a class="page-link" href="${path }/pd_list?cate_id=${paging.cate_id}&currentpage=${paging.curPage + 1}">Next</a>
               </li>
            </c:if>
            <c:if test="${paging.curPage ne paging.totalPage }">
               <li class="page-item">
                  <a class="page-link" href="${path }/pd_list?cate_id=${paging.cate_id}&currentpage=${paging.curPage + 1}">Next</a>
               </li>
            </c:if>
         </ul>
      </div>
      <div class="row" style="margin-top: 50px;">
         <div class="col text-center p-5" style="background-color: #F9F9F9;">
            copy right
         </div>
      </div>
   </div>
</body>
</html>