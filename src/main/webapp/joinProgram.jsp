<%@page import="mvc01.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- Bean 설정 -->
<jsp:useBean id="member" class="mvc01.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<%
	MemberDao memDao = MemberDao.getInstance();
	int result = memDao.insert(member);
	
	if (result > 0) {
%>	<script>
		alert("회원가입 완료");
		location.href = "loginForm.jsp";
	</script>
<%	} else {	%>
	<script>
		alert("회원가입 실패");
		location.href = "joinForm.jsp";
	</script>
<%	}	%>

</body>
</html>