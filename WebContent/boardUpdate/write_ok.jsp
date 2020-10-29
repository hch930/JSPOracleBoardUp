<%@page import="com.jspsmart.upload.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.jspsmart.upload.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="smart" scope="page"
	class="com.jspsmart.upload.SmartUpload"></jsp:useBean>
<jsp:useBean id="boardBean" class="com.hch.boardup.dto.BoardBean" />
<jsp:setProperty property="*" name="boardBean" />
<jsp:useBean id="boardQuery" class="com.hch.boardup.dao.BoardQuery" />
<%
String filename = "";
int filesize = 0;
smart.initialize(pageContext);
smart.upload();

File upfile = smart.getFiles().getFile(0);

if (!upfile.isMissing()) {
	String fileCheck = upfile.getFileName();
	out.println(fileCheck + "<br>");
	boolean fcount = true;
	while (fcount) {
		java.io.File file = new java.io.File("C:\\hch\\mywork_jsp\\oracleBoardUp\\WebContent\\data\\" + fileCheck);
		if (file.exists()) {
			fileCheck = "r_" + fileCheck;
		} else {
			fcount = false;
		}
	}
	String loadfile = "C:\\hch\\mywork_jsp\\oracleBoardUp\\WebContent\\data\\" + fileCheck;
	upfile.saveAs(loadfile);
	filesize = upfile.getSize();
	filename = fileCheck;
}
boardBean.setName(smart.getRequest().getParameter("name"));
boardBean.setEmail(smart.getRequest().getParameter("email"));
boardBean.setHomepage(smart.getRequest().getParameter("homepage"));
boardBean.setTitle(smart.getRequest().getParameter("title"));
boardBean.setContent(smart.getRequest().getParameter("content"));
boardBean.setPwd(smart.getRequest().getParameter("pwd"));
boardBean.setFilename(filename);
boardBean.setFilesize(filesize);
boardQuery.boardInsert(boardBean);
%>

<script type="text/javascript">
	document.location.href = "../board/list.jsp";
</script>