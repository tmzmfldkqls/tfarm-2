<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header_board.jsp" %>
<script src="https://use.fontawesome.com/b4e68bb341.js"></script>
<script>
control="/ticket";
</script>

<!-- ******************일반 게시판 뷰********************** -->
<div class="mr-sm-2 col-xl-9" style="padding-top:25px; padding-bottom:25px; padding-right:15px;">
<div class="card" >
  <div class="card-body">
    <button class="btn btn-primary" type="button" style="margin-bottom:10px;">${category}</button>
    <h2 class="card-title" style="margin-bottom:20px;">${article.subject}</h2>
    
    <h6>
    <strong><span class="card-subtitle mb-2 text-muted" style="margin:10px;">${article.id}</span></strong>
    <span style="margin:10px;"><strong><i class="fa fa-commenting-o" aria-hidden="true"></i> <span class="card-subtitle mb-2 text-muted"> 댓글수</span></strong></span>
    <span style="margin:10px;"><strong><i class="fa fa-eye" aria-hidden="true"></i><span class="card-subtitle mb-2 text-muted">${article.hit}</span></strong></span>       
    <span style="margin:10px;"><strong  style="float:right;"><i class="fa fa-clock-o" aria-hidden="true"></i><span class="card-subtitle mb-2 text-muted" >${article.logtime}</span></strong></span>
    </h6>  
    <hr style="border:solid 0.5px gray;">
    <p class="card-text" style="margin:10px 0 30px; line-height:1.7em;">${article.content}</p>	
   	<div style="text-align:center">
   		<img src="${root}/upload/${article.savefolder}/${article.save_picture}" class="img-thumbnail" alt="Lights" style="height:400px">
   	</div><br><br>
	<div class="form-group" >
	<button class="btn btn-secondary" type="button"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 수정</button>
	<button class="btn btn-secondary" type="button"><i class="fa fa-trash-o" aria-hidden="true"></i> 삭제</button>	
	
	<span  style="float:right;">
	<button class="btn btn-secondary" type="button"><i class="fa fa-list" aria-hidden="true"></i> 목록</button>

	</span>
	
	</div>


<div  style="border:1px solid rgba(0,0,0,0.125); margin-top:35px;">
  <ul class="list-group list-group-flush">
    <li class="list-group-item" ><span style="padding-right:20px;"><i class="fa fa-caret-up" aria-hidden="true"></i> <b>이전글</b></span> <a href="javascript:viewArticle('${bcode}', '${pg}', '${key}', '${word}', '${article.seq-1}');">이전글 제목입니다.</a>
    <span style="float:right;">
    이전 글 날짜
    </span>
    </li>

    <li class="list-group-item" ><span style="padding-right:20px;"><i class="fa fa-caret-down" aria-hidden="true"></i> <b>다음글</b></span> 다음글 제목입니다.
    <span style="float:right;">
    다음 글 날짜
    </span>
    </li>
  </ul>
</div>


<div style="margin-top:50px;">
<span class="text-danger">
<i class="fa fa-commenting-o" aria-hidden="true"></i> 댓글목록(댓글개수)
</span>
</div>

<div style="margin-top:25px; font-size:13px;">
<div class="jumbotron" style="padding:16px 20px; background-color:#F6F6F6;">
<span style="padding-right:10px;"><b>댓글작성자 아이디</b></span> <span class="badge badge-primary"><i class="fa fa-reply" aria-hidden="true"></i> 답글</span>
<span style="float:right;"><i class="fa fa-clock-o" aria-hidden="true"></i> 댓글 작성 날짜</span>

<div style="margin-top:10px; margin-bottom:10px;">답글내용</div>
    <hr style="border:solid 0.5px gray;">
</div>
</div>

    <div class="form-group">
      <label for="exampleTextarea">댓글쓰기</label>
      <textarea class="form-control" id="exampleTextarea" rows="3" placeholder="댓글 내용을 입력해 주세요."></textarea>
       <span><button class="btn btn-primary" type="button" style="margin-bottom:10px; float:right; margin-top:10px;" >댓글 등록</button></span>  
    </div>
    
  </div>
</div>
</div>



<!-- ******************우리가 코딩해야하는 부분 끝********************** -->
<%@ include file="/common/footer.jsp" %>