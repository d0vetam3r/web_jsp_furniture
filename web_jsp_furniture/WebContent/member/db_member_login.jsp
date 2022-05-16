<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*, dto.*, java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Member_dao dao = new Member_dao();

	String id = request.getParameter("t_id");
	String pw = request.getParameter("t_pw");
	
	ArrayList<String> info = dao.getCheckLogin(id,pw);
	String msg = "";
	String url = "";
	
	if(info.size()==0){
		msg = "ID나 비밀번호가 맞지 않습니다.";	
		url = "member_login.jsp";
	}else{
		
		msg = info.get(0) + "님 환영합니다";
		
		session.setAttribute("sessionId", id);
		session.setAttribute("sessionName", info.get(0));
		session.setAttribute("sessionLevel", info.get(1));
		session.setMaxInactiveInterval(60 * 30);
		url = "../index.jsp";
	}
	
	out.println("id : " + id + "<br>");
	out.println("pw : " + pw + "<br>");
	out.println(msg);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
</head>
<body>

</body>
</html>