<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*,common.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<% 
	request.setCharacterEncoding("utf-8");
	News_dao dao = new News_dao();
	
	String file_dir = "C:/Users/dove99/git/web_jsp_furniture/web_jsp_furniture/WebContent/attach/news";
	int sizeLimit = 1024 * 1024 * 10;
	
	MultipartRequest mpr = new MultipartRequest(request, file_dir, sizeLimit,"utf-8",new DefaultFileRenamePolicy());
	
	String attachName = mpr.getFilesystemName("t_attach");
	
	String maxNo = dao.getMaxNo();

	String no 		= CommonUtil.getNewNo("N000", maxNo);
	String title 	= mpr.getParameter("t_title");
	String content 	= mpr.getParameter("t_content");
	String reg_id 	= (String)session.getAttribute("sessionId");
	String reg_date = mpr.getParameter("t_reg_date");
	if(attachName == null) {
		attachName = "";
	}

	News_dto dto = new News_dto(no,title,content,attachName,"",reg_id,reg_date);
	
	int result = dao.newsSave(dto);
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
	location.href="news_list.jsp";
</script>
<body>
왓따~~~~
</body>
</html>