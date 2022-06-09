<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*,java.util.*,common.*" %>
<%@ include file="../common_head.jsp" %>
<%
	if(!sessionLevel.equals("top")){%>
		<script>
		alert("잘못된 접근입니다.");
		location.href="/index.jsp";
		</script>
	<%} else{%>
<script>
	function goDelete(no,attach){
		var chk = confirm("정말 삭제하시겠습니까?");
		if(chk){
			furn.t_no.value=no;
			furn.t_attach.value=attach;
			furn.method="post";
			furn.action="db_furniture_delete.jsp";
			furn.submit();
		} else{
			return;
		}
	}

</script>
<%	
	request.setCharacterEncoding("utf-8");

	String no = request.getParameter("t_no");
	
	Furniture_dao dao = new Furniture_dao();
	Furniture_dto dto = dao.getView(no);
%>
	<form name="furn" enctype="multipart/form-data">
		<input type="hidden" name="t_no" value="1">
		<input type="hidden" name="t_attach" value="1">
	</form>
		<div id="b_left">
			<P>NOTICE & NEWS</P>
			<ul>
				<li><a href="/admin/member_list.jsp"><span class="fnt"></span> NOTICE</a></li>
				<li><a href="/admin/furniture_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span> FURNITHRE LIST</a></li>
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
						<th>Name</th>
						<td colspan="3"><%=dto.getName() %></td>
					</tr>
					<tr>
						<th>Order</th>
						<td colspan="3"><%=dto.getOrder() %></td>
					</tr>		
					<tr>
						<th>image</th>
						<td colspan="3">
							<img src="../attach/furniture/<%=dto.getAttach() %>" style="width: 30vw; min-width: 140px;">	
						</td>
					</tr>	
					<tr>
						<th>Size</th>
						<td colspan="3"><%=dto.getSize()%></td>
					</tr>	
					<tr>
						<th>Writer</th>
						<td><%=dto.getId() %></td>
						<th>RegDate</th>
						<td><%=dto.getDate() %></td>
					</tr>	

				</tbody>
			</table>
			<div class="buttonGroup">
				<a href="javascript:goDelete('<%=no%>','<%=dto.getAttach()%>')" class="butt">Delete</a>
				<a href="furniture_update.jsp?t_no=<%=no%>" class="butt">Update</a>
				<a href="furniture_list.jsp" class="butt">List</a>
			</div>	
		</div>	

<%@ include file="../common_footer.jsp" %>
	</div>	
</body>
</html>
<%} %>