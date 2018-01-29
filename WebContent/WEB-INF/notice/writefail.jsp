<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header_board.jsp"%>
<script type="text/javascript">
control="/board";
</script>
	<div class="card mr-sm-2 col-xl-9" style="text-align:center; border:0px">
	  	<div class="card-body" style="padding-top: 150px;">
	  		<img src="${root}%>/img/main_img.png">
	    	<h4 class="card-title">게시글 등록에 실패 하였습니다.</h4>
	    	<h6 class="card-subtitle mb-2 text-muted">대한민국 No.1 티켓 TFARM</h6>
	    	<a class="card-link" href="javascript:moveWrite('${bcode}');">다시 작성하기</a>
	    	<a class="card-link" href="javascript:listArticle('${bcode}', '${pg}', '${key}', '${word}')">목록</a>
	  	</div>
	</div>

<%@ include file="/common/footer.jsp"%>