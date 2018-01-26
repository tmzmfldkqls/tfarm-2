<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header_board.jsp" %>
<script type="text/javascript" src="${root}/js/board.js"></script>
<script>
control = "/ticket";
</script>
	
	<div class="col-xl-10" style="float:left; width:70%;">
           <div>
                <h4 id="container">티켓</h4>
            </div>
            <!-- 리스트 -->
            
            <c:forEach varStatus="i" var="article" items="${articlelist}">
           <div class="row">
            <div class="col- md-3">              
                  <img src="${root}/upload/${article.savefolder}/${article.save_picture}" class="img-thumbnail" alt="Lights" style="width:100%; height:130px">
                  <div class="caption">
                  <a style="color:black;" href="javascript:viewArticle('${bcode}', '${pg}', '${key}', '${word}', '${article.seq}')">${article.subject}</a>
                  </div>              
            </div>
         </div>
         </c:forEach>
          <!-- 리스트 끝 -->
         
         <div>
			<button type="button" class="btn btn-info" onclick="javascript:moveWrite('${bcode}');">티켓 올리기</button>
		</div>   
		
		<div align="center">
		  ${navigator.navigator}
		</div>
	</div>

<%@ include file="/common/footer.jsp"%>