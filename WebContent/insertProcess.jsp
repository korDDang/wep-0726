<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
String V_JUMIN=request.getParameter("V_JUMIN");
String V_NAME=request.getParameter("V_NAME");
String M_NO=request.getParameter("M_NO");
String V_TIME=request.getParameter("V_TIME");
String V_AREA=request.getParameter("V_AREA");
String V_CONFIRM=request.getParameter("V_CONFIRM");
try{
	String sql="insert into vote0726 values(?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, V_JUMIN);
	pstmt.setString(2, V_NAME);
	pstmt.setString(3, M_NO);
	pstmt.setString(4, V_TIME);
	pstmt.setString(5, V_AREA);
	pstmt.setString(6, V_CONFIRM);
	pstmt.executeUpdate();
	%>
		<script>
		alert("등록이 완료되었습니다.");
		history.back(-1);
		</script>
		<%
}catch(SQLException e){
	e.printStackTrace();
}
%>
</body>
</html>