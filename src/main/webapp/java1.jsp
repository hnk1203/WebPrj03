<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//db Connection String
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:xe";
	String dbuid = "test";
	String dbpwd = "1234";
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, dbuid, dbpwd);
	
	String sql = "SELECT * FROM TUSER ORDER BY ID ASC";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	String msg = "<ul>";
	while(rs.next()){
		int id = rs.getInt("id");
		String name = rs.getString("name");
		String userid = rs.getString("userid");
		String passwd = rs.getString("passwd");
		String email = rs.getString("email");
		String regdate = rs.getString("regdate");
		String fmt = "<li>";
		fmt += "%d %s %s %s %s %s";
		fmt += "</li>";
		msg = String.format(fmt, id, name, userid, passwd, email, regdate);
	}
	msg += "</ul>";
	rs.close();			
	pstmt.close();
	conn.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>