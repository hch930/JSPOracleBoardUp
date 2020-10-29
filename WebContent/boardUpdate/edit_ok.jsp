<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.jspsmart.upload.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="smart" scope="page"
	class="com.jspsmart.upload.SmartUpload"></jsp:useBean>
<jsp:useBean id="boardBean" class="com.hch.boardup.dto.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="boardBean" />
<jsp:useBean id="boardQuery" class="com.hch.boardup.dao.BoardQuery"></jsp:useBean>
<%
	smart.initialize(pageContext);
smart.upload();

String idx = smart.getRequest().getParameter("idx");
String pwd = smart.getRequest().getParameter("pwd");
boardBean = boardQuery.boardView(Integer.parseInt(idx));
String pwd2 = boardBean.getPwd();
String oldfilename = boardBean.getFilename();
int oldfilesize = boardBean.getFilesize();

if (pwd.equals(pwd2)) {
	String filename = "";
	int filesize = 0;
	com.jspsmart.upload.File upFile = smart.getFiles().getFile(0);

	if (!upFile.isMissing()) {
		java.io.File oldFile = new java.io.File("C:\\hch\\mywork_jsp\\oracleBoardUp\\WebContent\\data\\" + oldfilename);

		if (oldFile.exists()) {
	oldFile.delete();
		}
		String fileCheck = upFile.getFileName();
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
		String loadFile = "C:\\hch\\mywork_jsp\\oracleBoardUp\\WebContent\\data\\" + fileCheck;
		upFile.saveAs(loadFile);
		filesize = upFile.getSize();
		filename = fileCheck;
		boardBean.setFilename(filename);
		boardBean.setFilesize(filesize);
	} else {
		boardBean.setFilename(oldfilename);
		boardBean.setFilesize(oldfilesize);
	}
}

boardBean.setIdx(Integer.parseInt(smart.getRequest().getParameter("idx")));
boardBean.setName(smart.getRequest().getParameter("name"));
boardBean.setEmail(smart.getRequest().getParameter("email"));
boardBean.setHomepage(smart.getRequest().getParameter("homepage"));
boardBean.setContent(smart.getRequest().getParameter("content"));
boardBean.setTitle(smart.getRequest().getParameter("title"));
boardBean.setPwd(smart.getRequest().getParameter("pwd"));

boolean result = false;
result = boardQuery.boardUpdate(boardBean);
if (result) {
	out.println("<script language=\"JavaScript\">");
	out.println("alert(\"글이 수정되었습니다\")");
	out.println("location.href=\'../board/content.jsp?idx=" + idx + "\'");
	out.println("</script>");
} else {
	out.println("<script language=\"JavaScript\">");
	out.println("alert(\"비밀번호가 일치하지 않습니다\")");
	out.println("history.back()");
	out.println("</script>");
}
%>