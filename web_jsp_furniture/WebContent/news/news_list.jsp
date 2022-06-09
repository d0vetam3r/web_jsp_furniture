<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*, java.util.*,common.*" %>
<%@ include file="../common_head.jsp" %>
<%	
	request.setCharacterEncoding("utf-8");

	News_dao dao = new News_dao();
	String pageNumber = request.getParameter("s_nowPage");
	
	String select = request.getParameter("s_select");
	String search = request.getParameter("s_search");
	if(select==null){
		select = "title";
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
	
	ArrayList<News_dto> dtos = dao.getNewsListPaging(select, search, start, end);
	//ArrayList<News_dto> dtos = dao.getNewsList(select, search);
%>
<Script>
	function goPage(pageNumber){
		pageForm.s_nowPage.value = pageNumber;
		pageForm.method = "post";
		pageForm.action = "news_list.jsp";
		pageForm.submit();
	}

	function goView(no){
		view.v_no.value=no;
		//view.method="post";
		view.action="news_view.jsp";
		view.submit();
		
	}

	function goSearch(){
		s_search.method="post";
		s_search.action="/news/news_list.jsp";
		s_search.submit;
	}
</Script>
<form name ="pageForm">
	<input type="hidden" name = "s_nowPage" value = "<%=pageNumber%>">
	<input type="hidden" name = "s_select" value = "<%=select%>">
	<input type="hidden" name = "s_search" value = "<%=search%>">
</form>
<form name = "view">
	<input type="hidden" name="v_no" value="1">
</form>
				<div id="b_left">
			<P>News & NEWS</P>
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
				NEWS
			</p>
			<form name="s_search">
			<p class="select_box">
				<select name="s_select">
					<option value="title" <%if(select.equals("title")) out.print("selected"); %> >Title</option>
					<option value="content"<%if(select.equals("content")) out.print("selected"); %> >Content</option>
				</select>
				<input name="s_search" type="text" class="sel_text" value="<%=search%>">

				<button type="submit" onclick="javascript:goSearch()" class="sel_button"><i class="fa fa-search"></i> SEARCH</button>
			</p>
			</form>
			
			<table class="boardList">
				<colgroup>
					<col width="5%">
					<col width="60%">
					<col width="5%">
					<col width="10%">
					<col width="14%">
					<col width="6%">
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>Title</th>
						<th>Attach</th>
						<th>Reg Name</th>
						<th>Reg Date</th>
						<th>Hit</th>
					</tr>
				</thead>
				<tbody>
				<%for(int i = 0; i<dtos.size(); i++){%>
					<tr>
						<td><%=start_number--%></td>
						<td class="t_center"><a style="cursor:pointer" href="javascript:goView('<%=dtos.get(i).getNo()%>')"><%=dtos.get(i).getTitle() %></a></td>
						<td><%if(dtos.get(i).getAttach() != null) {%><a style="cursor:pointer" href="/WebContent/attach/news/<%=dtos.get(i).getAttach()%>"><img src="../images/clip.png"></a><%} %></td>
						<td><%=dtos.get(i).getReg_info()%></td>
						<td><%=dtos.get(i).getReg_date()%></td>
						<td><%=dtos.get(i).getHit()%></td>
					</tr>	
					<%} %>
				</tbody>
			</table>
				
			<div class="paging">
<%
	String info = CommonUtil.pageListPost(current_page, total_page, 3);
	out.println(info);
%>
				<%if(sessionLevel.equals("top")) {%>
				<a href="news_write.jsp" class="write">글쓰기</a>
				<%} %>
			</div>
		</div>	
	
<%@ include file="../common_footer.jsp" %>

	</div>	
</body>
</html>