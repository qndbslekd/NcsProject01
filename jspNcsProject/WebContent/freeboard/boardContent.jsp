<%@page import="jspNcsProject.dto.FreeBoardDTO"%>
<%@page import="jspNcsProject.dao.FreeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resource/team05_style.css" type="text/css" rel="stylesheet"/>
<title>글 상세보기</title>
</head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	FreeBoardDAO dao = FreeBoardDAO.getInstance();
	FreeBoardDTO article = dao.selectArticle(num);
	//활동명 받아dhdl
	String name = dao.selectNameById(article.getWriter());
		
%>
<body>
		<table>
		

			<tr>
				<td>제목</td>			
				<td><%=article.getTitle()%></td>		
			</tr>
			<tr>
				<td>추천수</td>
				<td><%=article.getRecommend()%>
				<%if(session.getAttribute("memId")!=null){%>
				<td><button onclick="window.location='recommendArticle.jsp?num=<%=article.getNum()%>'">추천하기</button></td>
				<%}%>
			</tr>
			<tr>
				<td>조회수</td>
				<td><%= article.getRead_count()%></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=name%></td>		
			</tr>
			<tr>
				<td>카테고리</td>
				<td><%=article.getCategory()%></td>		
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="100" name="content" readonly><%=article.getContent()%></textarea></td>		
			</tr>
			<tr>
				<td>이미지</td>
				<td><img src="/jnp/freeboard/save/<%=article.getImg()%>" width="200px"/></td>		
			</tr>
			<tr>
				<td colspan='2'>
				<%if(article.getWriter().equals((String)session.getAttribute("memId"))){%>
					<input type="button" value="수정" onclick="window.location='boardModifyForm.jsp?num=<%=article.getNum()%>'"/>
					<input type="button" value="삭제" onclick="deleteArticle('<%=num%>')"/>
				<%}%>
				<%if(session.getAttribute("memId")!=null && !(article.getWriter().equals((String)session.getAttribute("memId")))){%>
					<input type="button" value="답글" onclick=""/>
				<%}%>
					<input type="button" value="뒤로" onclick="window.location='board.jsp'"/>
				</td>		
			</tr>
		</table>
	</form>
</body>
<script>
	//글 삭제확인
	function deleteArticle(num) {
		if(confirm("정말 삭제하시겠습니까?")){
			window.location="boardDeletePro.jsp?num="+num;
		}		
	}

</script>

</html>