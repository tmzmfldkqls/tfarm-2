<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>

<!-- ******************우리가 코딩해야하는 부분 시작  col-xl-10********************** -->
<!---------------------------------  최신 앨범-------------------------------    -->

   <div class="col-xl-10">
   
        	<div>
                <h4 id="container">[인기앨범]</h4>
            </div>
        	<div class="row">
				<div class="col-md-3">
					<div class="thumbnail">
						<img src="${root }/img/0.PNG" class="img-rounded" alt="Lights" style="width:100%">
						<div class="caption">
							<p>그림1</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<img src="${root }/img/1.PNG" class="img-rounded" alt="Nature" style="width:100%">
						<div class="caption">
							<p>그림1</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<img src="${root }/img/2.PNG" class="img-rounded" alt="Fjords" style="width:100%">
						<div class="caption">
							<p>그림1</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<img src="${root }/img/3.PNG" class="img-rounded" alt="Fjords" style="width:100%">
						<div class="caption">
							<p>그림1</p>
						</div>
					</div>
				</div>
			</div>
        	<div class="row">
				<div class="col-md-3">
					<div class="thumbnail">
						<img src="${root }/img/4.PNG" class="img-rounded" alt="Lights" style="width:100%">
						<div class="caption">
							<p>그림1</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<img src="${root }/img/0.PNG" class="img-rounded" alt="Nature" style="width:100%">
						<div class="caption">
							<p>그림1</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<img src="${root }/img/0.PNG" class="img-rounded" alt="Fjords" style="width:100%">
						<div class="caption">
							<p>그림1</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<img src="${root }/img/6.PNG" class="img-rounded" alt="Fjords" style="width:100%">
						<div class="caption">
							<p>그림1</p>
						</div>
					</div>
				</div>
			</div>
			<br><br>
			<div class="row">					
				<div class="col-sm-5" style="margin-left:16%;">
		        	<div>
		                <h4 id="container">[인기글]</h4>
		            </div>
		            <div class="table-responsive">
		                <!-- <table class="table table-bordered"> -->
		                <table class="table table-hover">
		                    <colgroup>
		                        <col width="*">
		                        <col width="60">
		                        <col width="60">
		                    </colgroup>
		                    <thead>
		                    <tr><th colspan="3"></th></tr>
		                    <tr>
		                        <th class="text-center">제목</th>
		                        <th class="text-center">작성자</th>
		                        <th class="text-center">조회수</th>
		                    </tr>
		                    </thead>
		                    <tbody class="article_list">
		                    <!-- 글목록 start -->
		                    <tr>
		                        <td class="text-left">
		                        <a href="${root}/board/notice.tfarm">200. 안녕하세요~~~~~</a>		                  
		                        </td>
		                        <td class="text-center">안효인</td>
		                        <td class="text-center">777</td>		                      
		                    </tr>
		                    <tr>
		                        <td class="text-left">199. 안녕하세요~~~~~</td>
		                        <td class="text-center">안효인</td>
		                        <td class="text-center">777</td>		                        
		                    </tr>
		                    <tr>
		                        <td class="text-left">198. 안녕하세요~~~~~</td>
		                        <td class="text-center">안효인</td>
		                        <td class="text-center">777</td>
		                    </tr>
		                    <tr>
		                        <td class="text-left">197. 안녕하세요~~~~~</td>
		                        <td class="text-center">안효인</td>
		                        <td class="text-center">777</td>
		                    </tr>
		                    <tr>
		                        <td class="text-left">196. 안녕하세요~~~~~</td>
		                        <td class="text-center">안효인</td>
		                        <td class="text-center">777</td>
		                    </tr>
		                    <!-- 글목록 end -->
		                    </tbody>
						</table>
					</div>
				</div>
				
				<div class="col-sm-5">
		        	<div>
		                <h4 id="container">[최신글]</h4>
		            </div>
		            <div class="table-responsive">
		                <!-- <table class="table table-bordered"> -->
		                <table class="table table-hover">
		                    <colgroup>
		                        <col width="*">
		                        <col width="60">
		                        <col width="60">
		                    </colgroup>
		                    <thead>
		                    <tr><th colspan="3"></th></tr>
		                    <tr>
		                        <th class="text-center">제목</th>
		                        <th class="text-center">작성자</th>
		                        <th class="text-center">조회수</th>
		                    </tr>
		                    </thead>
		                    <tbody class="article_list">
		                    <!-- 글목록 start -->
		                    <tr>
		                        <td class="text-left">100. 안녕하세요~~~~~</td>
		                        <td class="text-center">안효인</td>
		                        <td class="text-center">777</td>
		                    </tr>
		                    <tr>
		                        <td class="text-left">99. 안녕하세요~~~~~</td>
		                        <td class="text-center">안효인</td>
		                        <td class="text-center">777</td>
		                    </tr>
		                    <tr>
		                        <td class="text-left">98. 안녕하세요~~~~~</td>
		                        <td class="text-center">안효인</td>
		                        <td class="text-center">777</td>
		                    </tr>
		                    <tr>
		                        <td class="text-left">97. 안녕하세요~~~~~</td>
		                        <td class="text-center">안효인</td>
		                        <td class="text-center">777</td>
		                    </tr>
		                    <tr>
		                        <td class="text-left">96. 안녕하세요~~~~~</td>
		                        <td class="text-center">안효인</td>
		                        <td class="text-center">777</td>
		                    </tr>
		                    <!-- 글목록 end -->
		                    </tbody>
						</table>
					</div>
				</div>
			</div>
       
        </div>

<!-- ******************우리가 코딩해야하는 부분 끝********************** -->
<%@ include file="/common/footer.jsp" %>