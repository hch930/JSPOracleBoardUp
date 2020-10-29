<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.sql.*,java.io.*,java.text.*,java.util.*,com.hch.boardup.dao.*"%>

<jsp:useBean id="boardBean" class="com.hch.boardup.dto.BoardBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="../style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function trans(theform){
	if(theform.name.value==""){
		alert("이름을 입력하세요");
		theform.name.focus();
		return false;
	}
	if(theform.email.value==""){
		alert("이메일을 입력하세요");
		theform.email.focus();
		return false;
	}
	if(theform.title.value==""){
		alert("제목을 입력하세요");
		theform.title.focus();
		return false;
	}
	if(theform.content.value==""){
		alert("내용을 입력하세요");
		theform.content.focus();
		return false;
	}
	if(theform.pwd.value==""){
		alert("비밀번호를 입력하세요");
		theform.pwd.focus();
		return false;
	}
	theform.submit();
}
</script>
<title>게시판 만들기</title>
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
</head>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
BoardQuery boardQuery = new BoardQuery();
boardBean = boardQuery.boardView(idx);
%>
<body>
	<br>
	<table width="550" align="center" border="1">
		<td align="center">&nbsp;<font size="4" color="#CCCCCC">일반형
				게시판</font></td>
		</tr>
	</table>
	<br>
	<form method="post" action="edit_ok.jsp" name="myform"
		enctype="multipart/form-data">
		<table width="550" align="center" border="1">
			<tr>
				<td colspan="2" align="center" bgcolor="#CCCCCC">&nbsp;글수정하기<br></td>
			</tr>
			<tr>
				<td width="17%">&nbsp;이름</td>
				<td><input type="text" name="name" size="10"
					value="<%=boardBean.getName()%>"></td>
			</tr>
			<tr>
				<td>&nbsp;이메일</td>
				<td><input type="text" name="email" size="30"
					value="<%=boardBean.getEmail()%>"></td>
			</tr>
			<tr>
				<td>&nbsp;홈페이지</td>
				<td><input type="text" name="homepage" size="30"
					value="<%=boardBean.getHomepage()%>"></td>
			</tr>
			<tr>
				<td>&nbsp;제목</td>
				<td><input type="text" name="title" size="50"
					value="<%=boardBean.getTitle()%>"></td>
			</tr>
			<tr>
				<td>&nbsp;본문</td>
				<td><textarea name="content" rows="10" cols="50"><%=boardBean.getContent()%></textarea></td>
			</tr>
			<td>&nbsp;파일첨부</td>
			<td><input type="file" name="file" size="40"></td>
			</tr>
			<tr>
				<td>&nbsp;비밀번호</td>
				<td><input type="password" name="pwd" size="10"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="#CCCCCC">&nbsp; <input
					type="button" value="수정하기" onclick="trans(this.form)">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="다시쓰기">
				</td>
			</tr>
			<input type="hidden" name="idx" value="<%=boardBean.getIdx()%>">
		</table>
	</form>
	<br>
	<table width="550" align="center" border="1">
		<tr>
			<td align="center">&nbsp;[<a
				href="../board/content.jsp?idx=<%=boardBean.getIdx()%>">돌아가기</a>]
			</td>
		</tr>
	</table>
</body>
</html>