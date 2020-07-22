<%@page import="bean.BasketDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
	int no=Integer.parseInt(request.getParameter("no"));
	BasketDAO dao = new BasketDAO();
	int result = dao.delete(no);
%><%=result %>