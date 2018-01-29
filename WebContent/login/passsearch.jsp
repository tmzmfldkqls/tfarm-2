<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	var output = "";
	$("#loginBtn").click(function() {
		if($("#mem_id").val() == ""){
			alert("이메일 아이디를 입력하세요");
		} else if($("#mem_email").val() == ""){
			alert("이메일 주소를 입력하세요");
		} else{
			$("#idinfo").append("임시비밀 번호를 메일로 보냈습니다.");
			var email = $("#mem_email").val();
			var id = $("#mem_id").val();
			$.ajax({
				type : 'GET',
				dataType: 'json',
				url: '${root}/user/email.tfarm',
				data: {'id': id, 'email' : email},
				success: function(data){
					console.log("찍어보자>>>>"+data.result);
					if(data.result=="1"){
						output = "임시비밀 번호를 메일로 보냈습니다.";
					}else{
						output = "아이디를 찾을 수 없습니다."; // true면 임지저장소에 값 넣어 놓기
					}
					$("#idinfo").empty();
					$("#idinfo").append(output);
				}
			});
		}
		
	});
});
</script>

<form id="loginform" name="loginform" method="post">
 <fieldset>
	<div style="width:400px; margin-left:300px; margin-top:100px; margin-bottom:300px">
	    <legend style="font-weight:bold">비밀번호 찾기</legend>
	    <div class="form-group" style="width:400px">
	      <input type="text" class="form-control" id="mem_id" name="mem_id" aria-describedby="emailHelp" placeholder="아이디을 입력해주세요">
	      
	    </div>
	    <div class="form-group" style="width:400px">
	      <input type="text" class="form-control" id="mem_email" name="mem_email" placeholder="이메일을 입력해주세요">
	    </div>
		<div style="width:100%; margin-bottom:20px">
	    	<button type="button" id="loginBtn" class="btn btn-primary" style="width:100%" onclick="javascript:passfind()">메일 발송</button>
		</div>
		<small id="idinfo" class="form-text text-muted"></small>
	</div>
	</fieldset>
</form>

<%@ include file="/common/footer.jsp" %>
