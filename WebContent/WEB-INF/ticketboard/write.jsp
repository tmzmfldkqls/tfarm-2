<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header_board.jsp" %>
<script>
 control = "/ticket";
 
function writeTicket() {
		if($("#subject").val() == "") {
			alert("제목입력!!!");
			return;
		} else if($("#content").val() == "") {
			alert("내용입력!!!");
			return;
		} else {
			console.log("글쓰기 >>>>>"+$("#sbcode").val());
			$("#wbcode").val($("#sbcode").val());
			document.writeForm.action = "${root}/ticket/write.tfarm";
			document.writeForm.submit();
		}
	}
</script>

<!-- ************************왼쪽 목록**************************** -->


<!-- ******************티켓 파일 올리기 & 글쓰기********************** -->
<form id="writeForm" name="writeForm" method="post" action="" enctype="multipart/form-data"
	style="margin: 0px">
<div id="attach_file_hdn"></div>

<input type="hidden" id="wbcode" name="bcode" value="">
<input type="hidden" name="pg" value
="1">
<input type="hidden" name="key" value="">
<input type="hidden" name="word" value="">

<div class="mr-sm-2 col-xl-10"style="margin:20px; float:left; width:900px;" >
<div class="form-group">
      <label for="writeTicket" >티켓올리기</label>
      <br>
      <div class="form-group">
  <input type="text" class="form-control" placeholder="글 제목을 입력해주세요" id="subject" name ="subject">
</div>
</div>
      
<!-- 게시판 리스트 -->
<div class="form-group" style="float:left; margin-right: 6px;">
<div style="float:left;">   
    <select id="sbcode" class="custom-select">
      <option selected="">티켓종류</option>
      <option value="4">뮤지컬</option>
      <option value="5">콘서트</option>
      <option value="6">연극</option>
      <option value="7">클래식/무용</option>
      <option value="8">스포츠/레저</option>
      <option value="9">전시/행사</option>
      <option value="10">아동/가족</option>
    </select>
</div>    
</div>   
<!-- 게시판 리스트 -->

<!-- 공연장소 -->
<div class="form-group" style="float:left; margin-right: 6px;">
    <div class="input-group mb-3" style="float:left;">
    <div class="input-group-prepend" style="float:left;">
        <span class="input-group-text">장소</span>
      </div>
      <input name="loc" class="form-control" type="text" placeholder="공연장소를 입력하세요 ">
    </div>
  </div>
<!-- 공연장소 -->

<!-- 티켓금액 -->
  <div class="form-group" style="float:left;">
    <div class="input-group mb-3" style="float:left;">
      <div class="input-group-prepend" style="float:left;">
        <span class="input-group-text">￦</span>
      </div>
      <input name="price" class="form-control" type="text" placeholder="판매금액을 입력하세요 ">
    </div>
  </div>
<!-- 티켓금액 -->

<!-- 내용 작성 -->
	<div>
	<textarea name="content" class="form-control" id="content" rows="20"></textarea>
    </div>
<!-- 내용 작성 -->

<!-- 파일업로드 -->
    <div class="thumb">
	<input type="file" id="upfile" name="upfile" multiple="multiple"/>
	<output id="list"></output>
    </div>
<!-- 파일업로드 -->

<!-- ******************등록 버튼*********************** -->
<!-- *************디비 인서트 /ok.jsp로 이동 ************** -->

<div>
<button type="button" class="btn btn-info" onclick="javascript:writeTicket();">
등록
</button>

<!-- ******************등록 버튼*********************** -->

<!-- ******************취소 버튼 ********************** -->
<!-- ********취소 클릭시 글목록으로 돌아가기 ***************** -->

<button type="button" class="btn btn-info" onclick="javascript:listArticle('${bcode}', '${pg}', '${key}', '${word}')">
취소
</button>
<!-- ******************취소 버튼 ********************** -->
</div>
<!-- ************************글쓰기는 네비바가 없더도 되어서 삭제**************************** -->
</div>
</form>
<!-- ******************우리가 코딩해야하는 부분 끝********************** -->
<%@ include file="/common/footer.jsp" %>