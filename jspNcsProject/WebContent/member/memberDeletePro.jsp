<%@page import="jspNcsProject.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<%
	if(session.getAttribute("memId") == null){%>
		<script>
			alert("로그인 후 이용하세요");
			window.location="loginForm.jsp";
		</script>
	<%}else{
		
		request.setCharacterEncoding("UTF-8");
		
		String id = (String)session.getAttribute("id");
		String pw = request.getParameter("pw");
		
		MemberDAO dao = MemberDAO.getInstance();
		boolean res = dao.loginCheck(id, pw);
		
		if(res){
			//dao.deleteMember(id);
		}
		
		
%>
<body>

</body>
<% }%>
</html>