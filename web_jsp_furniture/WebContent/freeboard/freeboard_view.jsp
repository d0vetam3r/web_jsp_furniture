<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*,java.util.*" %>
<%@ include file="../common_head.jsp" %>
<%
	String no = request.getParameter("v_no");
	Freeboard_dao dao = new Freeboard_dao();
	Comment_dao dao2 = new Comment_dao();
	String flag = request.getParameter("checker");
	out.print(no);
	
	if(flag == null){
		flag = "1";
	}
	out.print(flag);
	
	Freeboard_dto dto = dao.getView(no);
	if(dto == null){%>
		<script>
		alert("존재하지 않는 글이거나 삭제된 글입니다.");
		location.href="freeboard_list.jsp";
		</script>
	<%} else{
		ArrayList<Comment_dto> dtos = dao2.getComment(no);
		%>
		
	<script>
	
	function goCmtDelete(no, reg_id){
		dlt.v_no.value=no;
		dlt.v_reg_id.value=reg_id;
		dlt.method="post";
		dlt.action="db_freeboard_comment_delete.jsp";
		dlt.submit();
	}
	function updateCmt(no){
		update.e_no.value = no;
		update.method="post";
		update.action="db_freeboard_comment_update.jsp";
		update.submit();
	}	
	
	function ActivateBTN(no){
		flag.v_no.value = no;
		flag.checker.value = "0";
		flag.method="get";
		flag.action="freeboard_view.jsp?v_no=<%=no%>";
		flag.submit();
	}
	
	function goDelete(no){
		view.v_no.value=no;
		view.method="post";
		view.action="db_freeboard_delete.jsp";
		view.submit();
	}
	
	function goUpdate(no){
		view.v_no.value = no;
		view.method="post";
		view.action="freeboard_update.jsp";
		view.submit();
	}
	
	function saveCmt(){
		let chk_session = "<%=sessionId%>";
		if(checkValue(comment.c_content, "내용을 입력하세요")) return;
		if(chk_session.length == 0){
			alert("로그인 후 이용가능합니다");
			return;
		}
		comment.c_no.value = "<%=no%>";
		comment.method="post";
		comment.action="db_freeboard_comment_save.jsp"
		comment.submit();
	}
</script>
	<form name="dlt">
		<input type="text" name="v_no" value="1">
		<input type="text" name="v_reg_id" value="1">
		
	</form>
	<form name="flag">
		<input type="hidden" name="checker" value="1">
		<input type="hidden" name="v_no" value="1">
	</form>
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
						<th>Writer</th>
						<td><%=dto.getReg_id()%></td>
						<th>RegDate</th>
						<td><%=dto.getReg_date()%></td>
					</tr>	
					<form name="comment">
					<tr>
						<td colspan="3">
						<input type="text" size="100" style="width:100%" name="c_content" placeholder='댓글을 작성하세요'>
						<input type="hidden" name="c_no" value="1">
						</td>
						<td>
						<a href="javascript:saveCmt()" class="butt">댓글저장</a>
						</td>
					</tr>
					</form>
					<%for(int i = 0; i<dtos.size(); i++){ %>
					<tr>
						<td colspan="2"><i class="fa-solid fa-reply" style="transform: rotate(180deg)"></i>
						<%if(flag.equals("0") && sessionId.equals(dtos.get(i).getReg_id())){%>
						<form name="update">
						<input type="text" style="width:80%" name="e_content" value="<%=dtos.get(i).getContent()%>">
						<a style="cursor:pointer" onclick="javascript:updateCmt('<%=no%>')">[저장]</a>
						<input type="hidden" name="e_no" value="1">
						</form>
						<%} else out.print(dtos.get(i).getContent());%>
						<%if(sessionId.equals(dtos.get(i).getReg_id())||sessionLevel.equals("top")||sessionLevel.equals("manager")) {%><a style="cursor:pointer" onclick="javascript:goCmtDelete('<%=no%>', '<%=dtos.get(i).getReg_id()%>')"><br>[삭제]</a><%} else {%>
						<%if(sessionId.equals(dtos.get(i).getReg_id())) out.print("<br>");%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%} %>
						<%if(sessionId.equals(dtos.get(i).getReg_id())){%>
						<a style="cursor:pointer" onclick="javascript:ActivateBTN('<%=no%>')">[수정]</a><%} %>
						</td>
						<th><%=dtos.get(i).getReg_id()%></th>
						<td><%=dtos.get(i).getReg_date()%></td>
					</tr>
					<%} %>
				</tbody>
			</table>
			
			<br>
				
			
			<div class="buttonGroup">
			<%if(sessionId.equals(dto.getReg_id())||sessionLevel.equals("top")||sessionLevel.equals("manager")) {%>
				<a href="javascript:goDelete('<%=no%>')" class="butt">Delete</a>
			<%}; 
			if(sessionId.equals(dto.getReg_id())){%>
				<a href="javascript:goUpdate('<%=no%>')" class="butt">Update</a>
			<% }%>
				<a href="freeboard_list.jsp" class="butt">List</a>
			</div>	
		</div>	
<%@ include file="../common_footer.jsp" %>
	</div>	
</body>
</html>
<%}%>