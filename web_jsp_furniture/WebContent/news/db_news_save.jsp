<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*,dao.*,common.*" %>
<%
	News_dao dao = new News_dao();
	
	String max_no	= dao.getMaxNo();
	String no 		= CommonUtil.getNewNo("N000", max_no);
	String title 	= request.getParameter("t_title");
	String content 	= request.getParameter("t_content");
	String attach 	= request.getParameter("t_attach");
	String reg_id 	= (String)session.getAttribute("sessionName");
	String reg_date = request.getParameter("t_reg_date");
	
	out.print("max_no	: " + max_no	+"<br>"); 
	out.print("no 		: " + no 		+"<br>");
	out.print("title 	: " + title 	+"<br>");
	out.print("content  : " + content   +"<br>");
	out.print("attach 	: " + attach 	+"<br>");
	out.print("reg_id 	: " + reg_id 	+"<br>");
	out.print("reg_date : " + reg_date  +"<br>");
	
	if(reg_id == null){
	%>
	<script>
	alert("로그인 하지 않았거나 권한이 없습니다.");
	location.href="/index.jsp";
	</script>
<%
	} else{
	News_dto dto = new News_dto(no,title,content,attach,"",reg_id,reg_date);
	
	int result = dao.saveNews(dto);
	String msg = "등록에 실패하였습니다";
	
	if(result == 1){
		msg = "등록성공";
	}
	out.print(msg);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
alert("<%=msg%>");
location.href="/news/news_list.jsp";
</script>
<body>
왔따~~~~~~~~~~~~~
</body>
</html>
<%}%>