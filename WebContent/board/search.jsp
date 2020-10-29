<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.sql.*,java.io.*,java.text.*,java.util.*,com.hch.boardup.dao.*,com.hch.boardup.dto.*"%>
<jsp:useBean id="boardQuery" class="com.hch.boardup.dao.BoardQuery" />
<link href="../style.css" rel="stylesheet" type="text/css">
<%
request.setCharacterEncoding("EUC-KR");
%>
<%
	//����¡ �غ�
int limit = 10;
int offset = 0;
int pagelink = 1;

String offset_get = request.getParameter("offset");
if (offset_get == null) {
	offset = 0;
} else {
	offset = Integer.parseInt(offset_get);
}

String pagelink_get = request.getParameter("pagelink");
if (pagelink_get == null) {
	pagelink = 1;
} else {
	pagelink = Integer.parseInt(pagelink_get);
}
%>

<script type="text/javascript">
	function send(theform) {
		if (theform.search.value == "") {
			alert("�˻�� �Է��ϼ���");
			theform.search.focus();
			return false;
		}
		theform.submit();
	}
</script>
<%
	String find = request.getParameter("find");
String search = request.getParameter("search");
int rcnt = boardQuery.boardCount(find,search);
PagingCount pc = new PagingCount(rcnt);
%>
<table width="550" align="center" border="1">
	<tr>
		<td align="left" width="20%">&nbsp;[�ۼ�:<%=rcnt%>]
		</td>
		<td align="center" width="60%"><font size="4" color="">�˻���
				����Ʈ</font></td>
		<td align="right" width="20%">[<a href="write.jsp">�۾���</a>]
			&nbsp;
		</td>
	</tr>
</table>
<br>
<table width="550" align="center" border="1">
	<tr>
		<td width="10%" bgcolor="#CCCCCC">&nbsp;��ȣ</td>
		<td width="17%" bgcolor="#CCCCCC">&nbsp;����</td>
		<td width="50%" bgcolor="#CCCCCC">&nbsp;����</td>
		<td width="13%" bgcolor="#CCCCCC">&nbsp;�̸�</td>
		<td width="10%" bgcolor="#CCCCCC">&nbsp;��ȸ</td>
	</tr>
	<%
		Vector listVector = boardQuery.getSearchList(offset, limit, find, search);

	for (int k = 0; k < listVector.size(); k++) {
		BoardBean boardBean = (BoardBean) listVector.elementAt(k);
	%>
	<tr>
		<td>&nbsp;<%=boardBean.getIdx()%></td>
		<td>&nbsp;<%=boardBean.getWdate()%></td>
		<td>&nbsp;<a href="content.jsp?idx=<%=boardBean.getIdx()%>"><%=boardBean.getTitle()%></a></td>
		<td>&nbsp;<%=boardBean.getName()%></td>
		<td>&nbsp;<%=boardBean.getHit()%></td>
	</tr>
	<%
		}
	%>
</table>
<%=pc.showPaging(pagelink, "search.jsp", find, search)%>
<br>
<form action="search.jsp" method="post" name="sform">
	<table width="550" align="center" border="1">
		<tr>
			<td align="center"><select name="find">
					<option value="name">�� ��</option>
					<option value="title" selected>�� ��</option>
					<option value="content">�� ��</option>
			</select> <input type="text" name="search" size="20"> <input
				type="button" name="Submit" value="��ã��" onclick="send(this.form);">
			</td>
		</tr>
	</table>
</form>