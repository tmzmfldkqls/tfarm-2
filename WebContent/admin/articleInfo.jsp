<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart);

function drawChart () {
    $.ajax({
    	type : "POST",
		url : "${root}/admin/articlegragh.tfarm",
		dataType : "json",
        success: function (jsonData) {
            var data = new google.visualization.DataTable();
            // assumes "word" is a string and "count" is a number
      		var len = jsonData.wholeArticleSet.length;
            data.addColumn('string', 'logtime');
            data.addColumn('number', 'count');
            
            for (var i = 0; i < len; i++) {
               data.addRow([decodeURIComponent(jsonData.wholeArticleSet[i].logtime),jsonData.wholeArticleSet[i].count]);
            }

            var options = {
                title: '전체 게시글 증가 추이',
            };
            var chart = new google.visualization.LineChart(document.getElementById('articleInfo'));
            chart.draw(data, options);
        }
    });
}
   
</script>

	<!-- 단순누적량-->
	<h6>
		<strong> >게시글 누적 </strong>
		<span><img src="${root }/img/linSec01.gif" alt="">
				<small>개설일(2018.01.04)이후 어제까지 누적된 수치 입니다</small></span>
	</h6>
	<br>
	
	<!-- 게시판 별 게시글 도넛차트 넣을것-->
	<div class="card">
		<div class="card-body">
			<div class="row">
				<div class = "col-9" id="articleInfo" style="background-color: grey ; height : 300px;">차트 들어올 자리</div>
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
	<br>
	<br>
	<br>
	<br>
	
<div class="row" style="margin-bottom: 3%;">
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