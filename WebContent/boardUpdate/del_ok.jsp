<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="boardBean" class="com.hch.boardup.dto.BoardBean"></jsp:useBean>
<jsp:useBean id="boardQuery" class="com.hch.boardup.dao.BoardQuery"></jsp:useBean>
<%
	String idx = request.getParameter("idx");
String pwd = request.getParameter("pwd");
boardBean = boardQuery.boardView(Integer.parseInt(idx));

String pwd2 = boardBean.getPwd();
String oldfilename = boardBean.getFilename();

if (pwd.equals(pwd2)) {
	java.io.File oldFile = new java.io.File("C:\\hch\\mywork_jsp\\oracleBoardUp\\WebContent\\data\\" + oldfilename);
	if (oldFile.exists()) {
		oldFile.delete();
	}
	boardQuery.boardDelete(Integer.parseInt(idx), pwd);
	out.println("<script language=\"JavaScript\">");
	out.println("alert(\"���� �����Ǿ����ϴ�\")");
	out.println("location.href=\"../board/list.jsp\"");
	out.println("</script>");
} else {
	out.println("<script language=\"JavaScript\">");
	out.println("alert(\"��й�ȣ�� ��ġ���� �ʽ��ϴ�\")");
	out.println("history.back()");
	out.println("</script>");
}
%>