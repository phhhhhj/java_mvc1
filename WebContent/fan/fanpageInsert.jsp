<%@page import="bean.FanpageDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><jsp:useBean id="dto" class="bean.FanpageDTO"></jsp:useBean><jsp:setProperty property="*" name="dto"/><%
	FanpageDAO dao = new FanpageDAO();
	dao.insert(dto);
	%>