<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*" %>
<%@ include file="../common_head.jsp" %>
<%
	if(sessionId.equals("")){
%>
<script>
	alert("로그인 후 이용 가능합니다.")
	location.href="/freeboard/freeboard_list.jsp"
</script>
<%
	}else{
%>
<script>
function goSave(){
	if(checkValue(fb.t_title, "제목 입력!")) return;
	if(checkValue(fb.t_content, "내용 입력!")) return;
	if(checkValue(fb.t_date, "날짜 입력!")) return;
	fb.method="post";
	fb.action="db_freeboard_save.jsp";
	fb.submit();
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
				FREE BOARD
			</p>
			
			<table class="boardForm">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<form name="fb">
				<tbody>
					<tr>
						<th>Title</th>
						<td colspan="3"><input type="text" name="t_title" class="input600"></td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3"><textarea name="t_content" class="textArea_H250"></textarea></td>
					</tr>	
					<tr>
						<th>Writer</th>
						<td><%=sessionName%></td>
						<th>RegDate</th>
						<td><input type="date" class="input130" name="t_date" value="<%=CommonUtil.getToday()%>"></td>
					</tr>	
				</tbody>
				</form>
			</table>
			<div class="buttonGroup">
				<a href="javascript:goSave()" class="butt">Save</a>
				<a href="notice_list.html" class="butt">List</a>
			</div>	
		</div>	
		<%@ include file="../common_footer.jsp" %>
	</div>	
</body>
</html>
<%} %>

		