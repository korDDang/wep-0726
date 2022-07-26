<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html ">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후보(수정)</title>
</head>

<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<%
String M_NO=request.getParameter("M_NO");
try{
	String sql="select * from member0726 where M_NO=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, M_NO);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String M_NAME=rs.getString(2);
		String P_CODE=rs.getString(3);
		String P_SCHOOL=rs.getString(4);
		String M_JUMIN=rs.getString(5);
		String M_CITY=rs.getString(6);
	
%>
<section id="sec1">
<h3>후보 수정</h3>
<form name="form" method="post" action="update_memberProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th>후보번호</th>
		<td> 
			<input type="text" name="M_NO" value="<%=M_NO%>">
		</td>
</tr>
<tr>
	<th>성명</th>
		<td> 
			<input type="text" name="M_NAME" value="<%=M_NAME%>">
		</td>
</tr>
<tr>
	<th>소속정당</th>
		<td> 
			<input type="text" name="P_CODE" value="<%=P_CODE%>">
		</td>
</tr>

<tr>
	<th>최종학력</th>
		<td> 
			<input type="text" name="P_SCHOOL"  value="<%=P_SCHOOL%>">
		</td>
</tr>
<tr>
	<th>주민번호</th>
		<td> 
			<input type="text" name="M_JUMIN" value="<%=M_JUMIN%>">
		</td>
</tr>
<tr>
	<th>지역구</th>
		<td> 
			<input type="text" name="M_CITY" value="<%=M_CITY%>">
		</td>
</tr>
<tr>
	<td colspan="2" class="td1">
		<input type="submit" value="수정" class="bt2">
		<input type="reset" value="다시하기"  class="bt2">
</td>
</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</table>


</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>