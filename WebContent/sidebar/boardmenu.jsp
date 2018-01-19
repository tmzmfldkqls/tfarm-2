<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/> 
<c:if test="${boardmenu != null}">
<table>
<c:set var="ccode" value="1"/>
<c:forEach var="board" items="${boardmenu}">
	<c:if test="${ccode != board.ctype}">
		<c:set var="ccode" value="${board.ctype}"/>
	<a href="#"  style="height:3px; background-color:black;"></a>
	</c:if>
	<a href="${root}/${board.controller}/list.tfarm?bcode=${board.bcode}&pg=1&key=&word=" class="list-group-item list-group-item-action" style="border-radius:0px;">${board.bname}</a>
</c:forEach>
</table>
</c:if>
<c:if test="${boardmenu == null}">
	<c:redirect url="/board/boardmenu.tfarm"/>
</c:if>