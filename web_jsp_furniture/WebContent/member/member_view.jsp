<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*, dto.*,common.*" %>
<%@ include file="../common_head.jsp" %>

<%
	Member_dao dao = new Member_dao();
	Member_dto dto = null;
	
	if(sessionId.equals("")){
%>
<script>
	alert("세션정보가 만료되었습니다.");
	location.href="member_login.jsp";
</script>
<%
	} else{
		dto = dao.getMemberView(sessionId);%>
<script>
	function goUpdateForm(){
		location.href="member_update.jsp";
	}
	
	function goExit(){
		if(confirm("정말 탈퇴 하겠습니까?")){
			let pw = prompt("비밀번호를 입력하시오");
			if(pw === "<%=dto.getPassword()%>"){
				join.method="post";
				join.action="db_member_exit.jsp";
				join.submit();
			}else{
				alert("비밀번호가 다릅니다");
			}
		} else{
			return;
		}
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
			
			
			<form name="join">
			<input type="hidden" name="t_id" value="<%=dto.getId()%>">
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
				  <td><%=CommonUtil.printAsterisk(dto.getPw_length())%></td>
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
			  </tbody>
			</table>
			</form>
			
			
			<div class="buttonGroup_center">
				<a href="javascript:goUpdateForm()" class="butt">정보수정</a>
				<a href="javascript:goExit()" class="butt">회원탈퇴</a>
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





