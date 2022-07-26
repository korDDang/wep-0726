<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function ch1() {
	var doc=document.form;
	location.href="selectvote.jsp"
	
}
function ch2() {
	var doc=document.form;
	location.href="selectvote2.jsp"
	
}
</script>
</head>

<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section id="sec1">
<%@ include file="DBConn.jsp" %>
<%
String area=request.getParameter("area");
if(area==null){
	area="제1투표장";
}
%>
<fieldset style="width:300px; margin: 0 3%;">
<legend>선택</legend>
투표소 : <input type="radio" name="area" value="제1투표장" checked onclick="ch1()">제1투표장
	  <input type="radio" name="area" value="제2투표장" onclick="ch2()">제2투표장
</fieldset>
<h2>'투표검수조회'</h2>
<%

int cnt=0;
try{
	if(area.equals("제1투표장")){
	String sql="select count(*) from vote0726 where V_AREA='"+area+"'";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
	}
}catch(SQLException e){
	e.printStackTrace();

}

%>
<div style="margin: 0 15%">총 <%=cnt%>명의 투표검수 조회가 있습니다.</div>
<form name="form" method="post" action="selectvote.jsp">
<table border="1" id="tab1">
<tr>
	<th>성명</th>
	<th>생년월일</th>
	<th>나이</th>
	<th>성별</th>
	<th>후보<br>번호</th>
	<th>투표시간</th>
	<th>유권자확인</th>
	<th>구분</th>
</tr>
<%

String V_AREA=request.getParameter("V_AREA");


try{
	String sql="select V_JUMIN,V_NAME,M_NO,V_TIME,V_CONFIRM from vote0726 where V_AREA='"+area+"'";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String V_JUMIN=rs.getString(1); 
		String ju=V_JUMIN.substring(0,2)+".";
		String ju1=V_JUMIN.substring(2,4)+".";
		String ju2=V_JUMIN.substring(4,6);
		String ju3=ju+ju1+ju2;
		String gender=V_JUMIN.substring(6,7);
		switch(gender){
		case "1": gender="남";
		break;
		case "2": gender="여";
		break;
		}
		int age=2022-Integer.parseInt(V_JUMIN.substring(0,2))-1900;
		String V_NAME=rs.getString(2); 
		String M_NO=rs.getString(3); 
		String V_TIME=rs.getString(4);
		String t1=V_TIME.substring(0,2)+":"+V_TIME.substring(2,4);
		String V_CONFIRM=rs.getString(5); 
		switch(V_CONFIRM){
		case "Y" : V_CONFIRM="확인";
		break;
		case "N" : V_CONFIRM="미확인";
		break;
		}

%>

<tr>
<td class="td2"><%=V_NAME %></td>
<td class="td2"><%=ju3 %></td>
<td class="td2">만 <%=age %>세</td>
<td class="td2"><%=gender %></td>
<td class="td2"><%=M_NO %></td>
<td class="td2"><%=t1 %></td>
<td class="td2"><%=V_CONFIRM %></td>
<td class="td2">
<a href="update_vote.jsp?V_NAME=<%=V_NAME%>">수정</a> /
<a href="delete_vote.jsp?V_JUMIN=<%=V_JUMIN%>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
</td>

</tr>
<%
	}
}catch(Exception e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
</form>
<br>
<div class="td1"><input type="button" value="작성" onclick="location.href='insert.jsp'" class="bt1"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>