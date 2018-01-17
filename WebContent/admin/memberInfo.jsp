<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                $('input[name*="deleteList"]').click(function(){ 
                	if($("#chkAll").is(":checked")){
                		 $('#chkAll').prop('checked', false);
                	}   
                });
                //체크 항목 확인
                $("#check").click(function(){                     
                    $('input[name*="deleteList"]').each(function(i){                 
                        if($(this).is(":checked")){
                            alert($(this).val());
                        }
                    });
                });
                
            });
</script>
	
	<!-- 검색 폼 -->
	<div class="row" style="margin-bottom: 3%;">
	<div class="col"></div>
	<div class = "col-8">
		<form class="form-inline">
			<select class="form-control" style="margin-right: 3%;">
				<option>회원 ID</option>
				<option>블랙리스트</option>
			</select> 
			<input class="form-control mr-lg-2" type="text" placeholder="회원id 검색" style = "width:70%;">			
		</form>
	</div>
	<div class="col"></div>
	</div>
	
	<!--멤버 리스트 테이블-->
	<div class="row" style="margin-bottom: 3%;">
		<table class="tableDft table table-hover table-sm">
			<thead>
				<tr class="table-success">	
					<td width = "25%">ID</td>
					<td width = "25%">게시글</td>
					<td width = "25%">댓글</td>
					<td width = "20%">신고</td>
					<td width = "5%"><input class="form-check-input" id ="chkAll" type="checkbox"></td>
				</tr>
			</thead>
			<tbody>		
				<tr>
					<th class = "pnt"  data-toggle="modal" data-target="#memberModal">dpffpsk1113</th>
					<td>25</td>
					<td>165</td>
					<td>9</td>
					<td><input class="form-check-input" id ="chk" type="checkbox" name="deleteList" value = "첫번째"></td>
				</tr>
				
				<tr>
					<th class = "pnt" data-toggle="modal" data-target="#memberModal">test22</th>
					<td>25</td>
					<td>165</td>
					<td>9</td>
					<td><input class="form-check-input" type="checkbox" name="deleteList" value = "두번째"></td>
				</tr>
				<tr>
					<th class = "pnt" data-toggle="modal" data-target="#memberModal">기장님</th>
					<td>25</td>
					<td>165</td>
					<td>9</td>
					<td><input class="form-check-input" type="checkbox" name="deleteList" value = "세번쨰"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class = "row" style = "margin-top : 3%;">
		<div class="col-12" align = "center">
			<button id="check" type="button" class="btn btn-primary"><strong>회원정보 삭제</strong></button>
		</div>
	</div>
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
								<td>이름값</td>						
							</tr>
							<tr>
								<td class="memberThead">생년월일</td>
								<td>생년월일값</td>							
							</tr>
							<tr>
								<td class="memberThead">E-Mail</td>
								<td>이메일1@이메일2</td>
							</tr>
							<tr>
								<td class="memberThead">Tel</td>
								<td>tel1 - tel2 - tel3</td>
							</tr>
							<tr>
								<td class="memberThead">주소</td>
								<td>주소 <br> 상세주소(우편번호)</td>
							</tr>
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