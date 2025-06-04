<%@page import="mvc01.Member"%>
<%@page import="java.util.List"%>
<%@page import="mvc01.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ include file="memberCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	tr:hover {background: orange;}
	td {text-align: center;}
</style>
</head>
<body bgcolor="yellow">
<%
	MemberDao memDao = MemberDao.getInstance();
	List<Member> members = memDao.list();
	if (members == null) {
		out.print("회원이 없습니다");
	} else {
%>
<h2>회원정보</h2>
<table bgcolor="pink" width="100%">
	<tr bgcolor="cyan"><th>아이디</th><th>이름</th><th>주소</th><th>전화번호</th><th>가입일</th></tr>
	<%
		for (Member mem : members) {
			out.print("<tr><td>" + mem.getId() + 
					  "</td><td>" + mem.getName() +
					  "</td><td>" + mem.getAddress() +
					  "</td><td>" + mem.getTel() +
					  "</td><td>" + mem.getRegDate() + "</td></tr>");
		}
	}
	%>
</table>
</body>
</html>