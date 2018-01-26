<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/header.jsp" %>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${root}/js/httpRequest.js"></script>
<!--  
<script src="jquery.nailthumb.1.1.min.js"></script>
<link rel="stylesheet" href="jquery.nailthumb.1.1.min.css">
-->
<script>
control = "/main";
</script>

<style>
img {
    border: 1px solid #ddd; /* Gray border */
    border-radius: 4px;  /* Rounded border */
    padding: 5px; /* Some padding */
    width: 150px; /* Set a small width */
}

/* Add a hover effect (blue shadow) */
img:hover {
    box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}
</style>

<!-- ******************우리가 코딩해야하는 부분 시작  col-xl-10********************** -->
<!---------------------------------  최신 앨범-------------------------------    -->
<script type="text/javascript">

//최신공지 ajax

	$(document).ready(function() {
		$.ajax({
		type: 'POST',
		dataType: 'json',
		url: '${root}/main/totallist.tfarm',
		success: function(data) {
			//alert("넘어왔니???"+data.blist[0].subject);
			makelist(data);
			}
	 	});
	});

function makelist(data) {
	var output = "";
	var bsize = data.blist.length;
	for(var i=0;i<6;i++){
		output += '<tr style="text-align:center">';
		output += '<td>';
		output += '' + decodeURI(data.blist[i].id);
		output += '</td>';
		output += '<td style="white-space: nowrap; word-wrap: break-word; text-overflow: ellipsis; overflow: hidden;">';
		output += '<a href = "${root}/main/view.tfarm?seq='+decodeURI(data.blist[i].seq)+'">';
		output += ' ' + decodeURI(data.blist[i].subject);
		output += '</a>';
		output += '</td>';
		output += '<td>';
		output += '' + decodeURI(data.blist[i].hit);
		output += '</td>';
		output += '</tr>';
		
	}
	
	$("#boardlist").empty();
	$("#boardlist").append(output);
}


//인기글 ajax

$(document).ready(function() {
	$.ajax({
	type: 'POST',
	dataType: 'json',
	url: '${root}/main/totallist1.tfarm',
	success: function(data) {
		//alert("넘어왔니???"+data.blist[0].subject);
		makelist1(data);
		}
 	});
});

function makelist1(data) {
var output = "";
var nsize = data.nlist.length;
for(var i=0;i<6;i++){
	output += '<tr style="text-align:center">';
	output += '<td>';
	output += '' + decodeURI(data.nlist[i].id);
	output += '</td>';
	output += '<td style="white-space: nowrap; word-wrap: break-word; text-overflow: ellipsis; overflow: hidden;">';
	output += '<a href = "${root}/main/boardview.tfarm?seq='+decodeURI(data.nlist[i].seq)+'">';
	output += ' ' + decodeURI(data.nlist[i].subject);
	output += '</a>';
	output += '</td>';
	output += '<td>';
	output += '' + decodeURI(data.nlist[i].hit);
	output += '</td>';
	output += '</tr>';
	
	}

	$("#noticelist").empty();
	$("#noticelist").append(output);
}


//최신티켓 ajax

$(document).ready(function() {
	//alert("넘어왔니???2");
	$.ajax({
	type: 'POST',
	datatype: 'json',
	url: '${root}/main/totallist2.tfarm',
	success: function (data) {
		makelist2(data);
		}
	});
});

function makelist2(data) {
	var output = "";
	var tsize = data.tlist.length;
	alert("넘어왔니???");
	for(var i=0;i<tsize;i++){
		output += '<a href="${root}/main/totallist2.tfarm?seq='+decodeURI(data.tlist[i].seq)+'">';
		output += '<img src="${root}/upload/'+ decodeURI+(data.tlist[i].save_picture)+'" class="img-rounded">';
		output += '</a>';
		output += '<div class="caption">';
		output += '<p>제목</p>';
		output += '</div>';
		
		
	}
	
	$("#ticketlist").empty();
	$("#ticketlist").append(output);
}



</script>
   <div class="col-xl-10">
        	<div>
                <h4 id="container">[최신티켓]</h4>
            </div>
            
        	<div class="row">
				<div class="col-md-3">
					<div class="thumbnail" id="ticketlist">
					<!--  
					<a href="javascript:ticketView();">
  						<img src="${root}/img/1.PNG" class="img-rounded">
  					</a>
						<div class="caption">
							<p>subject</p>
						</div>
						-->
					</div>
				</div>
			</div>
	
			<br><br>
			
			<div class="row" id="poplist">					
				<div class="col-sm-5">
		        	<div>
		                <h4 id="container">[최신공지사항]</h4>
		            </div>
		            <div class="table-responsive">
		                <!-- <table class="table table-bordered"> -->
		                <table class="table table-hover" style="table-layout:fixed;">
		                    <colgroup>
		                        <col width="80">
		                        <col width="*">
		                        <col width="70">
		                    </colgroup>
		                    <thead>
		                    <tr><th colspan="3"></th></tr>
		                    <tr>
		                        <th class="text-center">작성자</th>
		                        <th class="text-center" width="40%">제목</th>
		                        <th class="text-center" width="40%">조회수</th>
		                    </tr>
		                    </thead>
		                    <tbody class="article_list" id="boardlist">
		                     <!-- 글목록 -->
		                    </tbody>
						</table>
					</div>
				</div>
				
				<div class="col-sm-5">
		        	<div>
		                <h4 id="container">[인기글]</h4>
		            </div>
		            <div class="table-responsive">
		                <!-- <table class="table table-bordered"> -->
		                <table class="table table-hover" style="table-layout:fixed;">
		                    <colgroup>
		                        <col width="80">
		                        <col width="*">
		                        <col width="70">
		                    </colgroup>
		                    <thead>
		                    <tr><th colspan="3"></th></tr>
		                    <tr>
		                        <th class="text-center">작성자</th>
		                        <th class="text-center" width="40%">제목</th>
		                        <th class="text-center" width="40%">조회수</th>
		                    </tr>
		                    </thead>
		                    
		                    <tbody class="article_list" id="noticelist">
		                    <!-- 글목록 -->
		                    </tbody>
						</table>
					</div>
				</div>
			</div>
       
  </div>
   

<!-- ******************우리가 코딩해야하는 부분 끝********************** -->
<%@ include file="/common/footer.jsp" %>