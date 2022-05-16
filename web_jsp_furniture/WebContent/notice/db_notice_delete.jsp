<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%
	String no = request.getParameter("v_no");
	Notice_dao dao = new Notice_dao();
	int result = dao.deleteNotice(no);
	
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
	location.href="notice_list.jsp";
</script>
<body>
</body>
</html>