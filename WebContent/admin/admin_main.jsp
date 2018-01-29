<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>

<link rel="stylesheet" href="${root }/css/admin.css">

	<!-- ******************우리가 코딩해야하는 부분 시작********************** -->
	<div class=" col-xl-10" style="margin-top : 2%;  float: left; width: 900px;">
		<!--  관리자시점의 탭 메뉴 -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item" id = "basicli"><a class="nav-link active" data-toggle="tab" href="#basictab"><strong>TFarm</strong></a></li>
			<li class="nav-item" id = "articleli"><a class="nav-link" data-toggle="tab" href="#articletab"><strong>게시글관리</strong></a></li>
			<li class="nav-item" id = "memberli"><a class="nav-link" data-toggle="tab" href="#membertab"><strong>회원관리</strong></a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div id="basictab" class="container tab-pane active">
				<br>
				<%@ include file="/admin/basicInfo.jsp"%>			
			</div>
			<div id="articletab" class="container tab-pane fade">
				<br>
				<%@ include file="/admin/articleInfo.jsp"%>
			</div>
			<div id="membertab" class="container tab-pane fade">
				<br>	
				<%@ include file="/admin/memberInfo.jsp"%>
			</div>
		</div>
	</div>
<!-- ******************우리가 코딩해야하는 부분 끝********************** -->
<%@ include file="/common/footer.jsp" %>