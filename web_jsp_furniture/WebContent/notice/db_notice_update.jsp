<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*,common.*,com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.*" %>
<% 
	request.setCharacterEncoding("utf-8");
	Notice_dao dao = new Notice_dao();
	
	String file_dir = CommonUtil.getFile_dir_notice();
	int sizeLimit = 1024 * 1024 * 10;
	
	MultipartRequest mpr = new MultipartRequest(request, file_dir, sizeLimit,"utf-8",new DefaultFileRenamePolicy());
	
	String attachName = mpr.getFilesystemName("t_attach");
	if(attachName == null) attachName="";
	
	String title		= mpr.getParameter("u_title");
	String content		= mpr.getParameter("u_content");
	String reg_date		= mpr.getParameter("u_reg_date");
	String no			= mpr.getParameter("u_no");
	String delete_attach= mpr.getParameter("del_attach");
	
	//첨부파일 체크박스 삭제체크 했으면
	if(delete_attach != null){
		File file = new File(file_dir,delete_attach);
		file.delete();
	}
	//새로운 파일 등록시
	if(!attachName.equals("")){
		String del_file =mpr.getParameter("t_ori_attach");
		if(del_file == null) del_file = "";
		if(!del_file.equals("")){
			File file = new File(file_dir,del_file);
			file.delete();
		}
	}
	out.print(delete_attach);
//	int result = dao.noticeUpdate(title, content, reg_date, no);
	
//	String msg = "수정실패 관리자에게 문의바랍니다.";
//	if(result == 1){
//		msg = "수정성공";
//	}
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