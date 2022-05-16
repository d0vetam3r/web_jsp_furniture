<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*" %>
<%@ include file="../common_head.jsp" %>
<%if(!sessionLevel.equals("top") && !sessionLevel.equals("manager")){%>
	<script>
		alert("로그인 하지 않았거나 권한이 없습니다.");
		location.href="/index.jsp";
	</script>
<% }%>
<script>
	function goNewsSave(){
		if(checkValue(news.t_title, "제목을 입력하세요")) return;
		if(checkValue(news.t_content, "내용을 입력하세요")) return;
		if(checkValue(news.t_reg_date, "작성일을 입력하세요")) return;
		news.method="post";
		news.action="db_news_save.jsp";
		news.submit();
	}
</script>
}

		<div id="b_left">
			<P>NOTICE & NEWS</P>
			<ul>
				<li><a href="notice_list.jsp"> NOTICE</a></li>
				<li><a href="/news/news_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span>NEWS</a></li>
				<li><a href="/qanda/qanda_list.jsp">Q & A</a></li>
				<li><a href="/freeboard/freeboard_list.jsp">FREE BOARD</a></li>
				<li><a href="/etc/etc_list.jsp">ETC</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				NEWS
			</p>
			
			<form name="news">
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
						<th>Writer</th>
						<td><%=sessionName%></td>
						<th>RegDate</th>
						<td><input type="date" class="input130" name="t_reg_date" value="<%=CommonUtil.getToday()%>"></td>
					</tr>
				</tbody>
			</table>
			</form>
			<div class="buttonGroup">
				<a href="javascript:goNewsSave()" class="butt">Save</a>
				<a href="news_list.jsp" class="butt">List</a>
			</div>	
		</div>	

<%@ include file="../common_footer.jsp" %>

	</div>	
</body>
</html>
