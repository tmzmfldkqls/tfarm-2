<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>

<div class="col-xl-10" style="float:left; width:100%; padding-top:25px;">
<div class="container">
 
  <br>
  <!-- Nav pills -->
  <ul class="nav nav-pills" role="tablist">
  	<li class="nav-item">
      <a class="nav-link"><b>마이페이지</b></a>
    </li>
    <li class="nav-item">
      <a class="nav-link active" data-toggle="pill" href="#home">홈</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#menu1">회원정보수정</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#menu2">비밀번호 변경</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#menu3">통계?</a>
    </li>
  </ul>

   <!-- Tab panes -->
   <div class="tab-content" style="margin-top:  60px;">
    <div id="home" class="container tab-pane active card" style="border:  0px;">
     	<div class="container-fluid bg-3 text-center" style="border:3px solid black">    
		  <div class="row">
		    <div class="col-sm-3">
		      <p>Some text..</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		    <div class="col-sm-3"> 
		      <p>Some text..</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		    <div class="col-sm-3"> 
		      <p>Some text..</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		    <div class="col-sm-3">
		      <p>Some text..</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		  </div>
		</div>
		
	<div style="margin-top:20px;">
		 <span class="badge badge-pill badge-primary" style="width: 50%;font-size:  100%;">E-Mail</span>
		${userInfo.mem_email1} @ ${userInfo.mem_email2}
		전화번호
		${userInfo.mem_tel1} - 	${userInfo.mem_tel2} - ${userInfo.mem_tel3}
	</div>
    </div>
    
    <div id="menu1" class="container tab-pane fade"><br>
      <h3>회원정보수정</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu2" class="container tab-pane fade"><br>
      <h3>비밀번호 변경</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    <div id="menu3" class="container tab-pane fade"><br>
      <h3></h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
  </div>
</div> 

	
 


</div>


  
<%@include file="/common/footer.jsp"%>