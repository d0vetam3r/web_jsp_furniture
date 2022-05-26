<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*"%><%
   
    Member_dao dao = new Member_dao();
    String id = request.getParameter("t_id");
    int count = dao.getIdCount(id);
    
    if(count==1) out.print("사용불가");
    else out.print("사용가능");

%>