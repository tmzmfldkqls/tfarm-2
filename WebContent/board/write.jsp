<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>

<c:if test="${userInfo != null}"> 

<!-- ******************티켓 글쓰기********************** -->
<form id="writeForm" name="writeForm" method="" action="" style="margin: 0px">

<input type="hidden" name="bcode" value="${bcode}">
<input type="hidden" name="pg" value="1">
<input type="hidden" name="key" value="">
<input type="hidden" name="word" value="">

<div class="mr-sm-2 col-xl-10"style="margin:20px; float:left; width:900px;" >
<div class="form-group">
      <label for="writeTicket">일반글쓰기</label>
      
      <div class="form-group">
  <input type="text" class="form-control" placeholder="글 제목을 입력해주세요" id="inputSubject">
</div>

 <div class="form-group" style="float:left;">
    <select class="custom-select">
      <option selected="">게시판종류</option>
      <option value="1">일반게시판</option>
      <option value="2">신고게시판</option>
    </select>
  </div>
      
      <textarea class="form-control" id="writeBoard" rows="20"></textarea>
    </div>
<!-- ******************등록 버튼*********************** -->
<!-- *************디비 인서트 /ok.jsp로 이동 ************** -->

<div>
<a href="">
<button type="button" class="btn btn-info">
등록
</button>
</a>

<!-- ******************등록 버튼*********************** -->

<!-- ******************취소 버튼 ********************** -->
<!-- ********취소 클릭시 글목록으로 돌아가기 ***************** -->

<a href="">
<button type="button" class="btn btn-info">
취소
</button>
</a>
<!-- ******************취소 버튼 ********************** -->
</div>
<!-- ************************글쓰기는 네비바가 없더도 되어서 삭제**************************** -->
</div>

</form>
<!-- ******************우리가 코딩해야하는 부분 끝********************** -->
</c:if>
<%@ include file="/common/footer.jsp" %>