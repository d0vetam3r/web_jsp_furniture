<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Comment_dao dao = new Comment_dao();
	String no = request.getParameter("e_no");
	String content = request.getParameter("e_content");
	String reg_id = (String)session.getAttribute("sessionId");
	
	out.print("no : " + no + "<br>");
	out.print("content : " + content + "<br>");
	out.print("reg_id : " + reg_id);
	
	int result = dao.updateCmt(no,content,reg_id);
	String msg = "수정실패. 관리자에게 문의바랍니다.";
	if(result == 1){
		msg = "수정완료";
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
location.href="freeboard_view.jsp?v_no=<%=no%>";
</script>
<body>

</body>
</html>