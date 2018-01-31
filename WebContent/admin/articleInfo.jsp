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
					<td>53</td>
					<td>전시/행사</td>
					<th>미교 전국투어 콘서트 - 유앤아이(You＆I) in 대구 티켓오픈</th>
					<td>admin</td>
					<td>5</td>
				</tr>
				<tr>
					<td>89</td>
					<td>Q&A</td>
					<th>안녕하세요</th>
					<td>qweqwe</td>
					<td>7</td>
				</tr>
				<tr>
					<td>111</td>
					<td>뮤지컬</td>
					<th>바*다*이*야*기</th>
					<td>dpffpsk1113</td>
					<td>7</td>
				</tr>
				<tr>
					<td>111</td>
					<td>클래식/무용</td>
					<th>바*다*이*야*기</th>
					<td>dpffpsk1113</td>
					<td>6</td>
				</tr>
				<tr>
					<td>113</td>
					<td>스포츠/레저</td>
					<th>바*다*이*야*기</th>
					<td>dpffpsk1113</td>
					<td>7</td>
				</tr>
			</tbody>
		</table>
	</div>