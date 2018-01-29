<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
		url : "${root}/admin/calimlist.tfarm",
		dataType : "json",
		success : function(data) {
			makeClaimList(data);
		}
	});
call('category');	
});

</script>

	<!-- 단순누적량-->
	<h6>
		<strong> >미처리 신고 누적 </strong>
		<span><img src="${root }/img/linSec01.gif" alt="">
				<small>개설일(2018.01.04)이후 어제까지 누적된 수치 입니다</small></span>
	</h6>
<div class="row" style="margin-bottom: 3%;margin-top: 2%;">
		<table class="tableDft table table-hover table-sm">
			<thead>
				<tr class="table-success">
					<td width = "15%">글번호</td>	
					<td width = "15%">분류</td>
					<td width = "40%">제목</td>
					<td width = "20%">글쓴이</td>
					<td width = "10%">신고</td>
				</tr>
			</thead>
			<tbody>		
				<tr>
					<td>글번호</td>
					<td>카테고리명</td>
					<th>글제목</th>
					<td>글쓴이</td>
					<td>누적</td>
				</tr>
				<tr>
					<td>글번호</td>
					<td>카테고리명</td>
					<th>글제목</th>
					<td>글쓴이</td>
					<td>누적</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class = "row" style = "margin-top : 3%;">
		<div class="col-12" align = "center">
			<button type="button" class="btn btn-primary"><strong>버튼이여기왜?</strong></button>
		</div>
	</div>