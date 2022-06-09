<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*,java.util.*,common.*" %>
<%@ include file="../common_head.jsp" %>
<%
	if(!sessionLevel.equals("top")){
%>
	<script>
	alert("접근권한이 없습니다.");
	location.href="/index.jsp"
	</script>

	<%} else{
	request.setCharacterEncoding("utf-8");
	String select = request.getParameter("t_select");
	String search = request.getParameter("t_search");
	
	Member_dao dao = new Member_dao();
	String pageNumber = request.getParameter("s_nowPage");
	
	if(select == null){
		select = "id";
		search = "";
	}
	/* paging 설정 start*/
	String nowPage = request.getParameter("s_nowPage");

	int current_page = 0; // 현재페이지 번호
	int total_page = 0;    // 전체 페이지 수
	int total_count = dao.getTotalCount(select , search); // 전체 행 수
	int list_setup_count = 10;  //한페이지당 출력 행수 
	
	if(nowPage == null || nowPage.equals( "")) current_page = 1; 
	else current_page = Integer.parseInt(nowPage);
	
	total_page = total_count / list_setup_count;  // 몫 : 2
	int rest = 	total_count % list_setup_count;   // 나머지:1
	if(rest !=0) total_page = total_page + 1;     // 3
	
	int start = (current_page -1) * list_setup_count + 1;
	int end   = current_page * list_setup_count;
	/* paging 설정 end*/	
	
	int start_number = total_count-(current_page-1)*list_setup_count;
	
	
	ArrayList<Member_dto> dtos = dao.getMemberList(select, search, start, end);
	out.print(dtos.size());
	%>
<script>
function goPage(pageNumber){
	pageForm.s_nowPage.value = pageNumber;
	pageForm.method = "post";
	pageForm.action = "member_list.jsp";
	pageForm.submit();
}
</script>
<form name ="pageForm">
	<input type="hidden" name = "s_nowPage" value = "<%=pageNumber%>">
	<input type="hidden" name = "s_select" value = "<%=select%>">
	<input type="hidden" name = "s_search" value = "<%=search%>">
</form>

		<div id="b_left">
			<P>MANAGER</P>
			<ul>
				<li><a href="/admin/member_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span> NOTICE</a></li>
				<li><a href="/admin/furniture_list.jsp"><span class="fnt"></span> FURNITHRE LIST</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				MEMBER
			</p>
			<form method="post" action="member_list.jsp">
			<p class="select_box">
				<select class="sel_box" name="t_select">
					<option value="id" <%if(select.equals("id")) out.print("selected");%>>ID</option>
					<option value="name" <%if(select.equals("name")) out.print("selected");%>>NAME</option>
				</select>
				<input type="text" class="sel_text" name="t_search" value="<%=search%>">

				<button type="submit" class="sel_button"><i class="fa fa-search"></i> SEARCH</button>
			</p>
			</form>
			
			<table class="boardList">
				<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>ID</th>
						<th>Name</th>
						<th>Gender</th>
						<th>Reg Date</th>
						<th>Level</th>
						<th>Exit</th>
					</tr>
				</thead>
				<tbody>
				<%for(int i = 0; i<dtos.size();i++){ %>
					<tr>
						<td><%=start_number--%></td>
						<td><a href="member_view.jsp?t_id=<%=dtos.get(i).getId()%>"> <%=dtos.get(i).getId()%></a></td>
						<td><a href=""> <%=dtos.get(i).getName()%></a></td>
						<td><%=dtos.get(i).getGen()%></td>
						<td><%=dtos.get(i).getReg_date()%></td>
						<td><%=dtos.get(i).getLevel_gubun()%></td>
						<td><%=dtos.get(i).getExit_gubun()%></td>
					</tr>	
				<%} %>
				</tbody>
			</table>
			
			<div class="paging">
<%
	String info = CommonUtil.pageListPost(current_page, total_page, 3);
	out.println(info);
%>
				<a href="notice_write.html" class="write">글쓰기</a>
			</div>
		</div>	
	
<%@ include file="../common_footer.jsp" %>
	</div>	
</body>
</html>
<%}%>

페이지당 4개, 0 1 2 페이지

9	5	1
8	4
7	3
6	2


