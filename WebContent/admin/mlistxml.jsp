<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.tfarm.member.model.MemberDetailDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="memberList" value="${memberList}"/>
<c:forEach var="member" items="${memberList}">
	<memberlist>
			<member>
				<userid>${member.getMem_id}</userid>
				<name>${member.getMem_id}</name>
				<email>${member.getMem_email1()}</email>
				<state>${member.getMem_state()}</state>
				<joindate>${member.getMem_join_date()}</joindate>
			</member>
	</memberlist>
</c:forEach>
