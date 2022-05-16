<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*, java.util.*,common.*" %>
<%@ include file="../common_head.jsp" %>
<%
	String no = request.getParameter("no");
	out.print(no);
	Qanda_dao dao = new Qanda_dao();
	String db_password = dao.getDbPw(no);
	String writer = dao.getWriter(no);
	int jaebal = dao.checkJogun(no);
%>
<%
	if(sessionLevel.equals("top") || sessionLevel.equals("manager")){%>
		<script>
		location.href="qanda_view.jsp?t_no=<%=no%>";
		</script>
	<%} else if(jaebal == 1){
			if(writer.equals(sessionId)){ %>
			<script>
			location.href="qanda_view.jsp?t_no=<%=no%>";
			</script>
			<%}else{%>
			<script>
			alert("비공개 게시글은 작성자와 관리자만 볼 수 있습니다.")
			location.href="qanda_list.jsp";
			</script>	
		<%}
	}
		else{%>
	
	
		
<script>
	function goView(no){
		if(chk.pass.value != <%=db_password%>){
			alert("비밀번호가 다릅니다");
			return;
		} else{
			<%session.setAttribute("view_auth", "true");%>
			view.t_no.value=no;
			view.action="qanda_view.jsp";
			view.submit();
		}
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
				비공개 게시글입니다.
			</p>
			<form name="view">
			<input type="hidden" name="t_no">
			</form>
			<form name="chk">
			<div class="buttonGroup" >
			비밀번호 <input type="password" name="pass" >
			<a href="javascript:goView('<%=no%>')" class="butt">Submit</a>
			</div>
			</form>

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
<%}%>