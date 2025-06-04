<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="memberCheck.jsp" %>






<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
	#header {
		width: 80%;
		margin: 0 auto;
		text-align: center;
	}
	#main {
		width: 80%;
		margin: 0 auto;
		text-align: center;
	}
	#footer {
		width: 80%;
		margin: 0 auto;
		text-align: center;
	}
	
</style>
</script>
</head>
<body>
	<div id="header">
	<h1>회원관리</h1>
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		        	<span class="navbar-toggler-icon"></span>
	        	</button>
			    <div class="collapse navbar-collapse" id="navbarNav">
			    	<div class="navbar-nav">
			        	<a class="nav-link" href="logOut.jsp">로그아웃</a>
			          	<a class="nav-link" href="joinForm.jsp">회원가입</a>
			          	<a class="nav-link" href="memberList.jsp">회원명단</a>
			          	<a class="nav-link" href="updateForm.jsp">회원정보 수정</a>
			          	<a class="nav-link" href="deleteForm.jsp">회원탈퇴</a>
			       	</div>
			    </div>
		  	</div>
		</nav>
	</div>
	
	<div id="main"><img alt="메인이미지" src="image/back.jpg"></div>
	
	<div id="footer">
		<h4>푸터</h4>
		<p> 모든 저작권은 중앙정보처리 회사에 있습니다 </p>
		<p> 02-000-0000 </p>
	</div>
</body>
</html>
