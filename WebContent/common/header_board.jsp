<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<c:set var="bcode" value="${querystring.bcode}"/>
<c:set var="pg" value="${querystring.pg}"/>
<c:set var="key" value="${querystring.key}"/>
<c:set var="word" value="${querystring.word}"/>
<script type="text/javascript" src="${root}/js/board.js"></script>

<form id="commonForm" name="commonForm" method="get" action="">
	<input type="hidden" id="bcode" name="bcode" value="${bcode}">
	<input type="hidden" id="pg" name="pg" value="${pg}">
	<input type="hidden" id="key" name="key" value="${key}">
	<input type="hidden" id="word" name="word" value="${word}">
	<input type="hidden" id="seq" name="seq" value="">
</form>