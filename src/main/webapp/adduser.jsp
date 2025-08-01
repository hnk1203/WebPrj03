<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String userid = request.getParameter("userid");
String passwd = request.getParameter("passwd");
String email = request.getParameter("email");

String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@192.168.0.22:1521:xe";
String dbuid = "test";
String dbpwd = "1234";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url, dbuid, dbpwd);
String sql = "";
sql += "INSERT INTO TUSER (ID, NAME, USERID, PASSWD, EMAIL)";
sql += " VALUES (SEQID.NEXTVAL, ?, ?, ?, ?)";
sql += "SELECT * FROM TUSER";

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, name);
pstmt.setString(2, userid);
pstmt.setString(3, passwd);
pstmt.setString(4, email);


pstmt.executeUpdate();

pstmt.close();
conn.close();

String loc = "http://localhost:8080/WebPrj03/userlist.jsp?name=all";
response.sendRedirect(loc);
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