<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	$("#passcheck").keyup(function() {
		if($("#passcheck").val() == $("#pass").val()){
			$("#passchecked").empty();
			$("#passchecked").append("비밀번호가 일치합니다");
		}else{
			$("#passchecked").empty();
			$("#passchecked").append("비밀번호를 확인해 주세요");
		}
	});
	
	$("#email3").change(function() {
		alert($("#email3").val());
		$("#email2").val = $("#email3").val();
		$("#email2").append($("#email3").val());
	});
	
	$("#modifyBtn").click(function() {
		if($("#pass").val() == "") {
			alert("비밀번호를 입력하세요!!!!");
			return;
		} else if($("#pass").val() != $("#passcheck").val()) {
			alert("비밀번호를 확인하세요!!!!");
			return;
		} else {
			document.modifyForm.action = "${root}/";
			document.modifyForm.submit();
		}
	});
});
</script>
<form id="modifyForm" name="modifyForm" action="">
  <fieldset>
  
  	<div style="width:600px; margin-top:20px; margin-left:250px; margin-bottom: 200px">
	    <legend style="font-weight:bold">회원가입</legend>
		<div class="form-group">
	      <label>이름</label>
	      <input type="text" class="form-control" readonly="readonly" id="name" placeholder="Enter name">
	    </div>
		<div class="form-group">
	      <label>아이디</label>
	      <input type="text" class="form-control" readonly="readonly" id="id" name="id" placeholder="Enter ID">
	      
	    </div>
	    <div class="form-group">
	      <label>패스워드</label>
	      <input type="password" class="form-control" id="pass" name="pass" placeholder="Enter PASS">
	      <small id="passok" class="form-text text-muted"></small>
	    </div>
	    <div class="form-group">
	      <label>패스워드확인</label>
	      <input type="password" class="form-control" id="passcheck" name="passcheck" placeholder="Once more input PASS">
	      <small id="passchecked" class="form-text text-muted"></small>
	    </div>
	    <div class="form-group">
	      <label for="exampleInputEmail1">Email address</label>
	      <div class="form-inline">
	      <input type="text" class="form-control" id="email1" name="email1" placeholder="Enter email" style="width:210px">
		  <span style="margin:10px; font-weight:bold">@</span>
		  <input type="text" class="form-control" id="email2" name="email2" style="width:210px">
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
	      <input type="text" class="form-control" id="tel1" name="tel1" style="width:116px">
	      <span style="margin:10px; font-weight:bold">-</span>
	      <input type="text" class="form-control" id="tel2" name="tel2" style="width:116px">
	      <span style="margin:10px; font-weight:bold">-</span>
	      <input type="text" class="form-control" id="tel3" name="tel3" style="width:116px">
	  	  </div>
	    </div>
	    <div class="form-group">
	      <label>주소</label>
	      <div class="form-inline" style="margin-bottom:10px">
	      <input type="text" class="form-control" readonly="readonly" id="tel1" name="tel1" style="width:300px; margin-right:10px">
		  <button type="button" class="btn btn-primary">우편번호검색</button>
	      </div>
	      <input type="text" class="form-control" id="tel2" name="tel2" style="margin-bottom:10px">
	      <input type="text" class="form-control" id="tel3" name="tel3" >
	  	  
	    </div>
	  	<div style="float:right;">
	  	<button type="button" id="cancelBtn" class="btn btn-primary">취소</button>
	    <button type="button" id="modifyBtn" class="btn btn-primary">수정</button>
	    </div>
    </div>
 
  </fieldset>
</form>
<%@ include file="/common/footer.jsp"%>