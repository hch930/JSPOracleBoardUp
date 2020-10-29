<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 글쓰기</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<script type="text/javascript" src="../js/script.js" charset="UTF-8"></script>
</head>
<body>
	<table width="550" align="center" border="1">
		<tr>
			<td align="center">&nbsp;<font size="4" color="#CCCCCC">자료형
					게시판</font></td>
		</tr>
	</table>
	<br>
	<form method="post" action="write_ok.jsp" name="wform"
		enctype="multipart/form-data">
		<table width="550" align="center" border="1">
			<tr>
				<td colspan="2" align="center" bgcolor="#CCCCCC">&nbsp;새 글쓰기<br></td>
			</tr>
			<tr>
				<td width="17%">&nbsp;이름</td>
				<td><input type="text" name="name" size="10"></td>
			</tr>
			<tr>
				<td>&nbsp;이메일</td>
				<td><input type="text" name="email" size="30"></td>
			</tr>
			<tr>
				<td>&nbsp;홈페이지</td>
				<td><input type="text" name="homepage" size="30"></td>
			</tr>
			<tr>
				<td>&nbsp;제목</td>
				<td><input type="text" name="title" size="50"></td>
			</tr>
			<tr>
				<td>&nbsp;본문</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>&nbsp;파일첨부</td>
				<td><input type="file" name="file" size="40"></td>
			</tr>
			<tr>
				<td>&nbsp;비밀번호</td>
				<td><input type="password" name="pwd" size="10"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="#CCCCCC">&nbsp; <input
					type="button" value="글 올리기" onclick="trans()">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="다시쓰기">
				</td>
			</tr>
		</table>
	</form>
	<br>
	<table width="550" align="center" border="1">
		<tr>
			<td align="center">&nbsp;[<a href="../board/list.jsp">리스트</a>]
			</td>
		</tr>
	</table>
</body>
</html>