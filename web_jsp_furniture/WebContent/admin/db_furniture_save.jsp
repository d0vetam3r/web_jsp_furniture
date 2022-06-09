<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*,dao.*,dto.*" %>
<%@ page import="com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<%
	Furniture_dao dao = new Furniture_dao();

	String file_dir = CommonUtil.getFile_dir_furniture();
	int sizeLimit = 1024 * 1024 * 10;
	MultipartRequest mpr = new MultipartRequest(request, file_dir, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	
	String attachName = mpr.getFilesystemName("t_attach");
	
	String maxNo = dao.getMaxNo();
	
	String no 		= CommonUtil.getNewNo("I000", maxNo);
	String title 	= mpr.getParameter("t_title");
	String size 	= mpr.getParameter("t_size");
	String order 	= mpr.getParameter("t_order");
	String reg_id 	= (String)session.getAttribute("sessionId");
	String reg_date = CommonUtil.getToday();
	
	out.print("no 		" + no 		 +"<br>");
	out.print("title 	" + title 	 +"<br>");
	out.print("size 	" + size 	 +"<br>");
	out.print("order 	" + order 	 +"<br>");
	out.print("reg_id 	" + reg_id 	 +"<br>");
	out.print("reg_date : " +  reg_date+"<br>");
	out.print("fileName : " + attachName);
	
	Furniture_dto dto = new Furniture_dto(no,title,size,attachName, order, reg_id, reg_date);
	
	int result = dao.saveFurni(dto);
	
	String msg = "등록실패. 알아서 잘 해결하시오";
	if(result == 1){
		msg = "등록되었습니다";
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
	location.href="furniture_list.jsp";
</script>
<body>

</body>
</html>