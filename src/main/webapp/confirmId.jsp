<%@page import="mvc01.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String id = request.getParameter("id");
%>
<script type="text/javascript">
	function wincl() {
		// opener: 현재 페이지를 열어준 부모 페이지
		opener.document.frm.id.value="<%=id%>";
		window.close();
	}
</script>
</head>
<body>
<%
	MemberDao memDao = MemberDao.getInstance();
	int result = memDao.confirm(id);
	
	if(result == 0) {
%>	
		<%=id %>는 사용할 수 있습니다<p>
		<input type="button" value="닫기" onclick="wincl()">		
<%	} else {	%>
		<%=id %>는 이미 존재하는 아이디 입니다<p>
		<form>
			<!-- form 태그에 action이 없으므로 submit할 경우 현재 페이지 다시 실행 -->
			아이디: <input type="text" name="id"><p>
			<input type="submit" value="확인">
		</form>
<%	}	%>
</body>
</html>