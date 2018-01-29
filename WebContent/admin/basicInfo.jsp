<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
//열자마자 기본 정보 보이도록
	$(document).ready(function() {
		$.ajax({
			url : "${root}/admin/basicInfo.tfarm",
			dataType : "json",
			success : function(data) {
				showBasicInfo(data);
			}
		});
	call('category');	
	});

//기본 정보의 리콜 함수
	function showBasicInfo(data) {
		
		$('#totalmember').text(""+data.totalmember+"");
		$('#totalacticle').text(""+data.totalacticle+"");
		$('#totalmemo').text(""+data.totalmemo+"");
	}	
//어떤 차트를 볼 것인지 셀렉했을 때 불려오는 함수	
function call(query) {	
	google.charts.setOnLoadCallback(drawChart(query));
	}	
//차트 호출
      google.charts.load('current', {'packages':['corechart']});
//그리기~
function drawChart(query) {
	var arg = query;
    	  $.ajax({
    	    	type : "GET",
    			url : "${root}/admin/totalgragh.tfarm?query=" + arg,
    			dataType : "json",
    	        success: function (jsonData){
    	        	var data = new google.visualization.DataTable();
    	        	
    	        	if('category' == query){
        	      		var len = jsonData.CategorySet.length;
        	            data.addColumn('string', 'category');
        	            data.addColumn('number', 'count');
        	           
        	            for (var i = 0; i < len; i++) {
        	                data.addRow([decodeURIComponent(jsonData.CategorySet[i].category),jsonData.CategorySet[i].count]);
        	             }
        	            var options = {
        	                    title: '카테고리 비율'
        	                  };
        	            var piechart = new google.visualization.PieChart(document.getElementById('totalChart'));
        	            piechart.draw(data, options);
        	         
    	        		}
    	        	else if('article' == query){
    	        		
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
    	                var linechart = new google.visualization.LineChart(document.getElementById('totalChart'));
    	                linechart.draw(data, options);  	        		
    	        		}
        				else if('member' == query){
    	        		
    	        		var len = jsonData.MemberSet.length;
    	                data.addColumn('string', 'logtime');
    	                data.addColumn('number', '회원수');
    	                for (var i = 0; i < len; i++) {
    	                   data.addRow([decodeURIComponent(jsonData.MemberSet[i].logtime),jsonData.MemberSet[i].count]);
    	                }
    	                var options = {
    	                    title: '회원수 증가 추이',
    	                };
    	                var ComboChart = new google.visualization.ComboChart(document.getElementById('totalChart'));
    	                ComboChart.draw(data, options);
    	        		
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
			<div class="row" >
				<div class = "col-9" id="totalChart" style="background-color: grey ; height : 400px; ">차트 들어올 자리</div>
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
