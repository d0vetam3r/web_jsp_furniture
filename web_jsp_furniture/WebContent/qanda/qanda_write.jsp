<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*" %>
<%@ include file="../common_head.jsp" %>

<script>
	function goGuestQnaSave(){
		if(checkValue(qanda.t_guest_id, "ID를 입력하세요")) return;
		if(checkValue(qanda.t_guest_pw, "비밀번호를 입력하세요")) return;
		if(checkValue(qanda.t_title, "제목을 입력하세요")) return;
		if(checkValue(qanda.t_content, "내용을 입력하세요")) return;
		if(checkValue(qanda.t_reg_date, "작성일을 입력하세요")) return;
		qanda.method="post";
		qanda.action="db_guest_qanda_save.jsp";
		qanda.submit();
	}
	
	function goMemberQnaSave(){
		if(checkValue(qanda.t_title, "제목을 입력하세요")) return;
		if(checkValue(qanda.t_content, "내용을 입력하세요")) return;
		if(checkValue(qanda.t_reg_date, "작성일을 입력하세요")) return;
		qanda.method="post";
		qanda.action="db_mem_qanda_save.jsp";
		qanda.submit();
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
			
			<form name="qanda">

			<table class="boardForm">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tbody>
				<%-- 회원,비회원 체크 --%>
					<%if(sessionId==""){%>
					<tr>
						<th>비회원ID</th>
						<td><input type="text" name="t_guest_id" class="input130" placeholder='임시ID입력'></td>
						<th>PW</th>
						<td><input type="text" name="t_guest_pw" class="input130" placeholder='4자리숫자입력'></td>
					</tr>
					<%}%>
					<tr>
						<th>Title</th>
						<td colspan="3"><input type="text" name="t_title" class="input600"></td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3"><textarea name="t_content" class="textArea_H250"></textarea></td>
					</tr>	
					<tr>
						<th>Attach</th>
						<td colspan="3"><input type="file" name="t_attach" class="input600"></td>
					</tr>	
					<tr>
						<th>전체공개</th>
						<td>
						<input type="radio" name="t_pub_pri" value="public" checked>예
						<input type="radio" name="t_pub_pri" value="private">아니오
						</td>
						<th>RegDate</th>
						<td><input type="date" class="input130" name="t_reg_date" value="<%=CommonUtil.getToday()%>"></td>
					</tr>
				</tbody>
			</table>
			</form>
			<div class="buttonGroup">
			<%if(sessionId==""){%>
				<a href="javascript:goGuestQnaSave()" class="butt">Save</a>
				<%} else{%>
				<a href="javascript:goMemberQnaSave()" class="butt">Save</a>
				<%}%>
				<a href="qanda_list.jsp" class="butt">List</a>
			</div>	
		</div>	

<%@ include file="../common_footer.jsp" %>

	</div>	
</body>
</html>
