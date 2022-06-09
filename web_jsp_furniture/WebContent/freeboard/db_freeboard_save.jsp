<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*,common.*" %>
<%@ page import="com.oreilly.servlet.*,com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
	request.setCharacterEncoding("utf-8");
	Freeboard_dao dao = new Freeboard_dao();

	String file_dir = "C:/Users/dove99/git/web_jsp_furniture/web_jsp_furniture/WebContent/attach/freeboard";
	int sizeLimit = 1024 * 1024 * 10;
	
	MultipartRequest mpr = new MultipartRequest(request, file_dir, sizeLimit,"utf-8", new DefaultFileRenamePolicy());

	String attachName = mpr.getFilesystemName("t_attach");
	
	String max_no	= dao.getMaxNo();
	
	String no 		= CommonUtil.getNewNo("F000", max_no);
	String title	= mpr.getParameter("t_title");
	String content 	= mpr.getParameter("t_content");
	String reg_id 	= (String)session.getAttribute("sessionId");
	String reg_date = mpr.getParameter("t_date");
	Freeboard_dto dto = new Freeboard_dto(no,title,content,"",reg_id,reg_date,attachName);
	
	if(attachName == null) {
		attachName = "";
	}
	
	int result = dao.saveFree(dto);
	String msg = "등록실패. 관리자에게 문의바랍니다.";
	if(result == 1){
		msg = "등록성공";
	}
	
%>

<!DOCTYPE html>
<script>
	alert("<%=msg%>");
	location.href="freeboard_list.jsp";
</script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>