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
//��ȸ�� �ø���
BoardQuery boardQuery = new BoardQuery();
boardQuery.boardHitUP(idx);

boardBean = boardQuery.boardView(idx);
%>
<body>
	<table width="550" align="center" border="1">
		<tr>
			<td align="center">&nbsp;<font size="4" color="#CCCCCC">�ڷ���
					�Խ���</font></td>
		</tr>
	</table>
	<br>
	<form method="post" name="wform">
		<table width="550" align="center" border="1">
			<tr>
				<td colspan="2" align="center" bgcolor="#CCCCCC">&nbsp;�� �� ��<br></td>
			</tr>
			<tr>
				<td width="17%">&nbsp;�̸�</td>
				<td>&nbsp;<%=boardBean.getName()%></td>
			</tr>
			<tr>
				<td>&nbsp;�̸���</td>
				<td>&nbsp;<a href="mailto:<%=boardBean.getEmail()%>"><%=boardBean.getEmail()%></a></td>
			</tr>
			<tr>
				<td>&nbsp;Ȩ������</td>
				<td>&nbsp;<a href="http://<%=boardBean.getHomepage()%>"><%=boardBean.getHomepage()%></a></td>
			</tr>
			<tr>
				<td>&nbsp;����</td>
				<td>&nbsp;<%=boardBean.getTitle()%></td>
			<tr>
				<td>����</td>
				<td><a
					href="<%="../boardUpdate/alldownload.jsp?filename=" + boardBean.getFilename()%>"><%=boardBean.getFilename()%></a>&nbsp;&nbsp;&nbsp;
					<%=boardBean.getFilesize()%>Byte</td>
			</tr>

			<tr>
				<td>&nbsp;����</td>
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
					type="button" value="�����ϱ�"
					onclick="editsend(<%=boardBean.getIdx()%>);">&nbsp;&nbsp;&nbsp;
					<input type="button" value="�����ϱ�"
					onclick="delsend(<%=boardBean.getIdx()%>);">
				</td>
			</tr>
		</table>
	</form>
	<br>
	<table width="550" align="center" border="1">
		<tr>
			<td align="center">&nbsp;[<a href="./list.jsp">����Ʈ</a>]&nbsp;&nbsp;&nbsp;��ȸ��:[<%=boardBean.getHit()%>]
			</td>
		</tr>
	</table>
</body>
</html>