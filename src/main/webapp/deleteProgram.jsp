<%@page import="mvc01.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ include file="memberCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String pwd = request.getParameter("pwd");
	MemberDao memDao = MemberDao.getInstance();
	
	int result = memDao.delete(id, pwd);
	if (result == 1) { 
		session.invalidate();
%>
	<script>
		alert("탈퇴 완료되었습니다");
		location.href = "loginForm.jsp";
	</script>
<%	} else if (result == 0) { %>
	<script>
		alert("암호가 잘못되었습니다");
		history.go(-1);
	</script>
<%	} else { %>
	<script>
		alert("잘못된 회원입니다");
		history.go(-1);
	</script>
<%	} %>
</body>
</html>