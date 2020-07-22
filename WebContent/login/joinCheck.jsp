<%@page import="bean.MemberDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><jsp:useBean id="dto" class="bean.MemberDTO"></jsp:useBean><jsp:setProperty property="*" name="dto"/><%
	MemberDAO dao = new MemberDAO();
    int result = dao.insert(dto);
    if (result == 1) { // 회원가입 성공 -> 이름 세션 처리 -> joinFin.jsp에서 ㅇㅇㅇ님 환영합니다 띄워주려고
    	session.setAttribute("name", dto.getName());
    }
%><%= result %>