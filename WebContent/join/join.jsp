<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<script type="text/javascript">
var idflag = false;
function idcheck() {
	var output = '아이디는 8자이상 20자 이하입니다';
	var sid = $("#mem_id").val();
	if(sid.length > 8 && sid.length < 20) {
		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: '${root}/user/join.tfarm',
			data: {'sid' : sid},
			success: function(data) {//data >> {idcount : 0, sid : java2}
				//alert(data.idcount + "   " + data.sid);
				if(data.idcount == '0') {
					idflag = true;
					output = '<font color="blue"><b>' + data.sid + "</b></font>는 사용가능합니다";
				} else {
					idflag = false;
					output = '<font color="red"><b>' + data.sid + "</b></font>는 사용중입니다";
				}
				$("#idinfo").empty();
				$("#idinfo").append(output);
			},
			error: function(e) {
				alert("에러발생 : " + e);
			}
		});
	} else {
		idflag = false;
		$("#idinfo").empty();
		$("#idinfo").append(output);
	}
}

$(document).ready(function(){

	$("#passcheck").keyup(function() {
		if(!$("#passcheck").val()==''){
			if($("#passcheck").val() == $("#mem_pass").val()){
				$("#passchecked").empty();
				$("#passchecked").append("비밀번호가 일치합니다");

			}else{
				$("#passchecked").empty();
				$("#passchecked").append("비밀번호를 확인하세요");

			}
			
		}else{
			$("#passchecked").empty();
			$("#passchecked").append("비밀번호를 입력하세요");
		}
	});
	var passflag = false;	
	$("#mem_pass").keyup(function() {
		function chkPwd(str){

			 var pw = str;
			 var num = pw.search(/[0-9]/g);
			 var eng = pw.search(/[a-z]/ig);
			 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

			 if(pw.length < 8 || pw.length > 20){
			  	$("#passok").empty();
			  	$("#passok").append("비밀번호는 8자이상 20자 이하입니다");
			  	
			  	return false;
			 }

			 if(pw.search(/₩s/) != -1){
				$("#passok").empty();
				$("#passok").append("비밀번호는 공백업이 입력해주세요");
				
				return false;
			 }
			 if(num < 0 || eng < 0 || spe < 0 ){
				$("#passok").empty();
				$("#passok").append("영문,숫자, 특수문자를 혼합하여 입력해주세요");
				
				return false;
			 }
			 
			 return true;

			}

			if(!chkPwd( $.trim($('#mem_pass').val()))){
				passflag = false;
			    return false;

			}else{
				$("#passok").empty();
				$("#passok").append("사용가능한 비밀번호입니다");
				passflag = true;
			}

	});
	
	$("#email3").change(function() {
		alert($("#email3").val());
		$("#mem_email2").val = $("#email3").val();
		
	});
	
	$("#registerBtn").click(function() {
		if($("#mem_name").val() == "") {
			alert("이름을 입력하세요!!!!");
			return;
		} else if(!idflag) {
			alert("아이디를 확인하세요!!!!");
			return;
		} else if($("#mem_pass").val() == "") {
			alert("비밀번호를 입력하세요!!!!");
			return;
		} else if($("#mem_pass").val() != $("#passcheck").val()) {
			alert("비밀번호를 확인하세요!!!!");
			return;
		} else if(!passflag) {
			alert("비밀번호를 확인하세요!!!!");
			return;
		} else {
			document.memberregist.action = "${root}/";
			document.memberregist.submit();
		}
	});
		
});
</script>
<form id="memberregist" name="memberregist" action="" method="post">
  <fieldset>
  	<div style="width:600px; margin-top:20px; margin-left:250px; margin-bottom: 200px">
	    <legend style="font-weight:bold">회원가입</legend>
		<div class="form-group">
	      <label>이름</label>
	      <input type="text" class="form-control" id="mem_name" placeholder="Enter name">
	    </div>
		<div class="form-group">
	      <label>아이디</label>
	      <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="Enter ID" onkeyup="javascript:idcheck();">
	      <small id="idinfo" class="form-text text-muted">아이디는 8자이상 20자 이하입니다</small>
	    </div>
	    <div class="form-group">
	      <label>패스워드</label>
	      <input type="password" class="form-control" id="mem_pass" name="mem_pass" placeholder="Enter PASS" onkeypress="javascript:if(event.keyCode==13){chkPwd();};">
	      <small id="passok" class="form-text text-muted">비밀번호는 8자이상 20자 이하입니다</small>
	    </div>
	    <div class="form-group">
	      <label>패스워드확인</label>
	      <input type="password" class="form-control" id="passcheck" name="passcheck" placeholder="Once more input PASS">
	      <small id="passchecked" class="form-text text-muted">비밀번호를 입력하세요</small>
	    </div>
	    <div class="form-group">
	      <label for="exampleInputEmail1">이메일</label>
	      <div class="form-inline">
		      <input type="text" class="form-control" id="mem_email1" name="mem_email1" placeholder="Enter email" style="width:210px">
			  <span style="margin:10px; font-weight:bold">@</span>
			  <input type="text" class="form-control" id="mem_email2" name="mem_email2" style="width:210px">
		      <select class="form-control" id="email3" name="email3" style="margin-left: 15px">
		        <option selected="selected">직접입력</option>
		        <option>naver.com</option>
		        <option>hanmail.com</option>
		        <option>gmail.com</option>
		        <option>nate.com</option>
		      </select>
	      </div>
	    </div>
	    <div class="form-group">
	      <label>전화번호</label>
	      <div class="form-inline">
		      <input type="text" class="form-control" id="mem_tel1" name="mem_tel1" style="width:116px" maxlength="3">
		      <span style="margin:10px; font-weight:bold">-</span>
		      <input type="text" class="form-control" id="mem_tel2" name="mem_tel2" style="width:116px" maxlength="4">
		      <span style="margin:10px; font-weight:bold">-</span>
		      <input type="text" class="form-control" id="mem_tel3" name="mem_tel3" style="width:116px" maxlength="4">
	  	  </div>
	    </div>
	    <div class="form-group">
	      <label>주소</label>
	      <div class="form-inline" style="margin-bottom:10px">
	      <input type="text" class="form-control" readonly="readonly" id="mem_zipcode1" name="mem_zipcode1" style="width:200px; margin-right:10px"> - 
	      <input type="text" class="form-control" readonly="readonly" id="mem_zipcode2" name="mem_zipcode2" style="width:200px; margin-right:10px">
		  <button type="button" class="btn btn-primary">우편번호검색</button>
	      </div>
	      <input type="text" class="form-control" readonly="readonly" id="mem_address1" name="mem_address1" style="margin-bottom:10px">
	      <label>상세주소</label>
	      <input type="text" class="form-control" id="mem_address2" name="mem_address2" >
	  	  
	    </div>
	  	<div style="float:right;">
	    <button type="button" id="registerBtn" class="btn btn-primary">회원가입</button>
	    </div>
    </div>
 
  </fieldset>
</form>
<%@ include file="/common/footer.jsp"%>