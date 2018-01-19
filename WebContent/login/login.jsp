<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>

<script>
$(document).ready(function(){
	$("#loginBtn").click(function(){
		if($("#mem_id").val() == ""){
			alert("아이디를 입력하세요");
		}else if($("#mem_pw").val() == ""){
			alert("비밀번호를 입력하세요");
		}else{
			$("#loginform").attr("action", "${root}/user/login.tfarm").submit();
		}
	});
});
</script>


<form id="loginform" name="loginform" method="post">
 <fieldset>
	<div style="width:400px; margin-left:300px; margin-top:100px; margin-bottom:300px">
	    <legend style="font-weight:bold">로그인</legend>
	    <div class="form-group" style="width:400px">
	      <label for="exampleInputEmail1">ID</label>
	      <input type="text" class="form-control" id="mem_id" name="mem_id" aria-describedby="emailHelp" placeholder="Enter id">
	      
	    </div>
	    <div class="form-group" style="width:400px">
	      <label for="exampleInputPassword1">Password</label>
	      <input type="password" class="form-control" id="mem_pw" name="mem_pw" placeholder="Enter Password">
	    </div>
		<div style="float:right;">
	    	<button type="button" id="loginBtn" class="btn btn-primary">LOGIN</button>
		</div>
	</div>
	</fieldset>
	
	
      
</form>
<%@ include file="/common/footer.jsp" %>