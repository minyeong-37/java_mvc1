<%@page import="mvc01.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	MemberDao memDao = MemberDao.getInstance();
	
	int result = memDao.check(id, pwd);
	if (result == 1) {
		session.setAttribute("id", id);
		System.out.println("Login Success");
		response.sendRedirect("main.jsp");
	} else if (result == 0) {
		session.setAttribute("id", "");
%>	<script>
		alert("잘못된 암호입니다");
		history.go(-1);
	</script>
<%	} else {	%>
	<script>
		alert("존재하지 않는 ID 입니다");
		history.go(-1);
	</script>
<%	}	%>
</body>
</html>