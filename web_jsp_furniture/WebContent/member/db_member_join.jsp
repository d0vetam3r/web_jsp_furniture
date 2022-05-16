<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*, dao.*, common.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Member_dao dao = new Member_dao();
	
	String id              	= request.getParameter("t_id");
	String name            	= request.getParameter("t_name");
	String password        	= request.getParameter("t_password");
	String area            	= request.getParameter("t_area");
	String address         	= request.getParameter("t_address");
	String tel_1          	= request.getParameter("t_tel_1");
	String tel_2          	= request.getParameter("t_tel_2");
	String tel_3          	= request.getParameter("t_tel_3");
	String gender          	= request.getParameter("t_gender");
	String hobby_travel    	= request.getParameter("t_hobby_travel");
	String hobby_reading   	= request.getParameter("t_hobby_reading");
	String hobby_sports    	= request.getParameter("t_hobby_sports");
	String reg_date			= CommonUtil.getToday();
	
	if(hobby_travel == null) hobby_travel = "n";
	if(hobby_reading == null) hobby_reading = "n";
	if(hobby_sports == null) hobby_sports = "n";
	
	Member_dto dto = new Member_dto(id, name, password, area, address, tel_1, tel_2, tel_3, gender, hobby_travel, hobby_reading, hobby_sports, reg_date, "", "", "");
	
	out.print("gender : " + gender + "<br>");
	out.print("hobby_travel : " + hobby_travel + "<br>");
	out.print("hobby_reading : " + hobby_reading + "<br>");
	out.print("hobby_sports : " + hobby_sports + "<br>");
	
	int result = dao.memberSave(dto);
	String msg = "";
	if(result == 1) msg = name+"님 회원가입 되었습니다.";
	else msg = "가입실패. 관리자에게 문의바랍니다.";
	
/*
id
name
password
area
address
tell_1
tell_2
tell_3
gender
hobby_travel
hobby_reading
hobby_sports
reg_date
level_gubun
exit_gubun
exit_date

t_id
t_name
t_password
t_area
t_address
t_tell_1
t_tell_2
t_tell_3
t_gender
t_hobby_travel
t_hobby_reading
t_hobby_sports
t_reg_date
t_level_gubun
t_exit_gubun
t_exit_date

id, name, password, area, address, tell_1, tell_2, tell_3, gender, hobby_travel, hobby_reading, hobby_sports, reg_date, "", "", ""
*/

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	alert("<%=msg%>");
	location.href="../index.jsp";
</script>
<body>

</body>
</html>