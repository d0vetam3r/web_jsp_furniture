<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,common.*,com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.*" %>
<%
	Furniture_dao dao = new Furniture_dao();
	String file_dir = CommonUtil.getFile_dir_furniture();
	int sizeLimit = 1024 * 1024 * 10;
	
	MultipartRequest mpr = new MultipartRequest(request, file_dir, sizeLimit,"utf-8",new DefaultFileRenamePolicy());
	
	String attachName = mpr.getParameter("t_attach");
	String no = mpr.getParameter("t_no");
	
	String msg = "삭제실패. 관리자에게 문의바랍니다.";
	
	int result = dao.deleteFurniture(no);
	if(result == 1){
		File file = new File(file_dir,attachName);
		file.delete();
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
 	location.href="furniture_list.jsp";
 </script>
<body>

</body>
</html>