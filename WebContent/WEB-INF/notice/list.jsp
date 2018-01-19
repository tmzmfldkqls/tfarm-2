<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header_board.jsp"%>
<script type="text/javascript">
	control = "/board";
	$(document).ready(function() {
		var seqfind = false;
		$("#searchForm #searchbtn").click(function() {
			function numbercheck(word) {
				var pw = word;
				var num = pw.search(/[0-9]/g);
				if (pw.length < 1) {
					alert("글번호를 입력하세요");
					return false;
				}else if (num < 0) {
					alert("숫자만 입력하세요");
					return false;
				}else{
					return true;
				}
			}
			
			if($("#searchForm #key").val()=='seq'){
				if (numbercheck($.trim($('#searchForm #word').val()))) {
					$("#searchForm").attr("action", "${root}/board/list.tfarm").submit();
				}
			}else{
				$("#searchForm").attr("action", "${root}/board/list.tfarm").submit();
			}
		});
	});
</script>
<!-- ***********************게시판 테이블************************* -->
<div class="mr-sm-2 col-xl-9" style="margin: 26px; float: left;">
	<legend style="font-weight: bold">${category}</legend>
	<table class="table table-hover" style="table-layout: fixed;">
		<colgroup>
			<col style="width: 70px;" />
			<col style="width: 300px;" />
			<col style="width: 100px;" />
			<col style="width: 70px;" />
			<col style="width: 70px;" />
		</colgroup>
		<thead>
			<tr class="table-active" style="text-align: center">
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">조회수</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="article" items="${articlelist}">
				<tr style="text-align: center; margin: 1px">
					<th scope="row">${article.seq}</th>
					<td
						style="white-space: nowrap; word-wrap: break-word; text-overflow: ellipsis; overflow: hidden;">
						<a style="color: black;"
						href="javascript:viewArticle('${bcode}', '${pg}', '${key}', '${word}', '${article.seq}');">${article.subject}</a>
					</td>
					<td>${article.id}</td>
					<td>${article.hit}</td>
					<td>${article.logtime}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- ************************글쓰기 버튼**************************** -->
	<c:if test="${userInfo.mem_state == 1}">
		<div style="float: right; margin-bottom: 10px">
			<button type="button" class="btn btn-info"
				onclick="javascript:moveWrite('${bcode}');">글쓰기</button>
		</div>
	</c:if>
	<!-- ************************페이지 네비바 시작**************************** -->
	${navigator.navigator}
	<!-- ************************페이지 네비바 종료**************************** -->

	<!-- ************************검색창**************************** -->
	<div style="padding-left: 280px">
		<form class="form-inline my-2 my-lg-0" name="searchForm"
			id="searchForm" method="get" action="">
			<input type="hidden" id="bcode" name="bcode" value="${bcode}">
			<input type="hidden" id="pg" name="pg" value="1"> <select
				class="custom-select" name="key" id="key" style="width: 120px">
				<option selected="">선택하세요</option>
				<option value="seq">글번호</option>
				<option value="id">작성자</option>
				<option value="subject">제목</option>
			</select> <input class="form-control mr-sm-2" name="word" id="word"
				type="text" style="width: 300px">
			<button class="btn btn-secondary my-2 my-sm-0" type="button"
				id="searchbtn" name="searchbtn">Search</button>
		</form>
	</div>
</div>
<!-- ************************검색창**************************** -->
<%@ include file="/common/footer.jsp"%>