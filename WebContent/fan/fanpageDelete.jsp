<%@page import="bean.FanpageDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
    int selectNo = Integer.parseInt(request.getParameter("no"));
	FanpageDAO dao = new FanpageDAO();
	int result = dao.delete(selectNo);
	%><%= result %>