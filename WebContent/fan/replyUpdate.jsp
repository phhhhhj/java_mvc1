<%@page import="bean.ReplyDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><jsp:useBean id="dto" class="bean.ReplyDTO"></jsp:useBean><jsp:setProperty property="*" name="dto"/><%
	ReplyDAO dao = new ReplyDAO();
	int result = dao.update(dto);
	%><%= result %>