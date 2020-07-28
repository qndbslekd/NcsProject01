<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="../resource/team05_style.css" type="text/css" rel="stylesheet"/>
<title>header</title>
<style>
#header {
	width: 1000px;
	border-collapse: collapse;
}
#header .title {
	font-size: 40px;
}
#header .tab {
	width: 250px;
	background-color: rgb(139, 195, 74);

	height:50px;
	color:white;
	font-size:20px;
	cursor:pointer;
}

#header .tab:hover {
	color:#edd713;
}
#header .tab:focus{
	color:#edd713;
}

</style>
</head>
<script type="text/javascript">
	var nowUrl = window.location;
	if(nowUrl == 'http://localhost:8080/jnp/header.jsp'){
		window.location = 'information/information.jsp';
	}
</script> 
<%
	String mode = request.getParameter("mode");
	if(mode == null) {mode="";}
	System.out.println("===HEADER START===");
	System.out.println("Header Session값 : "+session.getAttribute("memId"));
	if(session.getAttribute("memId")==null){ //비로그인상태(세션없을때)
		// 세션이 없지만 쿠키가 있는지 2중 체크
		String id = null, pw = null, auto = "n",name = null; 
		Cookie[] cookies = request.getCookies();
		if(cookies !=null){ 
			for(Cookie cookie : cookies){
				System.out.println("Cookie Null Test :"+cookie.getName());
				if(cookie.getName().equals("autoId")){
					id = cookie.getValue();
					System.out.println("쿠키 아이디 :"+id);
					}		
				if(cookie.getName().equals("autoPw")){
					pw = cookie.getValue();
					System.out.println("쿠키 pw :"+pw);
					}		
				if(cookie.getName().equals("autoCh")) {
					auto = cookie.getValue();
					System.out.println("쿠키 auto :"+auto);
					}
				if(cookie.getName().equals("autoName")) {
					name = cookie.getValue();
					System.out.println("쿠키 name :"+name);
					}	
			}
		} 
		if(auto.equals("y")&&id!=null&&pw!=null){
			System.out.println("loginPro Header Redirect TEST2 : session = cookie ");
			session.setAttribute("memId", id);
			session.setAttribute("memName", name);
		}
		System.out.println("===HEADER END===");
	}
%>
<body>
<div style="width:1100px; margin:auto;">
	<table id="header">
			<td></td>
			<td></td>
			<td class="title" style="padding-top:20px;">
				<a href="/jnp/main.jsp"><img src="/jnp/save/logo.png" style="width:250px"/></a>
			</td>
			<td></td>
			<td style="vertical-align:bottom; padding-bottom:10px;">
			<%if(session.getAttribute("memId") == null){
			%>
				<button class = "grayButton" style="width: 80px; height: 30px; text-align: center" onclick="window.location='/jnp/member/loginForm.jsp'">로그인</button>
				<button class = "grayButton" style="width: 80px; height: 30px; text-align: center"  onclick="window.location='/jnp/member/signupForm.jsp'">회원가입</button>
			</td>
			<%}else{%>
				<p><%=session.getAttribute("memName")%>님 환영합니다!</p>		
				<button class = "grayButton" style="width: 80px; height: 30px; text-align: center" onclick="window.location='/jnp/logoutPro.jsp'">로그아웃</button>
				<button class = "grayButton" style="width: 100px; height: 30px; text-align: center" onclick="window.location='/jnp/member/myPage.jsp'">마이페이지</button>
			</td>
			<%} %>
		</tr>
		<tr>
			<td class="tab" onclick="window.location='/jnp/information/informationList.jsp'" <%if(mode.equals("information")) { %>style="color:#edd713;"<%} %>>채식정보</td>
			<td class="tab" onclick="window.location='/jnp/recipe/recipeList.jsp?mode=num'" <%if(mode.equals("recipe")) { %>style="color:#edd713;"<%} %>>레시피</td>
			<td class="tab" onclick="window.location='/jnp/product/productList.jsp'" <%if(mode.equals("product")) { %>style="color:#edd713;"<%} %>>제품</td>
			<td class="tab" onclick="window.location='/jnp/freeboard/board.jsp'"<%if(mode.equals("freeboard")) { %>style="color:#edd713;"<%} %>>자유게시판</td>
			<td class="tab" onclick="window.location='/jnp/ask.jsp'"<%if(mode.equals("ask")) { %>style="color:#edd713;"<%} %>>문의하기</td>
		</tr>
	</table>
	</div>
	<br/>
</body>
</html>