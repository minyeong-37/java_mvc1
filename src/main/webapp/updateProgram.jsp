<%@page import="mvc01.Member"%>
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


<jsp:useBean id="member" class="mvc01.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>

<%
	/*
	Member member = new Member();
	member.setId(id);
	member.setPwd(request.getParameter("pwd"));
	member.setName(request.getParameter("name"));
	member.setAddress(request.getParameter("address"));
	member.setTel(request.getParameter("tel"));
	*/
	
	MemberDao memDao = MemberDao.getInstance();
	int result = memDao.update(member);
	
	if (result > 0) {
%>	<script>
		alert("회원 정보 수정 완료");
		location.href = "main.jsp";
	</script>
<%	} else {	%>
	<script>
		alert("회원 정보 수정 오류");
		history.back();
	</script>
<%	}	%>
</body>
</html>