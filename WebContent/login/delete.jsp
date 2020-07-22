<%@page import="bean.MemberDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><jsp:useBean id="dto" class="bean.MemberDTO"></jsp:useBean><jsp:setProperty property="*" name="dto"/><%
	MemberDAO dao = new MemberDAO();
    int result = dao.delete(dto);
    if(result == 1){
    	session.invalidate(); // 회원 탈퇴 완료, 세션 끊기
    }
%><%= result %>