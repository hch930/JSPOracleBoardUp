<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.util.*,com.hch.boardup.dao.*,com.hch.boardup.dto.*,java.util.*"%>

<link href="../style.css" rel="stylesheet" type="text/css">

<jsp:useBean id="boardQuery" class="com.hch.boardup.dao.BoardQuery" />
<%
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
	pagelink = 0;
} else {
	pagelink = Integer.parseInt(pagelink_get);
}
%>

<script type="text/javascript">
	function send(theform) {
		if (theform.search.value == "") {
			alert("검색어를 입력하세요");
			theform.search.focus();
			return false;
		}
		theform.submit();
	}
</script>

<%
	int rcnt = boardQuery.boardCount();
%>
<table width="550" align="center" border="1">
	<tr>
		<td align="left" width="20%">&nbsp;[글수:<%=rcnt%>]
		</td>
		<td align="center" width="60%"><font size="4" color="">게시판
				리스트</font></td>
		<td align="right" width="20%">[<a href="../boardUpdate/write.jsp">글쓰기</a>]
			&nbsp;
		</td>
	</tr>
</table>
<br>
<table width="550" align="center" border="1">
	<tr>
		<td width="10%" bgcolor="#CCCCCC">&nbsp;번호</td>
		<td width="17%" bgcolor="#CCCCCC">&nbsp;일자</td>
		<td width="50%" bgcolor="#CCCCCC">&nbsp;제목</td>
		<td width="10%" bgcolor="#CCCCCC">&nbsp;파일</td>
		<td width="13%" bgcolor="#CCCCCC">&nbsp;이름</td>
		<td width="10%" bgcolor="#CCCCCC">&nbsp;조회</td>
	</tr>
	<%
		Vector listVector = boardQuery.getBoardList(offset, limit);

	for (int k = 0; k < listVector.size(); k++) {
		BoardBean boardBean = (BoardBean) listVector.elementAt(k);
	%>
	<tr>
		<td>&nbsp;<%=boardBean.getIdx()%></td>
		<td>&nbsp;<%=boardBean.getWdate()%></td>
		<td>&nbsp;<a href="content.jsp?idx=<%=boardBean.getIdx()%>"><%=boardBean.getTitle()%></a></td>
		<td>&nbsp;<%=boardBean.getFilename()%></td>
		<td>&nbsp;<%=boardBean.getName()%></td>
		<td>&nbsp;<%=boardBean.getHit()%></td>
	</tr>
	<%
		}
	%>
</table>
<%
	PagingCount pc = new PagingCount(rcnt);
%>

<%=pc.showPaging(pagelink, "list.jsp")%>

<br>

<form action="search.jsp" method="post" name="sform">
	<table width="550" align="center" border="1">
		<tr>
			<td align="center"><select name="find">
					<option value="name">이 름</option>
					<option value="title" selected>제 목</option>
					<option value="content">내 용</option>
			</select> <input type="text" name="search" size="20"> <input
				type="button" value="글찾기" onclick="send(this.form);">
			</td>
		</tr>
	</table>
</form>