<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*, java.util.*,common.*" %>
<%@ include file="../common_head.jsp" %>
<script>
alert("공사중입니다");
location.href="/notice/notice_list.jsp";
</script>
<%
	request.setCharacterEncoding("utf-8");

	Qanda_dao dao = new Qanda_dao();
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
	int list_setup_count = 8;  //한페이지당 출력 행수 
	
	if(nowPage == null || nowPage.equals("")) current_page = 1; 
	else current_page = Integer.parseInt(nowPage);
	
	total_page = total_count / list_setup_count;  // 몫 : 2
	int rest = 	total_count % list_setup_count;   // 나머지:1
	if(rest !=0) total_page = total_page + 1;     // 3
	
	int start = (current_page -1) * list_setup_count + 1;
	int end   = current_page * list_setup_count;
	/* paging 설정 end*/	
	
	
	
	ArrayList<Qanda_dto> dtos = dao.getQandaListPaging(select, search, start, end);
	//ArrayList<Qanda_dto> dtos = dao.getQandaList();
%>
<Script>
	function goPage(pageNumber){
		pageForm.s_nowPage.value = pageNumber;
		pageForm.method = "post";
		pageForm.action = "qanda_list.jsp";
		pageForm.submit();
	}

	function goSearch(){
		s_search.method="post";
		s_search.action="/qanda/qanda_list.jsp";
		s_search.submit;
	}
</Script>
<form name ="pageForm">
	<input type="text" name = "s_nowPage" value = "<%=pageNumber%>">
	<input type="text" name = "s_select" value = "<%=select%>">
	<input type="text" name = "s_search" value = "<%=search%>">
</form>
<form name = "view">
	<input type="text" name="v_no" value="1">
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
				Q & A
			</p>
			<form name="s_search">
			<p class="select_box">
				<select name="s_select">
					<option value="title" <%if(select.equals("title")) out.print("selected"); %>>Title</option>
					<option value="content"<%if(select.equals("content")) out.print("selected"); %>>Content</option>
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
				<%for(int i = 0; i<dtos.size();i++){ %>
					<tr>
						<td><%=Integer.parseInt(dtos.get(i).getNo().substring(1))%></td>
						<%if(dtos.get(i).getPub_pri().equals("private")){%>
						<td class="t_center"><a href="qanda_chk_password.jsp?no=<%=dtos.get(i).getNo()%>"><i class="fa fa-lock"></i><%=dtos.get(i).getTitle()%></a></td>
						<%} else{%>
						<td class="t_center"><a href="qanda_view.jsp?t_no=<%=dtos.get(i).getNo()%>"><%=dtos.get(i).getTitle()%></a></td>
						<%} %>
						<td><img src="../images/clip.png"></td>
						<%if(dtos.get(i).getIs_guest().equals("n")){ %>
						<td><%=dtos.get(i).getReg_info()%></td>
						<%} else{ %>
						<td><%=dtos.get(i).getGuest_id()%></td>
						<%} %>
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
				<a href="qanda_write.jsp" class="write">글쓰기</a>
			</div>
		</div>	
	
		<div id="b_bottom">
			<div class="b_bottom_left">
				<img src="../images/footer_logo_4.jpg">
			</div>
			<div class="b_bottom_center">
				<p>개인정보처리방침  | 개인정보보호정책 | 이용약관 | 협회소개</p>
				우편번호 (26349) 강원 원주시 호저면 우무개로 365 2층, 2호 | 사업자번호 : 209-82-64664<br>
				TEL: 033-747-4012 | FAX: 033-747-4014 | E-mail: korbamtb@daum.net<br>
				COPYRIGHT 2012 KOREA OFF ROAD BIKE ASSOCIATION. ALL RIGHT RESERVED		
			</div>
			<div class="b_bottom_right">
				서울사무소: (02) 4545- 8545<br>
				대전사무소: (042) 5417- 8842<br>
				광주사무소: (052) 4545- 2214<br>
				부산사무소: (048) 4545- 7546
			</div>		
		</div>	
	</div>	
</body>
</html>