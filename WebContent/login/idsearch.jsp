<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<script type="text/javascript">
function idfind(){
	var output = "";
   if($("#mem_name").val() == ""){
      alert("이름를 입력해 주세요");
   }else if($("#mem_email").val() == ""){
      alert("이메일을 정확히 입력해주세요");
   }else{
	  var name = $("#mem_name").val();
	  var email = $("#mem_email").val();
 	  $.ajax({
 		 type: 'POST',
 		 dataType: 'json',
 		 data: {'name':name,"email":email},
 		 url: '${root}/user/idfind.tfarm',
 		 success: function (data){
 			 if(data.name != null){
 				output = '찾으시는 아이디는<font color="blue"><b>' + data.name + "</b></font>입니다.";
 			 }else{
 				output = "찾으시는 아이디가 없습니다."; 
 			 }
 			$("#idinfo").empty();
			$("#idinfo").append(output);
 		 }
 	  });
   }
   
      
}
</script>

<form id="loginform" name="loginform" method="post">
 <fieldset>
	<div style="width:400px; margin-left:300px; margin-top:100px; margin-bottom:300px">
	    <legend style="font-weight:bold">아이디 찾기</legend>
	    <div class="form-group" style="width:400px">
	      <input type="text" class="form-control" id="mem_name" name="mem_name" aria-describedby="emailHelp" placeholder="이름을 입력해주세요">
	      
	    </div>
	    <div class="form-group" style="width:400px">
	      <input type="text" class="form-control" id="mem_email" name="mem_email" placeholder="이메일을 입력해주세요">
	    </div>
		<div style="width:100%; margin-bottom:20px">
	    	<button type="button" id="loginBtn" class="btn btn-primary" style="width:100%" onclick="javascript:idfind()">찾기</button>
		</div>
		<small id="idinfo" class="form-text text-muted"></small>
	</div>
	</fieldset>
</form>

<%@ include file="/common/footer.jsp" %>
