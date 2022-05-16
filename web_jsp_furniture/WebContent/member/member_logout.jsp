<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<% 
	String name = (String)session.getAttribute("sessionName");
	session.invalidate();
	String msg = "로그아웃 되었습니다.";
	if(name != null) {
		msg = name + "님 로그아웃 되었습니다.";
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="../index.jsp";
</script>
<body>

</body>
</html>