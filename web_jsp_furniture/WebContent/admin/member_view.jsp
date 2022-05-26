<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*, dto.*" %>
<%@ include file="../common_head.jsp" %>

<%
	Member_dao dao = new Member_dao();
	Member_dto dto = null;
	
	if(sessionId.equals("")){
%>
<script>
	alert("세션정보가 만료되었습니다.");
	location.href="/member/member_login.jsp";
</script>
<%
	} else{
		String id = request.getParameter("t_id");
		dto = dao.viewMember(id);%>
	

<script>
	function goLevelUpdate(){
		mem.t_id.value="<%=id%>";
		mem.method="post";
		mem.action="db_member_level_update.jsp";
		mem.submit();
	}
</script>

	
		<div id="b_left">
			<P>MEMBER</P>
			<ul>
				<li><a>My Info</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				My Info
			</p>
			
			
			<form name="mem">
			
			
			<table class="boardForm">
			  <colgroup>
				<col width="200" />
				<col width="500" />
			  </colgroup>
			  <tbody>
				<tr>
				  <th><label for="id">I D</label></th>
				  <td>
				  <%=dto.getId()%>
				  </td>
				</tr>
				<tr>
				  <th><label for="nana">성 명</label></th>
				  <td><%=dto.getName()%></td>
				</tr>
				<tr>
				  <th>비빌번호</th>
				  <td></td>
				</tr>
				<tr>
				  <th>비밀번호확인</th>
				  <td></td>
				</tr>
				<tr>
				  <th>지역</th>
				  <td>
				  <%=dto.getArea()%> 
				  </td>
				</tr>	
				
				<tr>
				  <th>주소</th>
				  <td><%=dto.getAddress()%></td>
				</tr>
				<tr>
				  <th>연락처</th>
				  <td>
				  <%=dto.getTel_1()%> - <%=dto.getTel_2()%> - <%=dto.getTel_3()%>
				  </td>
				</tr>
				<tr>
				  <th>남여구분</th>
				  <td>
				  <%
				  if(dto.getGen().equals("m")){
				  		out.print("남");
				  } else {
						out.print("여");
				  }%>
				  </td>
				</tr>
				<tr>
				  <th>취미</th>
				  <td>
					<% if(dto.getHobby_reading().equals("y")) out.print("독서"); %> 
					<% if(dto.getHobby_sports().equals("y")) out.print("운동"); %> 
					<% if(dto.getHobby_traval().equals("y")) out.print("여행"); %>
					
				  </td>
				</tr>
				<tr>
				  <th>가입일</th>
				  <td>
					<%=dto.getReg_date()%>
				  </td>
				</tr>
				<%if(dto.getExit_gubun().equals("회원")){ %>
				<tr>
				  <th>권한</th>
				  <td>
				  	<select name="t_level">
				  		<option value="member" <%if(dto.getLevel_gubun().equals("회원")) out.print("selected");%>>회원</option>
				  		<option value="manager" <%if(dto.getLevel_gubun().equals("직원")) out.print("selected");%>>직원</option>
				  		<option value="top" <%if(dto.getLevel_gubun().equals("관리자")) out.print("selected");%>>관리자</option>
				  	</select>
					<input type="button" onclick="goLevelUpdate()" value="권한수정">
				  </td>
				</tr>
				<%} %>
				<tr>
				  <th>탈퇴여부</th>
				  <td>
					<%=dto.getExit_gubun()%>
				  </td>
				</tr>
				<tr>
				  <th>탈퇴일</th>
				  <td>
					<%=dto.getExit_date()%>
				  </td>
				</tr>
			  </tbody>
			</table>
			
			<input type="hidden" name="t_id" value="1">
			</form>
			
			
			<div class="buttonGroup_center">
				<a href="javascript:history.back()" class="butt">이전</a>
		<!--  
				<input type="button" onclick="goJoin()" value="회원가입">
				<input type="button" onclick="location.href='member_login.jsp'" value="로그인">
		 -->
			</div>	
		</div>	

<%@ include file="../common_footer.jsp" %>
	</div>	
</body>
</html>
<%}%>





