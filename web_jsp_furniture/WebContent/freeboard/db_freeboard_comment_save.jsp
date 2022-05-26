<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*,common.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Comment_dao dao = new Comment_dao();
	
	String content = request.getParameter("c_content");
	String reg_id = (String)session.getAttribute("sessionId");
	String no = request.getParameter("c_no");
	String reg_date = CommonUtil.getTodayTime();
	int max_order = dao.getMaxOrder(no);
	int reg_order = ++max_order;
	int result = 0;
	result = dao.chkId(no, reg_id);
	
	if(result != 0){%>
	<script>
	alert("댓글은 한 게시물당 한개만 작성 가능합니다.");
	location.href="freeboard_list.jsp";
	</script>
		
	<%
	} else{
	Comment_dto dto = new Comment_dto(no,reg_order,content,reg_id,reg_date);
	
	result = dao.saveCmt(dto);
	String msg="등록실패 관리자에게 문의바랍니다.";
	if(result == 1){
		msg = "오옹 나이스";
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
<%}%>