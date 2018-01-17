<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>

<script>
  function handleFileSelect(evt) {
    var files = evt.target.files; // FileList object

    // Loop through the FileList and render image files as thumbnails.
    for (var i = 0, f; f = files[i]; i++) {

      // Only process image files.
      if (!f.type.match('image.*')) {
        continue;
      }

      var reader = new FileReader();

      // Closure to capture the file information.
      reader.onload = (function(theFile) {
        return function(e) {
          // Render thumbnail.
          var span = document.createElement('span');
          span.innerHTML = ['<img class="thumb" src="', e.target.result,
                            '" title="', escape(theFile.name), '"/>'].join('');
          document.getElementById('list').insertBefore(span, null);
        };
      })(f);

      // Read in the image file as a data URL.
      reader.readAsDataURL(f);
    }
  }

  document.getElementById('files').addEventListener('change', handleFileSelect, false);
</script>

<!-- ************************왼쪽 목록**************************** -->


<!-- ******************티켓 파일 올리기 & 글쓰기********************** -->
<form id="writeForm" name="writeForm" method="" action="" enctype="multipart/form-data"
	style="margin: 0px">
<div id="attach_file_hdn"></div>

<input type="hidden" name="bcode" value="${bcode}">
<input type="hidden" name="pg" value="1">
<input type="hidden" name="key" value="">
<input type="hidden" name="word" value="">

<div class="mr-sm-2 col-xl-10"style="margin:20px; float:left; width:900px;" >
<div class="form-group">
      <label for="writeTicket" >티켓올리기</label>
      <br>
      <div class="form-group">
  <input type="text" class="form-control" placeholder="글 제목을 입력해주세요" id="inputSubject">
</div>
</div>
      
<!-- 게시판 리스트 -->
<div class="form-group" style="float:left; margin-right: 6px;">
<div style="float:left;">   
    <select class="custom-select">
      <option selected="">티켓종류</option>
      <option value="1">뮤지컬</option>
      <option value="2">콘서트</option>
      <option value="3">연극</option>
      <option value="4">클래식/무용</option>
      <option value="5">스포츠/레저</option>
      <option value="6">전시/행사</option>
      <option value="7">아동/가족</option>
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
      <input class="form-control" type="text" placeholder="공연장소를 입력하세요 ">
    </div>
  </div>
<!-- 공연장소 -->

<!-- 티켓금액 -->
  <div class="form-group" style="float:left;">
    <div class="input-group mb-3" style="float:left;">
      <div class="input-group-prepend" style="float:left;">
        <span class="input-group-text">￦</span>
      </div>
      <input class="form-control" type="text" placeholder="판매금액을 입력하세요 ">
    </div>
  </div>
<!-- 티켓금액 -->

<!-- 내용 작성 -->
	<div>
	<textarea class="form-control" id="writeBoard" rows="20"></textarea>
    </div>
<!-- 내용 작성 -->

<!-- 파일업로드 -->
    <div class="thumb">
	<input type="file" id="files" name="files[]" multiple="multiple"/>
	<output id="list"></output>
    </div>
<!-- 파일업로드 -->

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

</form>
<!-- ******************우리가 코딩해야하는 부분 끝********************** -->
<%@ include file="/common/footer.jsp" %>