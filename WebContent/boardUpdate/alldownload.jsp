<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import ="java.io.*" %>

<%
OutputStream outStream = null;
FileInputStream fileStream = null;

try{
	String fileName = request.getParameter("filename");
	String path = "data";
	String filePath = getServletContext().getRealPath("/"+path)+"\\";
	response.setContentType("application/octet-stream");
	
	String convName1 = URLEncoder.encode(fileName,"utf-8");
	response.setHeader("Content-Disposition", "attachment;filename=" + convName1 + ";");
	
	String convName2 = fileName;
	File file = new File(filePath+convName2);
	
	byte[] byteStream = new byte[(int)file.length()];
	fileStream = new FileInputStream(file);
	
	int i = 0, j = 0;
	while((i=fileStream.read()) != -1){
		byteStream[j] = (byte)i;
		j++;
	}
	out.clear();
	out = pageContext.pushBody();
	outStream = response.getOutputStream();
	outStream.write(byteStream);
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(fileStream != null) fileStream.close();
	if(outStream != null) outStream.close();
}
%>