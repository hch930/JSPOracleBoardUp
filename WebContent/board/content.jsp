<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.hch.boardup.dao.*"%>
<!DOCTYPE html>
<jsp:useBean id="boardBean" class="com.hch.boardup.dto.BoardBean"></jsp:useBean>
<html>
<head>
<meta charset="EUC-KR">
<link href="../style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
<title>New Document</title>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="HongCungHyun">
</head>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
//조회수 올리기
BoardQuery boardQuery = new BoardQuery();
boardQuery.boardHitUP(idx);

boardBean = boardQuery.boardView(idx);
%>
<body>
	<table width="550" align="center" border="1">
		<tr>
			<td align="center">&nbsp;<font size="4" color="#CCCCCC">자료형
					게시판</font></td>
		</tr>
	</table>
	<br>
	<form method="post" name="wform">
		<table width="550" align="center" border="1">
			<tr>
				<td colspan="2" align="center" bgcolor="#CCCCCC">&nbsp;글 보 기<br></td>
			</tr>
			<tr>
				<td width="17%">&nbsp;이름</td>
				<td>&nbsp;<%=boardBean.getName()%></td>
			</tr>
			<tr>
				<td>&nbsp;이메일</td>
				<td>&nbsp;<a href="mailto:<%=boardBean.getEmail()%>"><%=boardBean.getEmail()%></a></td>
			</tr>
			<tr>
				<td>&nbsp;홈페이지</td>
				<td>&nbsp;<a href="http://<%=boardBean.getHomepage()%>"><%=boardBean.getHomepage()%></a></td>
			</tr>
			<tr>
				<td>&nbsp;제목</td>
				<td>&nbsp;<%=boardBean.getTitle()%></td>
			<tr>
				<td>파일</td>
				<td><a
					href="<%="../boardUpdate/alldownload.jsp?filename=" + boardBean.getFilename()%>"><%=boardBean.getFilename()%></a>&nbsp;&nbsp;&nbsp;
					<%=boardBean.getFilesize()%>Byte</td>
			</tr>

			<tr>
				<td>&nbsp;본문</td>
				<td>
					<table width="400" height="200">
						<tr>
							<td valign="top"><%=boardBean.getContent()%></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="#CCCCCC">&nbsp; <input
					type="button" value="수정하기"
					onclick="editsend(<%=boardBean.getIdx()%>);">&nbsp;&nbsp;&nbsp;
					<input type="button" value="삭제하기"
					onclick="delsend(<%=boardBean.getIdx()%>);">
				</td>
			</tr>
		</table>
	</form>
	<br>
	<table width="550" align="center" border="1">
		<tr>
			<td align="center">&nbsp;[<a href="./list.jsp">리스트</a>]&nbsp;&nbsp;&nbsp;조회수:[<%=boardBean.getHit()%>]
			</td>
		</tr>
	</table>
</body>
</html>