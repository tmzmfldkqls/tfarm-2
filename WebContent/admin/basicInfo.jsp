<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- google charts -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
//열자마자 기본 정보 보이도록
$(document).ready(function() {
		$.ajax({
			url : "${root}/admin/basicInfo.tfarm",
			dataType : "json",
			success : function(data) {
				showBasicInfo(data);
			}
		});
	google.charts.setOnLoadCallback(call("article"));
	});

	//리콜 함수
	function showBasicInfo(data) {		
		$('#totalmember').text(""+data.totalmember+"");
		$('#totalacticle').text(""+data.totalacticle+"");
		$('#totalmemo').text(""+data.totalmemo+"");
	}
	//뭐 선택했는지 보여줌
	function call(arg) {
		google.charts.setOnLoadCallback(drawChart(arg));
	}
	function drawChart(arg) {
		var query = arg;
		$.ajax({
	    	type : "GET",
			url : "${root}/admin/totalgragh.tfarm?query="+query,
			dataType : "json",
	        success: function (jsonData) {
	            var data = new google.visualization.DataTable();
	            // assumes "word" is a string and "count" is a number
	            if('article' == arg){
	            	var len = jsonData.wholeArticleSet.length;
	           	 	data.addColumn('string', 'logtime');
	           	 	data.addColumn('number', 'count');
	            
	            for (var i = 0; i < len; i++) {
	               data.addRow([decodeURIComponent(jsonData.wholeArticleSet[i].logtime),jsonData.wholeArticleSet[i].count]);
	            }

	            var options = {
	                title: '전체 게시글 증가 추이',
	                curveType: 'function'
	            };
	            var articlechart = new google.visualization.LineChart(document.getElementById('totalgragh'));
	            articlechart.draw(data, options);
	            }else if('member' == arg){
	            	var len = jsonData.memberSet.length;
		            data.addColumn('string', 'joinDate');
		            data.addColumn('number', 'count');
		            
		            for (var i = 0; i < len; i++) {
		               data.addRow([decodeURIComponent(jsonData.memberSet[i].joinDate),jsonData.memberSet[i].count]);
		            }
		            var options = {
		                title: '회원수 증감 현황',
		                curveType: 'function'
		            };
		            var memberchart = new google.visualization.LineChart(document.getElementById('totalgragh'));
		            memberchart.draw(data, options);
		            }else if('category' == arg){
		            	
		            	var len = jsonData.categorySet.length;
			            data.addColumn('string', 'joinDate');
			            data.addColumn('number', 'count');
			            
			            for (var i = 0; i < len; i++) {
			               data.addRow([decodeURIComponent(jsonData.categorySet[i].category),jsonData.categorySet[i].count]);
			            }
			            var options = {
			                title: '가테고리별 게시글 현황'
			            };
			            var categorychart = new google.visualization.PieChart(document.getElementById('totalgragh'));
			            categorychart.draw(data, options);
			         }
	        }
	    });
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
	      <td id = "totalmember" scope="row"></td>
	      <td id = "totalacticle" ></td>
	      <td id = "totalmemo" ></td>
	      <td id = "totalvisit">186</td>
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
				<span class = "pnt" onclick = "javascript:call('member');">가입자</span>&nbsp;&nbsp;<img src="${root }/img/linSec01.gif" alt="">&nbsp;&nbsp;
				<span class = "pnt" onclick = "javascript:call('article');">게시글</span>&nbsp;&nbsp;<img src="${root }/img/linSec01.gif" alt="">&nbsp;&nbsp;
				<span class = "pnt" onclick = "javascript:call('memo');">댓글</span>&nbsp;&nbsp;<img src="${root }/img/linSec01.gif" alt="">&nbsp;&nbsp;
				<span class = "pnt" onclick = "javascript:call('category');">카테고리</span>&nbsp;&nbsp;<img src="${root }/img/linSec01.gif" alt="">&nbsp;&nbsp;
		</small></span>
	</h6>

<form action="" name="cafetotForm" id="cafetotForm">
	<!-- 차트샘플. 가입자, 게시글은 막대그래프로 시간구간별 등록빈도 나타내기. 카테고리 : 도넛그래프로 게시판별 시각화, 댓글은 최빈 작성자 topN 그냥 뽑아 보여주기-->
	<div class="card">
		<div class="card-body">
			<div class="row">
				<div class = "col-9"id="totalgragh" style="background-color: grey;height:450px; ">차트 들어올 자리</div>
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
