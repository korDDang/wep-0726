<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후보자등수</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<h3>'후보자 등수(정당명 표기)'</h3>
<hr>
<table border="1" id="tab1">
<tr>
	<th>후보번호</th>
	<th>성명</th>
	<th>총투표건수</th>
</tr>
<%

try{
	String sql="select m.M_NO,m.M_NAME,count(v.M_NO) from member0726 m,vote0726 v where m.M_NO=v.M_NO group by m.M_NO,m.M_NAME order by count(v.M_NO) desc";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String M_NO=rs.getString(1);
		String M_NAME=rs.getString(2);
		String nosum=rs.getString(3);
		
%>
<tr>
<td class="td1"><%=M_NO %></td>
<td class="td1"><%=M_NAME %></td>
<td class="td1"><%=nosum %></td>
</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("조회실패");
	}
%>
</table>
<br>
<div class="td1"><input type="button" value="작성" onclick="location.href='insert.jsp'" class="bt1"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>