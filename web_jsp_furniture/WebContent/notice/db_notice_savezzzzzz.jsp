<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*,common.*" %>
<% 
	request.setCharacterEncoding("utf-8");
	Notice_dao dao = new Notice_dao();
	
	//게시글 번호 맥스값 구하는 메소드
	String maxNo = dao.getMaxNo();

	String no 		= CommonUtil.getNewNo("N000", maxNo);
	String title 	= request.getParameter("t_title");
	String content 	= request.getParameter("t_content"); 
	String attach 	= request.getParameter("t_attach");
	String reg_id 	= (String)session.getAttribute("sessionId");
	String reg_date = request.getParameter("t_reg_date");
	
	if(reg_id == null){
		%>
	<script>
		alert("세션이 만료되었습니다");
		location.href="notice_list.jsp";
	</script>	
	<%} 

	out.print("reg_id : " + reg_id + "<br>");
	out.print("reg_date : " + reg_date + "<br>");
	
	
	Notice_dto dto = new Notice_dto(no,title,content,"","",reg_id,reg_date);
	
	int result = dao.noticeSave(dto);
	String msg = "등록되었습니다";
	if(result != 1){
		msg = "등록실패";
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
왓따~~~~
</body>
</html>