<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header_board.jsp" %>
<script type="text/javascript">
control = "/reboard";

function modifyNotice() {
	if($("#subject").val() == "") {
		alert("제목입력!!!");
		return;
	} else if($("#content").val() == "") {
		alert("내용입력!!!");
		return;
	} else {
		document.writeForm.action = root + control + "/modify.tfarm";
		document.writeForm.submit();
	}
}
</script>


<!-- ******************티켓 글쓰기********************** -->
<form id="writeForm" name="writeForm" method="post" action="" style="margin: 0px">

	<input type="hidden" name="bcode" value="${bcode}">
	<input type="hidden" name="pg" value="1">
	<input type="hidden" name="key" value="">
	<input type="hidden" name="word" value="">
	<input type="hidden" name="seq" value="${article.seq}">
	
	<div class="mr-sm-2 col-xl-10"style="margin:20px; float:left; width:900px;" >
		<div class="form-group">
			<legend style="font-weight:bold">${category}수정하기</legend>
			<div class="form-group">
				<input type="text" class="form-control" name="subject" id="subject" value="${article.subject}"></input>
			</div>
	    
	    	<textarea class="form-control" name="content" id="content" rows="20">${article.content}</textarea>
	
		</div>
	<!-- ******************수정 취소 버튼*********************** -->
		<div>
			<button type="button" class="btn btn-info" onclick="javascript:modifyNotice();">수정</button>
			<button type="button" class="btn btn-info" onclick="javascript:listArticle('${bcode}', '${pg}', '${key}', '${word}')">취소</button>
		</div>
	</div>
</form>
<%@ include file="/common/footer.jsp" %>