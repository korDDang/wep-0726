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
String M_NO=request.getParameter("M_NO");
String M_NAME=request.getParameter("M_NAME");
String P_CODE=request.getParameter("P_CODE");
String P_SCHOOL=request.getParameter("P_SCHOOL");
String M_JUMIN=request.getParameter("M_JUMIN");
String M_CITY=request.getParameter("M_CITY");
try{
	String sql="update member0726 set M_NAME=?,P_CODE=?,P_SCHOOL=?,M_JUMIN=?, M_CITY=? where M_NO=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(6, M_NO);
	pstmt.setString(1, M_NAME);
	pstmt.setString(2, P_CODE);
	pstmt.setString(3, P_SCHOOL);
	pstmt.setString(4, M_JUMIN);
	pstmt.setString(5, M_CITY);
	pstmt.executeUpdate();
	%>
		<script>
		alert("수정이 완료되었습니다.");
		location.href="select.jsp";
		</script>
		<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정 실패");
}
%>
</body>
</html>