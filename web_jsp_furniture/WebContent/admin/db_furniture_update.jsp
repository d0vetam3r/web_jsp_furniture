<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*,common.*,com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.*" %>
<%
	Furniture_dao dao = new Furniture_dao();
	String file_dir = CommonUtil.getFile_dir_furniture();
	int sizeLimit = 1024 * 1024 * 10;
	
	MultipartRequest mpr = new MultipartRequest(request, file_dir, sizeLimit,"utf-8",new DefaultFileRenamePolicy());

	String no			= mpr.getParameter("t_no");
	String title 		= mpr.getParameter("t_title");
	String size 		= mpr.getParameter("t_size");
	String order 		= mpr.getParameter("t_order");
	String ori_attach 	= mpr.getParameter("t_ori_attach");
	String attach 		= mpr.getFilesystemName("t_attach");
	Furniture_dto dto = null;
	if(attach == null) {
		dto = new Furniture_dto(no, title, size, ori_attach, order,"","");
	} else{
		dto = new Furniture_dto(no, title, size, attach, order,"","");
	}
	
	int result = dao.UpdateFurn(dto);
	
	String msg = "수정실패. 무정자증이신가요?";
	
	if(result == 1 && attach != null){
		File file = new File(file_dir,ori_attach);
		file.delete();
		msg = "임신성공";
	} else if(result == 1){
		msg = "임신성공";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	alert=("<%=msg%>");
	location.href="furniture_view.jsp?t_no=<%=no%>";
</script>
<body>

</body>
</html>