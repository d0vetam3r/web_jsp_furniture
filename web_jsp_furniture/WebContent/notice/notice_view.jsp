<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*" %>
<%@ include file="../common_head.jsp" %>
<%
	String no = request.getParameter("v_no");
	Notice_dao dao = new Notice_dao();
	
	Notice_dto dto = dao.getView(no);
	if(dto == null){%>
		<script>
		alert("존재하지 않는 글이거나 삭제된 글입니다.");
		location.href="notice_list.jsp";
		</script>
	<%} else{%>
	
	
	<script>
	function goDelete(no){
		view.v_no.value=no;
		view.method="post";
		view.action="db_notice_delete.jsp";
		view.submit();
	}
	
	function goUpdate(no){
		view.v_no.value = no;
		view.method="post";
		view.action="notice_update.jsp";
		view.submit();
	}
</script>
	<form name = "view">
		<input type="hidden" name="v_no" value="1">
	</form>
			<div id="b_left">
			<P>NOTICE & NEWS</P>
			<ul>
				<li><a href="/notice/notice_list.jsp">NOTICE</a></li>
				<li><a href="/news/news_list.jsp">NEWS</a></li>
				<li><a href="/qanda/qanda_list.jsp">Q & A</a></li>
				<li><a href="/freeboard/freeboard_list.jsp">FREE BOARD</a></li>
				<li><a href="/etc/etc_list.jsp">ETC</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				NOTICE
			</p>
			
			<table class="boardForm">
				<colgroup>
					<col width="15%">
					<col width="55%">
					<col width="10%">
					<col width="20%">
				</colgroup>
				<tbody>
					<tr>
						<th>Title</th>
						<td colspan="2"><%=dto.getTitle()%></td>
						<td> <i class="far fa-eye"></i> <%=dto.getHit()%></td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3">
							<textarea class="textArea_H250_noBorder" readonly><%=dto.getContent()%></textarea>
						</td>
					</tr>	
					<tr>
						<th>Attach</th>
						<td colspan="3"><%=dto.getAttach()%></td>
					</tr>	
					<tr>
						<th>Writer</th>
						<td><%=dto.getReg_info()%></td>
						<th>RegDate</th>
						<td><%=dto.getReg_date()%></td>
					</tr>	

				</tbody>
			</table>
			<div class="buttonGroup">
				<a href="javascript:goDelete('<%=no%>')" class="butt">Delete</a>
				<a href="javascript:goUpdate('<%=no%>')" class="butt">Update</a>
				<a href="notice_list.jsp" class="butt">List</a>
			</div>	
		</div>	
<%@ include file="../common_footer.jsp" %>
	</div>	
</body>
</html>
<%}%>