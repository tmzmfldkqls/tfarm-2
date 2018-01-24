<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
//열자마자 기본 정보 보이도록
	$(document).ready(function() {
		$.ajax({
			url : "${root}/admin/basicInfo.tfar",
			dataType : "json",
			success : function(data) {
				showBasicInfo(data);
			}
		});
	});

	//테이블 그리기
	function showBasicInfo(data) {
		
	}
</script>
	<!-- 단순누적량-->
	<h6>
		<strong> >총 누적 </strong><span><img src="${root}/img/linSec01.gif" alt="" > 
		<small>개설일(2018.01.04)이후 어제까지 누적된 수치 입니다</small></span>
	</h6>
	<br>
	<table class="table" style = "margin : auto;text-align:center;">
	  <thead>
	    <tr class="table-success">
	      <th scope="col" width = "25%">회원</th>
	      <th scope="col" width = "25%">게시글</th>
	      <th scope="col" width = "25%">댓글</th>
	      <th scope="col" width = "25%">방문</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr >
	      <td scope="row">회원</td>
	      <td>게시글수</td>
	      <td>댓글수</td>
	      <td>방문수</td>
	    </tr>
	  </tbody>
	</table> 
	<br>
	<br>
	<br>
	<br>
	<!-- 카페현황 -->
	<h6>
		<strong >>TFarm 현황 통계&nbsp;&nbsp;&nbsp;</strong>
			<span style="width: 100%; text-align: right;">
			<small class="text-muted"> 
				<span class = "pnt">가입자</span>&nbsp;&nbsp;<img src="${root }/img/linSec01.gif" alt="">&nbsp;&nbsp;
				<span class = "pnt">게시글</span>&nbsp;&nbsp;<img src="${root }/img/linSec01.gif" alt="">&nbsp;&nbsp;
				<span class = "pnt">댓글</span>&nbsp;&nbsp;<img src="${root }/img/linSec01.gif" alt="">&nbsp;&nbsp;
				<span class = "pnt">카테고리</span>&nbsp;&nbsp;<img src="${root }/img/linSec01.gif" alt="">&nbsp;&nbsp;
		</small></span>
	</h6>

<form action="" name="cafetotForm" id="cafetotForm">
	<!-- 차트샘플. 가입자, 게시글은 막대그래프로 시간구간별 등록빈도 나타내기. 카테고리 : 도넛그래프로 게시판별 시각화, 댓글은 최빈 작성자 topN 그냥 뽑아 보여주기-->
	<div class="card">
		<div class="card-body">
			<div class="row">
				<div class = "col-9"id="recieve" style="background-color: grey ">차트 들어올 자리</div>
				<div class = "col-3">
					<select class="form-control">
						<option>최근 1주</option>
						<option>최근 1개월</option>
						<option>최근 3개월</option>
						<option>최근 6개월</option>
					</select>
				</div>
			</div>
		</div>
	</div>
	<!-- 차트샘플 끝-->
	</form>
