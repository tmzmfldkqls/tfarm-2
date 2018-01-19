<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>


	<div class="col-xl-10" style="margin-top: 20%;text-align:  center;">
	  <div class="card-body">
	    <h4 class="card-title"><b>${registerinfo.mem_name}</b>님</h4>
	    <h6 class="card-subtitle mb-2">TIFARM 회원가입을 축하합니다.</h6>
	    <p class="card-text">가입하신 아이디는 ${registerinfo.mem_id}입니다.<br>로그인 후 서비스를 이용 할 수 있습니다.</p>
	    <a class="card-link" href="${root}/user/login.tfarm">로그인하기</a>
	    <a class="card-link" href="${root}/user/home.tfarm">메인으로</a>
	  </div>
	</div>


<%@ include file="/common/footer.jsp" %>





