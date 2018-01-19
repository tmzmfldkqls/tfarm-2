<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header_board.jsp"%>
<script type="text/javascript" src="${root}/js/board.js"></script>
<script>
control = "/reboard";
</script>
<!-- ***********************게시판 테이블************************* -->
<div class="mr-sm-2 col-xl-9"style="margin:26px; float:left;" >
<legend style="font-weight:bold">${category}</legend>
	<table class="table table-hover" style="table-layout:fixed;">
		<colgroup>
		    <col style="width: 70px;"/>
		    <col style="width: 300px;"/>
		    <col style="width: 100px;"/>
		    <col style="width: 70px;"/>
		    <col style="width: 70px;"/>
  		</colgroup>
	  	<thead>
		    <tr class="table-active" style="text-align:center">
		      <th scope="col">번호</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성자</th>
		      <th scope="col">조회수</th>
		      <th scope="col">작성일</th>
		    </tr>
	  	</thead>
	  	<tbody>
		  	<c:forEach var="article" items="${articlelist}">
				<tr style="text-align:center; margin:1px">
			      <th scope="row">${article.seq}</th>
			      <td style="white-space:nowrap; word-wrap: break-word; text-overflow:ellipsis; overflow:hidden; text-align:left">
			      	<a style="color:black;" href="javascript:viewArticle('${bcode}', '${pg}', '${key}', '${word}', '${article.seq}');">

			      		<img src="${root}/img/blank.gif" width="${article.lev * 18}" height="20">
							      	
			      	${article.subject}</a>
			      </td>
			      <td>${article.id}</td>
			      <td>${article.hit}</td>
			      <td>${article.logtime}</td>
		    	</tr>
			</c:forEach>
	  	</tbody>
	</table> 
<!-- ************************글쓰기 버튼**************************** -->	
	<div style="float:right; margin-bottom:10px">
		<button type="button" class="btn btn-info" onclick="javascript:moveWrite('${bcode}');">글쓰기</button>
	</div>
<!-- ************************페이지 네비바 시작**************************** -->
${navigator.navigator}
<!-- ************************페이지 네비바 종료**************************** -->

<!-- ************************검색창**************************** -->
	<div style="padding-left:280px">
		<form class="form-inline my-2 my-lg-0">
		  <select class="custom-select" style="width:100px">
		      <option selected="">전체</option>
		      <option value="1">글번호</option>
		      <option value="2">작성자</option>
		      <option value="3">제목</option>
	      </select>
	      <input class="form-control mr-sm-2" type="text" placeholder="Sdddsfsearch" style="width:300px">
	      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
	    </form>
	</div>
<!-- ************************검색창**************************** -->
</div>
<%@ include file="/common/footer.jsp"%>