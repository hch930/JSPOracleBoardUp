<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String idx = request.getParameter("idx");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="../style.css" rel="stylesheet" type="text/css">
<title>New Document</title>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
</head>
<body>
	<br>
	<br>
	<br>
	<form method="post" action="del_ok.jsp?idx=<%=idx%>">
		<table width="200" border="1" align="center">
			<tr>
				<td align="center">비밀번호를 입력하세요</td>
			</tr>
			<tr>
				<td align="center"><input type="password" name="pwd" size="10"></td>
			</tr>
			<tr>
				<td align="center"><input type="button"
					onclick="this.form.submit()" value="삭제실행"></td>
			</tr>
		</table>
	</form>
</body>
</html>