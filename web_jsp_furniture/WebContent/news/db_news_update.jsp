<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*,common.*,com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.*" %>
<% 
	request.setCharacterEncoding("utf-8");
	News_dao dao = new News_dao();
	
	String file_dir = CommonUtil.getFile_dir_news();
	int sizeLimit = 1024 * 1024 * 10;
	
	MultipartRequest mpr = new MultipartRequest(request, file_dir, sizeLimit,"utf-8",new DefaultFileRenamePolicy());
	
	String title 	= mpr.getParameter("u_title");
	String content 	= mpr.getParameter("u_content");
	String reg_date = mpr.getParameter("u_reg_date");
	String no 		= mpr.getParameter("u_no");
	
	//삭제할 파일명
	String del_file = CommonUtil.checkNull(mpr.getParameter("u_del_attach"));
	//새로 업로드한 파일명
	String new_file = CommonUtil.checkNull(mpr.getParameter("u_new_attach"));
	//기조 파일명
	String ori_file = CommonUtil.checkNull(mpr.getParameter("u_ori_attach"));
	/*
	int result = dao.NewsUpdate(title, content, reg_date, no);
	String msg = "수정실패 관리자에게 문의바랍니다.";
	if(result == 1){
		msg = "수정성공";
	}
	*/
%>
<!DOCTYPE html>
<html>
<head>
<script>

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>