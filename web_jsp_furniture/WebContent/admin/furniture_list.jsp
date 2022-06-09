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

function goPage(pageNumber){
	pageForm.s_nowPage.value = pageNumber;
	pageForm.action = "furniture_list.jsp";
	pageForm.submit();
}
</script>

<%	

	request.setCharacterEncoding("utf-8");

	String radio = request.getParameter("t_radio");
	if(radio == null){
		radio= "3";
	}

	Furniture_dao dao = new Furniture_dao();
	String pageNumber = request.getParameter("s_nowPage");
	
	/* paging 설정 start*/
	String nowPage = request.getParameter("s_nowPage");

	int current_page = 0; // 현재페이지 번호
	int total_page = 0;    // 전체 페이지 수
	int total_count = dao.getTotalCount(); // 전체 행 수
	int list_setup_count = Integer.parseInt(radio);  //한페이지당 출력 행수 
	
	if(nowPage == null || nowPage.equals( "")) current_page = 1; 
	else current_page = Integer.parseInt(nowPage);
	
	total_page = total_count / list_setup_count;  // 몫 : 2
	int rest = 	total_count % list_setup_count;   // 나머지:1
	if(rest !=0) total_page = total_page + 1;     // 3
	
	int start = (current_page -1) * list_setup_count + 1;
	int end   = current_page * list_setup_count;
	/* paging 설정 end*/	
	
	int start_number = total_count-(current_page-1)*list_setup_count;
	
	ArrayList<Furniture_dto> dtos = dao.getFurnitureListPaging(start, end);
	//ArrayList<Notice_dto> dtos = dao.getNoticeList(select, search);
%>
<form name ="pageForm">
	<input type="hidden" name = "s_nowPage" value = "<%=pageNumber%>">
	<input type="hidden" name = "t_radio" value="<%=radio%>">
</form>
		<div id="b_left">
			<P>MANAGER</P>
			<ul>
				<li><a href="/admin/member_list.jsp"><span class="fnt"></span> NOTICE</a></li>
				<li><a href="/admin/furniture_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span> FURNITURE LIST</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				NOTICE
			</p>
			
			<form name="s_search">
			<p class="select_box"> 표시개수 : 
				<input type="radio" name="t_radio" value="3" <%if(radio.equals("3")) out.print("checked"); %>>3개
				<input type="radio" name="t_radio" value="5" <%if(radio.equals("5")) out.print("checked"); %>>5개
				<input type="radio" name="t_radio" value="10" <%if(radio.equals("10")) out.print("checked"); %>>10개
				<input type="radio" name="t_radio" value="20" <%if(radio.equals("20")) out.print("checked"); %>>20개
				<button type="submit" onclick="" class="sel_button"> confirm</button>
			</p>
			
			</form>
			<table class="boardList">
				<colgroup>
					<col width="5%">
					<col width="30%">
					<col width="30%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>Image</th>
						<th>Product Name</th>
						<th>Order</th>
						<th>Reg Name</th>
						<th>Reg Date</th>
					</tr>
				</thead>
				<tbody>
				<%for(int i = 0; i<dtos.size(); i++){ %>
					<tr>
						<td><%=start_number-- %></td>
						<td><img src="../attach/furniture/<%=dtos.get(i).getAttach() %>" style="width: 10vw; min-width: 140px;"></td>
						<td class="t_center"><a href="furniture_view.jsp?t_no=<%=dtos.get(i).getNo()%>"><%=dtos.get(i).getName()%></a></td>
						<td><%=dtos.get(i).getOrder()%></td>
						<td><%=dtos.get(i).getId()%></td>
						<td><%=dtos.get(i).getDate()%></td>
					</tr>	
				<%} %>
				</tbody>
			</table>
			
			<div class="paging">
<%
	String info = CommonUtil.pageListPost(current_page, total_page, 3);
	out.println(info);
%>
				<a href="furniture_write.jsp" class="write">이미지 등록</a>
			</div>
		</div>	
	
<%@ include file="../common_footer.jsp" %>
	</div>	
</body>
</html>
<%} %>
