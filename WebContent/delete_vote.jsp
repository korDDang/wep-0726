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

try{
	String sql="delete from vote0726 where V_JUMIN=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, V_JUMIN);
	pstmt.executeUpdate();
	%>
		<script>
		alert("삭제가 완료되었습니다.");
		location.href="selectvote.jsp";
		</script>
		<%
}catch(SQLException e){
	e.printStackTrace();
}
%>
</body>
</html>