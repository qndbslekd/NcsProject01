<%@page import="jspNcsProject.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("utf-8");
String beforeName = request.getParameter("beforeName");
String num = request.getParameter("num");
ProductDAO dao = ProductDAO.getInstance();
String name = session.getAttribute("memName").toString();
String recomment = request.getParameter("recomment");
if(!recomment.equals("")){
int result  = dao.insertComment(num,name,recomment,beforeName);
System.out.println(result+"개의 답글이 입력되었습니다");
}
%>

<script type="text/javascript">
	opener.location.reload();
	self.close();

</script>
<body>

</body>
</html>