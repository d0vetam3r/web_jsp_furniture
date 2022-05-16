<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*,common.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Qanda_dao dao = new Qanda_dao();
	
	String maxNo = dao.getMaxNo();

	String no		= CommonUtil.getNewNo("Q000", maxNo);
	String title 	= request.getParameter("t_title");
	String content 	= request.getParameter("t_content");
	String reg_id 	= (String)session.getAttribute("sessionId");
	String reg_date = request.getParameter("t_reg_date");
	String is_guest = "n";
	String pub_pri = request.getParameter("t_pub_pri");

	
	
	out.print("maxNo 	 : " + maxNo		+ "<br>");
	out.print("title 	 : " + title 		+ "<br>");
	out.print("content 	 : " + content		+ "<br>");
	out.print("reg_id 	 : " + reg_id 		+ "<br>");
	out.print("reg_date	 : " + reg_date 	+ "<br>");
	out.print("is_guest	 : " + is_guest 	+ "<br>");
	out.print("no		 : " + no			+ "<br>");
	
	Qanda_dto dto = new Qanda_dto(no,title,content,reg_id,reg_date,is_guest,"","",pub_pri);
	
	int result = dao.insertQandaGuest(dto);
	String msg = "등록실패 관리자에게 문의바랍니다.";
	if(result == 1){
		msg = "등록성공";
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
	location.href="qanda_list.jsp";
</script>
<body>

</body>
</html>