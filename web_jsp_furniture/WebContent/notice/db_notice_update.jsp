<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*" %>

<% 
	request.setCharacterEncoding("utf-8");

	String title 	= request.getParameter("u_title");
	String content 	= request.getParameter("u_content");
	String reg_date = request.getParameter("u_reg_date");
	String no 		= request.getParameter("u_no");
	
	Notice_dao dao = new Notice_dao();
	int result = dao.noticeUpdate(title, content, reg_date, no);
	
	String msg = "수정실패 관리자에게 문의바랍니다.";
	if(result == 1){
		msg = "수정성공";
	}
%>
<!DOCTYPE html>
<html>
<head>
<script>
	alert("<%=msg%>");
	location.href="notice_list.jsp";
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>