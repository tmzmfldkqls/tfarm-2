<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<form>
 <fieldset>
 
	<div style="width:400px; margin-left:300px; margin-top:100px; margin-bottom:300px">
	    <legend style="font-weight:bold">로그인</legend>
	    <div class="form-group" style="width:400px">
	      <label for="exampleInputEmail1">ID</label>
	      <input type="text" class="form-control" id="id" aria-describedby="emailHelp" placeholder="Enter id">
	      
	    </div>
	    <div class="form-group" style="width:400px">
	      <label for="exampleInputPassword1">Password</label>
	      <input type="password" class="form-control" id="pass" placeholder="Enter Password">
	    </div>
		<div style="float:right;">
	    	<button type="submit" class="btn btn-primary">LOGIN</button>
		</div>
	</div>
	</fieldset>
</form>
<%@ include file="/common/footer.jsp" %>