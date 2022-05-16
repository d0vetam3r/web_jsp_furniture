<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%
	String no = request.getParameter("v_no");
	Freeboard_dao dao = new Freeboard_dao();
	int result = dao.deleteFree(no);
	
	String msg = "삭제실패 관리자에게 문의바랍니다.";
	if(result == 1){
		msg = "삭제성공";
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
	location.href="freeboard_list.jsp";
</script>
<body>
</body>
</html>