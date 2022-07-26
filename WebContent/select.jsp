<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후보자조회</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<h3>후보자 조회</h3>
<%
int cnt=0;
try{
	String sql="select count(*) from member0726";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
	
}
%>
<div style="margin: 0 15%">총 <%=cnt %>명의 후보자가 있습니다</div>
<hr>
<table border="1" id="tab1">
<tr>
	<th>후보번호</th>
	<th>성명</th>
	<th>소속정당</th>
	<th>학력</th>
	<th>주민번호</th>
	<th>지역구</th>
	<th>대표전화</th>
	<th>구분</th>
</tr>
<%

try{
	String sql="select m.M_NO,m.M_NAME,m.P_CODE,m.P_SCHOOL,m.M_JUMIN,m.M_CITY,p.P_TEL1,p.P_TEL2,p.P_TEL3 from member0726 m, party0726 p where m.P_CODE=p.P_CODE";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String M_NO=rs.getString(1);
		String M_NAME=rs.getString(2);
		String P_CODE=rs.getString(3);
		String P_SCHOOL=rs.getString(4);
		switch(P_SCHOOL){
		case "1" : P_SCHOOL="고졸";
		break;
		case "2" : P_SCHOOL="학사";
		break;
		case "3" : P_SCHOOL="석사";
		break;
		case "4" : P_SCHOOL="박사";
		break;
		}
		String M_JUMIN=rs.getString(5);
		String M_CITY=rs.getString(6);
		String P_TEL1=rs.getString(7);
		String P_TEL2=rs.getString(8);
		String P_TEL3=rs.getString(9);
		String tel=P_TEL1+"-"+P_TEL2+"-"+P_TEL3;
	
%>
<tr>
<td class="td1"><%=M_NO %></td>
<td class="td1"><%=M_NAME %></td>
<td class="td1"><%=P_CODE %></td>
<td class="td1"><%=P_SCHOOL %></td>
<td class="td1"><%=M_JUMIN %></td>
<td class="td1"><%=M_CITY %></td>
<td class="td1"><%=tel %></td>
<td class="td1">
<a href="update_member.jsp?M_NO=<%=M_NO %>">수정</a> /
<a href="delete_member.jsp?M_NO=<%=M_NO %>">삭제</a> 
</td>
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