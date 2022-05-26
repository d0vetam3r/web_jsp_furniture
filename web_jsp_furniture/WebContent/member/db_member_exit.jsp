<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("t_id");
	Member_dao dao = new Member_dao();
	
	int result = dao.memberExit(id);
	String msg = result==1? "탈퇴완료" : "관리자에게 문의바랍니다.";
	if(result == 1){
	session.invalidate();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	alert("<%=msg%>");
	location.href="/index.jsp";
</script>
<body>

</body>
</html>