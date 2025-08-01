<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//넘어오는 값 받기
//http://localhost:8080/WebPrj03/userlist.jsp?name=all
String name = request.getParameter("name");
System.out.println(name);

//문자열 문자열
String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@192.168.0.22:1521:xe";
String dbuid = "test";
String dbpwd = "1234";

String tag = "";
//db 조회
if(name.equals("all") == true ) {
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, dbuid, dbpwd);
	String sql = "";
	sql += " SELECT * FROM TUSER ";
	sql += " ORDER BY ID ASC";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	tag += "<table>";
	while( rs.next() ){
		tag += "<tr>";
		tag += "<td>" + rs.getInt("id") + "</td>";
		tag += "<td>" + rs.getString("name") + "</td>";
		tag += "<td>" + rs.getString("userid") + "</td>";
		tag += "<td>" + rs.getString("passwd") + "</td>";
		tag += "<td>" + rs.getString("email") + "</td>";
		tag += "<td>" + rs.getString("regdate") + "</td>";
		tag += "</tr>";
	}
	tag += "</table>";
	
	rs.close();
	pstmt.close();
	conn.close();
	
} else {
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, dbuid, dbpwd);
	String sql = "";
	sql += " SELECT * FROM TUSER ";
	sql += " WHERE NAME LIKE '%' + ? + '%'"; 
	sql += " ORDER BY ID ASC";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	tag += "<table>";
	while( rs.next() ){
		tag += "<tr>";
		tag += "<td>" + rs.getInt("id") + "</td>";
		tag += "<td>" + rs.getString("name") + "</td>";
		tag += "<td>" + rs.getString("userid") + "</td>";
		tag += "<td>" + rs.getString("passwd") + "</td>";
		tag += "<td>" + rs.getString("email") + "</td>";
		tag += "<td>" + rs.getString("regdate") + "</td>";
		tag += "</tr>";
	}
	tag += "</table>";
	
	rs.close();
	pstmt.close();
	conn.close();
}

//출력할 html 만들기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>사용자 목록조회결과</h2>
	<p><%=tag %></p>
</body>
</html>