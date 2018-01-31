<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="${root}/css/bootstrap.min.css">
<link rel="stylesheet" href="${root}/css/footer.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script type="text/javascript">
root = "${root}";
</script>

<script type="text/javascript">
function searchArticle() {
	document.getElementById("searchForm").action = "${root}/main/search.tfarm";
	document.getElementById("searchForm").submit();
}
</script>

<title>Insert title here</title>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="${root}/user/home.tfarm">TIFARM</a>
  <button class="navbar-toggler collapsed " type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation" style="">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="navbar-collapse collapse" id="navbarColor01" style="">
 
    <c:if test="${userInfo != null}">
    	 <ul class="navbar-nav mr-auto navbar-right" >
	      <li class="nav-item active">
	        <a class="nav-link" href="#">${userInfo.mem_name}님 안녕하세요</a>
	      </li>
	      <c:if test="${userInfo.mem_state == 1}">
	        <li class="nav-item">
	        	<a class="nav-link" href="${root}/admin/adminpage.tfarm"><i class="fa fa-cogs" aria-hidden="true"></i></a>
	      	</li> 
	      </c:if>
	      <li class="nav-item">
	      	<c:if test="${userInfo.mem_social == 0}">
	        	<a class="nav-link" href="${root}/user/pwcheck.tfarm">마이페이지</a>
	        </c:if>
	        <c:if test="${userInfo.mem_social != 0}">
	        	<a class="nav-link" href="${root}/user/socialmypage.tfarm">마이페이지</a>
	        </c:if>
	      </li>  

	      <li class="nav-item">
	        <a class="nav-link" href="${root}/user/logout.tfarm">로그아웃</a>
	      </li>   
	    </ul>
    </c:if>
    
    <c:if test="${userInfo == null}"> 
	    <ul class="navbar-nav mr-auto navbar-right" >
	      <li class="nav-item active">
	        <a class="nav-link" href="${root}/user/login.tfarm">로그인</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${root}/user/join.tfarm">회원가입</a>
	      </li>
	    </ul>
    </c:if>
    <!-- 검색 부분 -->
    <form id="searchForm" name="searchForm" method="get" action="" class="form-inline my-2 my-lg-0">
      <input type="hidden" id="pg" name="pg" value="1">
      <input type="hidden" id="key" name="key" value="subject">
      
      <div class="form-group" style="float:left; margin-right: 6px;">
		<div style="float:left;">   
		    <select id="bcode" name="bcode" class="custom-select">
		
		      <option value="4" selected="selected">뮤지컬</option>
		      <option value="5">콘서트</option>
		      <option value="6">연극</option>
		      <option value="7">클래식/무용</option>
		      <option value="8">스포츠/레저</option>
		      <option value="9">전시/행사</option>
		      <option value="10">아동/가족</option>
		    </select>
		</div>    
	</div>   
      <input class="form-control mr-sm-2" id="word" name="word" type="text" placeholder="Search">
      <button class="btn btn-secondary my-2 my-sm-0" type="button" onclick="javascript:searchArticle();">Search</button>
    </form>
    <!-- 검색 부분 끝-->
  </div>
</nav>
</head>

<body>
<!-- ************************왼쪽 목록**************************** -->
<div class="row" style="margin-bottom:200px">
	<div class="list-group col-xl-2" style="float:left; padding-top:25px;" >
		<%@ include file="/sidebar/boardmenu.jsp" %>
	</div>