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

try{
	String sql="delete from member0726 where M_NO=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, M_NO);

	pstmt.executeUpdate();
	%>
		<script>
		alert("삭제가 완료되었습니다.");
		location.href="select.jsp";
		</script>
		<%
}catch(SQLException e){
	e.printStackTrace();
}
%>
</body>
</html>