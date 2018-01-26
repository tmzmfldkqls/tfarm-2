<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header_board.jsp"%>

<script src="https://use.fontawesome.com/b4e68bb341.js"></script>
<script>
	control = "/reboard";

	function moveReply() {
		document.getElementById("bcode").value = "${bcode}";
		document.getElementById("pg").value = "1";
		document.getElementById("key").value = "";
		document.getElementById("word").value = "";
		document.getElementById("seq").value = "${article.seq}";

		document.getElementById("commonForm").action = "${root}/reboard/reply.tfarm";
		document.getElementById("commonForm").submit();
	}
</script>

<!-- ******************일반 게시판 뷰********************** -->
<div class="mr-sm-2 col-xl-9"
	style="padding-top: 25px; padding-bottom: 25px; padding-right: 15px;">
	<div class="card">
		<div class="card-body">
			<button class="btn btn-primary" type="button" style="margin-bottom: 10px;">${category}</button>
			<h2 class="card-title" style="margin-bottom: 20px;">${article.subject}</h2>

			<h6>
				<strong><span class="card-subtitle mb-2 text-muted"
					style="margin: 10px;">${article.id}</span></strong> <span
					style="margin: 10px;"><strong><i
						class="fa fa-commenting-o" aria-hidden="true"></i> <span
						class="card-subtitle mb-2 text-muted">댓글수</span></strong></span> <span
					style="margin: 10px;"><strong><i class="fa fa-eye"
						aria-hidden="true"></i><span class="card-subtitle mb-2 text-muted">${article.hit}</span></strong></span>
				<span style="margin: 10px;"><strong style="float: right;"><i
						class="fa fa-clock-o" aria-hidden="true"></i><span
						class="card-subtitle mb-2 text-muted">${article.logtime}</span></strong></span>
			</h6>
			<hr style="border: solid 0.5px gray;">

			<p class="card-text"
				style="margin: 10px 0 30px; line-height: 1.7em; min-height: 200px;">${article.content}</p>


			<div class="form-group">
				<div style="float: left">
					<c:if test="${userInfo.mem_id eq article.id||userInfo.mem_state == 1}">
						<button class="btn btn-secondary" type="button">
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i> 수정
						</button>
						<button class="btn btn-secondary" type="button">
							<i class="fa fa-trash-o" aria-hidden="true"></i> 삭제
						</button>
					</c:if>
				</div>
				<div style="float: right">
					<c:if test="${userInfo.mem_state == 1}">
						<button class="btn btn-secondary"
							onclick="javascript:moveReply();">
							<i class="fa fa-reply" aria-hidden="true"></i> 답변
						</button>
					</c:if>
					<button class="btn btn-secondary" type="button" onclick="javascript:listArticle('${bcode}', '${pg}', '${key}', '${word}')">
						<i class="fa fa-list" aria-hidden="true"></i> 목록
					</button>
				</div>
			</div>


			<div
				style="border: 1px solid rgba(0, 0, 0, 0.125); margin-top: 80px;">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><span
						style="padding-right: 20px;"><i class="fa fa-caret-up"
							aria-hidden="true"></i> <b>이전글</b></span> <a
						href="javascript:viewArticle('${bcode}', '${pg}', '${key}', '${word}', '${article.seq-1}');">이전글
							제목입니다.</a> <span style="float: right;"> 이전 글 날짜 </span></li>

					<li class="list-group-item"><span
						style="padding-right: 20px;"><i class="fa fa-caret-down"
							aria-hidden="true"></i> <b>다음글</b></span> 다음글 제목입니다. <span
						style="float: right;"> 다음 글 날짜 </span></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<c:if test="${article == null}">
<script>
alert("글이 삭제되었거나 존재하지 않는 글입니다.");
listArticle('${bcode}', '${pg}', '${key}', '${word}');
</script>
</c:if>


<!-- ******************우리가 코딩해야하는 부분 끝********************** -->
<%@ include file="/common/footer.jsp"%>