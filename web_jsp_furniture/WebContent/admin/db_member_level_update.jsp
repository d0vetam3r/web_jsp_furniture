<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("t_id");
	String level = request.getParameter("t_level");
	out.print(id+"<br>");
	out.print(level);
	
	Member_dao dao = new Member_dao();
	
	int result = dao.updateLevel(id,level);
	String msg = result==1? "권한수정완료" : "권한수정 실패";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
alert("<%=msg%>");
location.href="/admin/member_view.jsp?t_id=<%=id%>";
</script>
<body>

</body>
</html>