<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Comment_dao dao = new Comment_dao();
	String reg_id = request.getParameter("v_reg_id");
	String no = request.getParameter("v_no");
	
	out.print(reg_id);
	out.print(no);
	
	int result = dao.deleteCmt(no, reg_id);
	String msg = "삭제실패. 관리자에게 문의바랍니다.";
	if(result == 1){
		msg = "삭제완료";
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