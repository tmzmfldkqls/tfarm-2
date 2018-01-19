<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<div class="mr-sm-2 col-xl-10"style="margin:26px; float:left; width:1100px;" >
<div style="padding-left:1000px;margin-bottom:10px">
<button type="button" class="btn btn-primary">글쓰기</button>
</div>
<table class="table table-hover" style="table-layout:fixed;">
  <thead>
    <tr class="table-active" style="text-align:center">
      <th scope="col" width="100px">번호</th>
      <th scope="col" width="500px">제목</th>
      <th scope="col" width="200px">작성자</th>
      <th scope="col" width="80px">조회수</th>
      <th scope="col" >작성일</th>
    </tr>
  </thead>
  <tbody>
    <tr style="text-align:center; margin:1px">
      <th scope="row">12341</th>
      <td style="white-space:nowrap; word-wrap: break-word; text-overflow:ellipsis; overflow:hidden;">
      	<a style="color:black;" href="#">으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하으하하하하</a>
      </td>
      <td>dfefff11</td>
      <td>1</td>
      <td>2018-01-12</td>
    </tr>
 
  </tbody>
</table> 

<!-- ************************페이지 네비바**************************** -->
<div style="padding-left:350px; padding-bottom:50px">
  <ul class="pagination">
    <li class="page-item disabled">
      <a class="page-link" href="#">&laquo;</a>
    </li>
    <li class="page-item active">
      <a class="page-link" href="#">1</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">2</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">3</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">4</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">5</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">&raquo;</a>
    </li>
  </ul>
</div>
<div style="padding-left:200px">
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
</div>
<%@ include file="/common/footer.jsp"%>