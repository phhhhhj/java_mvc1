<%@page import="bean.MemberDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><jsp:useBean id="dto" class="bean.MemberDTO"></jsp:useBean><jsp:setProperty property="*" name="dto"/><%
	MemberDAO dao = new MemberDAO();
    int result = dao.loginCheck(dto);
    if (result == 1) { // 로그인 성공 -> 세션 처리
    	session.setAttribute("id", dto.getId());
    }
%><%= result %>