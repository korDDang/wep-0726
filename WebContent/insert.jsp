<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html ">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투표하기</title>
</head>
<script>
function check() {
	var doc=document.form;
	var pattern=/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+$/;
	var cnt=0;
	for(var i=0;i<doc.V_CONFIRM.length;i++){
		if(doc.V_CONFIRM[i].checked==true){
			cnt=1;
		}
	}
	if(doc.V_JUMIN.value==""){
		alert("주민번호가 입력되지 않았습니다!");
		doc.V_JUMIN.focus();
		return false;
	}if(doc.V_JUMIN.value.length<13||doc.V_JUMIN.value.length>13){
		alert("유효하지않은 주민번호 입니다.\n 숫자 13자리로만 입력해주세요.");
	    doc.V_JUMIN.focus();
	    return false;
	}if(doc.V_NAME.value==""){
		alert("성명이 입력되지 않았습니다!");
	    doc.V_NAME.focus();
	    return false;
	}if(!pattern.test(doc.V_NAME.value)){
		alert("한글이름으로 입력해주세요.");
	    doc.V_NAME.focus();
	    return false;
	}if(doc.M_NO.value=="0"){
		alert("후보번호가 선택되지 않았습니다!");
	    doc.M_NO.focus();
	    return false;
	}if(doc.V_TIME.value==""){
		alert("투표시간이 입력되지 않았습니다!");
	    doc.V_TIME.focus();
	    return false;
	}if(doc.V_TIME.value.length<4||doc.V_TIME.value.length>4){
		alert("튜표시간을 숫자4자 로 입력해주세요! 예)0930");
	    doc.V_TIME.focus();
	    return false;
	}if(doc.V_AREA.value==""){
		alert("투표장소가 입력되지 않았습니다!");
	    doc.V_AREA .focus();
	    return false;
	}if(doc.V_AREA.value!="제1투표장"&&doc.V_AREA.value!="제2투표장"){
		alert("투표장소를 제1투표장 or 제2투표장 으로 입력해주세요 :D");
	    doc.V_AREA.focus();
	    return false;
	}if(cnt==0){
		alert("유권자확인이 선택되지 않았습니다!");
	    doc.V_CONFIRM.focus();
	    return false;
}else{
	doc.submit();
}
}
</script>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section id="sec1">
<h3>'투표하기'</h3>
<form name="form" method="post" action="insertProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th>주민번호</th>
		<td> 
			<input type="text" name="V_JUMIN">
		</td>
</tr>
<tr>
	<th>성명</th>
		<td> 
			<input type="text" name="V_NAME">
		</td>
</tr>
<tr>
	<th>투표번호</th>
		<td>
			<select name="M_NO">
			<option value="0"></option>
			 <option value="1">[1]김후보</option>
			 <option value="2">[2]이후보</option>
			 <option value="3">[3]박후보</option>
			 <option value="4">[4]조후보</option>
			 <option value="5">[5]최후보</option>
			</select>
		</td>
</tr>
<tr>
	<th>투표시간</th>
		<td> 
			<input type="text" name="V_TIME" placeholder="예)0930">
		</td>
</tr>
<tr>
	<th>투표장소</th>
		<td> 
			<input type="text" name="V_AREA" placeholder="예)제1투표장">
		</td>
</tr>
<tr>
	<th>유권자확인</th>
		<td> 
			<input type="radio" name="V_CONFIRM" value="Y"><sub>확인</sub>
			<input type="radio" name="V_CONFIRM" value="N"><sub>미확인</sub>
		</td>
</tr>
<tr>
	<td colspan="2" class="td1">
		<input type="button" value="투표하기" onclick="check()" class="bt2">
		<input type="reset" value="다시하기"  class="bt2">
</table>


</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>