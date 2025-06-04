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
	<h2>탈퇴하려면 암호를 입력하세요</h2>
	<form action="deleteProgram.jsp">
		<fieldset>
			<label for="pwd">암호: </label>
			<input type="password" name="pwd" id="pwd"><p>
			<input type="submit" value="확인">
		</fieldset>
	</form>
</body>
</html>