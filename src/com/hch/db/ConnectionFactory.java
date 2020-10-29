package com.hch.db;
import java.sql.*;

public class ConnectionFactory {
	public static final int ODBC = 1;
	public static final int ORACLE = 2;
	public static final int MSSQL = 3;
	public static final int MYSQL = 4;
	
	private String url = "localhost";
	private String port = "1521";
	private String dbname = "XE";
	private String dbuser = "javauser";
	private String pswd = "1234";
	private String unicode = "true";
	private String encode = "utf8";
	
	
public ConnectionFactory() {}

public Connection getConnection(int dbms) throws SQLException{
	Connection conn = null;
	
	if(dbms == ConnectionFactory.ODBC) {
		try {
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			conn = DriverManager.getConnection("jdbc:odbc:dbdsn", "id", "password");
		}catch(ClassNotFoundException cnfe) {
			System.out.println(cnfe);
		}
	}else if(dbms == ConnectionFactory.ORACLE) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@" + url + ":" + port + ":" + dbname,dbuser,pswd);
		}catch(ClassNotFoundException cnfe) {
			System.out.println(cnfe);
		}
	}else if(dbms == ConnectionFactory.MSSQL) {
		try {
			Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:microsoft:sqlserver://localhost1433","novel","jsp");
		}catch(ClassNotFoundException cnfe) {
			System.out.println(cnfe);
		}
	}else if(dbms == ConnectionFactory.MYSQL) {
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://" + url + ":" + port + "/" + dbname + "?user=" + dbuser + "&password="+ pswd + "&useUnicode=" +unicode + "&characterEncoding=" + encode);
		}catch(ClassNotFoundException cnfe) {
			System.out.println(cnfe);
		}
	}
	return conn;
}
}
