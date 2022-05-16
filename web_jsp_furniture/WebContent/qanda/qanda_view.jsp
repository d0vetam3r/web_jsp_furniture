<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*" %>
<%@ include file="../common_head.jsp" %>
<%
	Qanda_dao dao = new Qanda_dao();
	String no = request.getParameter("t_no");
	Qanda_dto dto = dao.checkPriPub(no);
	out.print("공개여부 : " + dto.getPub_pri() + "<br>");
	String check = (String)session.getAttribute("view_auth");
	out.print("접속직후 세션 : " + check + "<br>");
	session.removeAttribute("view_auth");
	boolean writer = false;
	if(check == null){
		check = "";
	}
	boolean tftf = true;
	if(dto.getPub_pri().equals("private")){ // 공개,비공개 게시글 여부 확인.
		if(dto.getIs_guest().equals("n")){	// 회원,비회원 게시글 여부 확인(회원이 작성한 게시글일 때).
			if(sessionId.equals(dto.getReg_info())){
				tftf = true;				// 회원 비공개글을 해당 회원이 조회할 때.
				writer = true;
			} else{
				tftf = false;				//	아무튼 아닐 때
			}
		} else{								//비회원이 작성한 게시글일때.
			if(check.equals("true")){		// 세션이 유효할 때
				tftf = true;
			} else{							// 유효하지 않은 세션일 때
				tftf = false;
			}
		}
	}else{
			if(dto.getIs_guest().equals("n")){
				if(sessionId.equals(dto.getReg_info())){
					writer = true;
			}
		}
	}
	if(sessionLevel.equals("manager")||sessionLevel.equals("top")){
		tftf = true;						//관리자는 모든 게시글 조회가능
	} 
	//접속후
	check = (String)session.getAttribute("view_auth");
	out.print("로딩후 세션 : " + check);
	
%>

<%if(tftf == false) {%>
	<script>
	alert("잘못된 접근입니다.");
	location.href="qanda_list.jsp";
	</script>
<%} else{
		dao.updateHit(dto.getHit(),dto.getNo());%>
<script>
	function goDelete(no){
		let is_guest = "<%=dto.getIs_guest()%>";
		if(is_guest === "y"){}
			alert("zzzz");
	}

</script>
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
			Q & A
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
					<td colspan="3">없음</td>
				</tr>	
				<tr>
					<th>Writer</th>
					<%if(dto.getIs_guest().equals("n")) {%>
					<td><%=dto.getReg_info() %></td>
					<%} else {%>
					<td><%=dto.getGuest_id() %></td>
					<%} %>
					<th>RegDate</th>
					<td><%=dto.getReg_date()%></td>
				</tr>	

			</tbody>
		</table>
		<div class="buttonGroup">
			<%if(writer == true || sessionLevel.equals("top") || sessionLevel.equals("manager") || dto.getIs_guest().equals("y")) {%>
			<a href="javascript:goDelete('<%=no%>')" class="butt">Delete</a>
			<%} %>
			<%if(writer == true || dto.getIs_guest().equals("y")) {%>
			<a href="db_qanda_update.jsp" class="butt">Update</a>
			<%} %>
			<a href="qanda_list.jsp" class="butt">List</a>
		</div>	
	</div>	
<%@ include file="../common_footer.jsp" %>
	</div>	
</body>
</html>
<%System.out.print(dto.getIs_guest()); %>
<%}%>