<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*" %>
<%@ include file="../common_head.jsp" %>
<%
	String no = request.getParameter("v_no");
	Notice_dao dao = new Notice_dao();
	Notice_dto dto = dao.getView(no);
%>
<script>
	function goDBUpdate(no, id){
		if(checkValue(update.u_title, "제목을 입력하세요")) return;
		if(checkValue(update.u_content, "내용을 입력하세요")) return;
		if(checkValue(update.u_reg_date, "작성일을 입력하세요")) return;
		update.u_no.value=no;
		update.u_id.value=id;
		update.method="post";
		update.action="db_notice_update.jsp";
		update.submit();
	}
</script>
		<div id="b_left">
			<P>NOTICE & NEWS</P>
			<ul>
				<li><a href="notice_list.html"><span class="fnt"><i class="fas fa-apple-alt"></i></span> NOTICE</a></li>
				<li><a href="">NEWS</a></li>
				<li><a href="">Q & A</a></li>
				<li><a href="">FREE BOARD</a></li>
				<li><a href="">ETC</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				NOTICE
			</p>
			
			<form name="update">
			<input type="text" name="u_no" value="1">
			<input type="text" name="u_id" value="1">
			<table class="boardForm">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tbody>
					<tr>
						<th>Title</th>
						<td colspan="3"><input type="text" name="u_title" class="input600" value="<%=dto.getTitle()%>"></td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3"><textarea class="textArea_H250" name="u_content"><%=dto.getContent()%></textarea></td>
					</tr>	
					<tr>
						<th>Attach</th>
						<td colspan="3">
						<%if(!dto.getAttach().equals("없음")){%>
						<%=dto.getAttach()%> 삭제
						<input type="checkbox"><br>
						<%} %>
							<input type="file" class="input600">
						</td>
					</tr>	
					<tr>
						<th>Writer</th>
						<td><%=dto.getReg_info()%></td>
						<th>RegDate</th>
						<td><input type="date" name="u_reg_date" value="<%=dto.getReg_date()%>" class="input130"></td>
					</tr>	

				</tbody>
			</table>
			</form>
			<div class="buttonGroup">
				
				<a href="javascript:goDBUpdate('<%=no%>', '<%=dto.getReg_info()%>')" class="butt">Save</a>
				<a href="notice_list.jsp" class="butt">List</a>
			</div>	
		</div>	
		<%@ include file="../common_footer.jsp" %>
	</div>	
</body>
</html>
		