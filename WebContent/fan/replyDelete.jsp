<%@page import="bean.ReplyDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
    int selectNo = Integer.parseInt(request.getParameter("no"));
	ReplyDAO dao = new ReplyDAO();
	int result = dao.delete(selectNo);
	%><%= result %>