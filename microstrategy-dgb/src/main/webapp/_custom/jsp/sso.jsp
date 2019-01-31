<%@ page contentType="text/html; charset=utf-8" 
%><%
	//http://localhost:8080/MicroStrategy.custom/_custom/jsp/sso.jsp?mstrUserId=administrator
	String mstrUserId = request.getParameter("mstrUserId");
	String mstrUserPwd = request.getParameter("mstrUserPwd");

	session.setAttribute("mstrUserId", mstrUserId);
	//System.out.println("=> 로그인 완료" + mstrUserId);
	
%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<script type="text/javascript"></script>
</head>
<body>
</body>
</html>