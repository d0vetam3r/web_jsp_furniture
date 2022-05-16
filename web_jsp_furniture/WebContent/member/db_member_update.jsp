<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Member_dao dao = new Member_dao();
	String sessionId        = (String)session.getAttribute("sessionId");
	%>
	<%if(sessionId == null){ %>
	<script>
		alert("세션정보가 만료되었습니다.");
		location.href="member_login.jsp";
	</script>
	<%}

	String id            	= request.getParameter("t_id");
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
	
	if(hobby_travel == null) hobby_travel = "n";
	if(hobby_reading == null) hobby_reading = "n";
	if(hobby_sports == null) hobby_sports = "n";
	
	Member_dto dto = new Member_dto(id, name, password, area, address, tel_1, tel_2, tel_3, gender, hobby_travel, hobby_reading, hobby_sports, "", "", "", "");
	
	int result = dao.memberUpdate(dto);
	
	String msg = "수정실패 문의바랍니다";
	String url = "member_update.jsp";
	if(result == 1){
		msg = name + "님 회원정보 수정되었습니다.";
		url = "../index.jsp";
	}
%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	alert("<%=msg%>");
	let flag = <%=result%>;
	if(flag == 1){
		location.href="<%=url%>";
	}else{
		location.href="<%=url%>";
	}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>