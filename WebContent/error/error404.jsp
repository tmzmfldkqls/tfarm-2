<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String root = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 
	<link rel="stylesheet" href="<%= root %>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=root%>/css/footer.css">
  </head>
  <body>
	<center>
		<div style="padding-bottom: 50px;">
		  		<img alt="404" src="<%=root%>/img/main_img.png" class="" style="width:200px; height:150px; margin-bottom: 70px;">		
		  <div style="border: 3px solid darkkhaki; width:80%;">	 
		<%-- 	  <h4>
			  	<Strong>
			 	 	<img alt="404" src="<%=root%>/img/error404.jpg" class="" style="width:200px; height:200px">
			 	 	페이지 주소가 잘못 입력되었거나 찾을 수 없는 페이지 입니다.
			  	</Strong>
			  </h4> 
			  <div style="color:red;">	  	
			  	<p>대한민국 No.1 티켓 TFARM</p>
			  </div> --%>
			  <img alt="404" src="<%=root%>/img/error404.jpg" class="" style="width:100%; height:400px">
		  </div>
		</div>
		<p class="lead" style=" text-align: center;">
			<a class="btn btn-primary btn-lg" role="button" href="#">메인으로</a>
		</p> 
	</center>
  </body>
</html>
    