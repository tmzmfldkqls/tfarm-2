<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
            $(document).ready(function() { 
                //전체 선택/해제
                $("#chkAll").click(function(){
                    var chk = $(this).is(":checked");
                     
                    if(chk){
                        $('input[name*="deleteList"]').prop('checked', true);
                    }else{
                        $('input[name*="deleteList"]').prop('checked', false);
                    }      
                });               
                //체크 지우기
                $(document).on("click","input[name*=\"deleteList\"]",function(){    
                	if($("#chkAll").is(":checked")){
                		 $('#chkAll').prop('checked', false);
                	}   
                });
                //체크 항목 확인
                $("#check").click(function(){                     
                	var arr1 = new Array(); 
                	var k=0;
                	$('input[name*="deleteList"]').each(function(i){                 
                        if($(this).is(":checked")){
                        	arr1[k++] = $(this).val();
                        }
                    });	
                	if(arr1.length != 0)
                		location.href = "${root}/admin/memberDelete.tfarm?targetMno=" + arr1;
                }); 
            });
            
          //멤버 인포클릭하자 마자 켜자마자 실행되는 것. 			
        	$("#memberli").click(function() {
        		$.ajax({
        			type : "GET",
        			url : "${root}/admin/memberlist.tfarm",
        			dataType : "json",
        			success : function(data) {
        				makeAlllist(data);
        			}
        		});
        	});
          
        	//검색창에 엔터시 실행되는 것. 
        	function membersearch(key, word) {
        		var queryString = $("form[name=memberSearch]").serialize();
        		$.ajax({
        			type : "GET",
        			url : "${root}/admin/memberlist.tfarm",
        			dataType : "json",
        			data : queryString,
        			success : function(data) {
        				
        				makeAlllist(data);
        			}
        		});
        	}
        	//테이블 그리기
        	function makeAlllist(data) {
        		$("#memberlist").empty();
        		
        		var len = data.memberList.length;
        		var output = '';
        		for (var i = 0; i < len; i++) {
        			var member = data.memberList[i];
        			member.mname = decodeURIComponent(member.mname);
        			member.maddress = decodeURIComponent(member.maddress);
					member.mstate = decodeURIComponent(member.mstate);

        			output += "<tr><td>"+ member.mno + "</td>";
        			output += "<th name = \"memberId\" class = \"pnt\"  data-toggle=\"modal\" data-target=\"#memberModal\" onclick=\"javascript:toss('"+member.mname+"','"+member.mbirth+"','"+member.memail+"','"+member.mtel+"','"+member.maddress+"','"+member.mno+"');\">" + member.mid + "</th>";
        			output += "<td>" + member.memail + "</td>";
        			output += "<td>" + member.joindate + "</td>";
        			output += "<td>" + member.mstate + "</td>";
        			output += "<td><input class=\"form-check-input\" type=\"checkbox\" name=\"deleteList\" value = \""+ member.mno+"\" ></td><tr>";
        		}	
        		$("#memberlist").html(output);
        	}
        	//모달 띄울때 정보 전달함
        	function toss(mname,mbirth,memail,mtel,maddress,mno) {
        			$('#mno').val(mno);
        			$('#mname').text(""+mname+"");
        			$('#mbirth').text(""+mbirth+"");
        			$('#mtel').text(""+mtel+"");
        			$('#memail').text(""+memail+"");
        			$('#maddress').text(""+maddress+"");
        	}
</script>
	
	<!-- 검색 폼 -->
	<div class="row" style="margin-bottom: 3%;">
	<div class="col"></div>
	<div class="col-8">
		<form onsubmit="return false;" class="form-inline" name="memberSearch"
			action="" method="GET">
			<select name="key" class="form-control" style="margin-right: 3%;">
				<option value="ID">회원 ID</option>
				<option value="STATE">회원상태</option>
			</select> <input style="display: none;" /> <input name="word"
				class="form-control mr-lg-2" type="text" placeholder="회원id 검색"
				style="width: 70%;"
				onkeypress="javascript:if(event.keyCode == 13) {membersearch();}">
		</form>
	</div>
	<div class="col"></div>
</div>
	
	<!--멤버 리스트 테이블-->	
<form action="${root}/admin/memberDelete.tfarm" method="post" name="memberInfo" id = "memberInfo">
	<div class="row" style="margin-bottom: 3%;">

		<table class="tableDft table table-hover table-sm">
			<thead>
				<tr class="table-success">
					<td width="15%">회원번호</td>
					<td width="20%">ID</td>
					<td width="20%">E-Mail</td>
					<td width="20%">가입일</td>
					<td width="20%">상태</td>
					<td width="5%"><input class="form-check-input" id = "chkAll" name="chkAll" type="checkbox"></td>
				</tr>
			</thead>
			<tbody id="memberlist">
			</tbody>
		</table>
	</div>
	<div class="row" style="margin-top: 3%;">
		<div class="col-12" align="center">
			<button id="check" type="button" class="btn btn-primary">
				<strong>회원정보 삭제</strong>
			</button>
		</div>
	</div>
</form>
<!-- 회원상세정보 모달 시작 -->

	<div class="modal fade" id="memberModal">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"><strong>회원ID</strong></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
	
				<!-- Modal body -->
				<div class="modal-body">
					<table class="table tableDft">
						<thead>
							<tr>
								<th class="memberThead" width = "25%">구분</th>
								<th>값</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="memberThead">이름</td>
								<td id = "mname"></td>						
							</tr>
							<tr>
								<td class="memberThead">생년월일</td>
								<td id = "mbirth"></td>							
							</tr>
							<tr>
								<td class="memberThead">E-Mail</td>
								<td id = "memail"></td>
							</tr>
							<tr>
								<td class="memberThead">Tel</td>
								<td id = "mtel"></td>
							</tr>
							<tr>
								<td class="memberThead">주소</td>
								<td id = "maddress"></td>
							</tr>
								<input type = "hidden" id = "mno" value ="">
						</tbody>
					</table>
					<hr>
					<div class = "row" align = "center" style = "margin-bottom:3%;margin-top:3%">
						<div class = "col-6">
							<button type="button" class="btn btn-primary" width = "15%">&nbsp;블랙리스트&nbsp;</button>
						</div>
						<div class = "col-6">
							<button type="button" class="btn btn-primary" width = "15%">회원정보삭제</button>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>