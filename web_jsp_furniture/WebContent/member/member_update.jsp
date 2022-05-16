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
	location.href="member_login.jsp";
</script>
<%
	} else{
		dto = dao.getMemberView(sessionId);
%>

<script>
	function goUpdate(){
		if(checkValue(join.t_name, "성명 입력!")) return;
		if(checkValue(join.t_area, "지역 입력!")) return;
		if(checkValue(join.t_address, "주소 입력!")) return;
		if(checkValue(join.t_tel_1, "전화번호 입력!") || checkValue(join.t_tel_2, "전화번호 입력!") || checkValue(join.t_tel_3, "전화번호 입력!")) return;
		if(checkValue(join.t_gender, "성별 선택!")) return;
		if(checkValue(join.t_password_confirm, "비밀번호 확인 입력!")) return;
		
		if(join.t_password.value != join.t_password_confirm.value){
			join.t_password_confirm.select();
			alert("비밀번호가 맞지 않습니다");
			return;
		}
		
		join.method="post";
		join.action="db_member_update.jsp";
		join.submit();
		
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
				MEMBER UPDATE
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
					<%=dto.getId() %>
				  </td>
				</tr>
				<tr>
				  <th><label for="nana">성 명</label></th>
				  <td><input name="t_name" value="<%=dto.getName() %>"  maxlength="10" type="text" size="8" id="nana"></td>
				</tr>
				<tr>
				  <th>지역</th>
				  <td>
					<select name="t_area">
						<option value="서울" <%if(dto.getArea().equals("서울")) out.print("selected"); %>>서울</option>
						<option value="대전" <%if(dto.getArea().equals("대전")) out.print("selected"); %>>대전</option>
						<option value="부산" <%if(dto.getArea().equals("부산")) out.print("selected"); %>>부산</option>
						<option value="대구" <%if(dto.getArea().equals("대구")) out.print("selected"); %>>대구</option>        
					</select>	  
				  </td>
				</tr>	
				
				<tr>
				  <th>주소</th>
				  <td><input name="t_address" maxlength="50" type="text" size="40" value="<%=dto.getAddress()%>"></td>
				</tr>
				<tr>
				  <th>연락처</th>
				  <td>
					<input name="t_tel_1" maxlength="3" type="text" size="2" value="<%=dto.getTel_1()%>"> -
					<input name="t_tel_2" maxlength="4" type="text" size="3" value="<%=dto.getTel_2()%>"> -
					<input name="t_tel_3" maxlength="4" type="text" size="3" value="<%=dto.getTel_3()%>">
				  </td>
				</tr>
				<tr>
				  <th>남여구분</th>
				  <td>
					  <input type="radio" value="f" name="t_gender"  <%if(dto.getGen().equals("f")) out.print("checked");%> class="middleCheck" /> 여&nbsp;&nbsp;        
					  <input type="radio" value="m" name="t_gender"  <%if(dto.getGen().equals("m")) out.print("checked");%> class="middleCheck" /> 남        
				  </td>
				</tr>
				<tr>
				  <th>취미</th>
				  <td>
					  <input type="checkbox" value="y" name="t_hobby_travel"  <%if(dto.getHobby_traval().equals("y")) out.print("checked");%> class="middleCheck" /> 여행&nbsp;&nbsp; 
					  <input type="checkbox" value="y" name="t_hobby_reading" <%if(dto.getHobby_reading().equals("y")) out.print("checked");%> class="middleCheck" /> 독서&nbsp;&nbsp; 
					  <input type="checkbox" value="y" name="t_hobby_sports" <%if(dto.getHobby_sports().equals("y")) out.print("checked");%> class="middleCheck" /> 운동
				  </td>
				</tr>
				<tr>
				  <th>비밀번호확인</th>
				  <td>
				  <input name="t_password_confirm" maxlength="10" type="text" size="13">
				  <input name="t_password" maxlength="10" type="hidden" value="<%=dto.getPassword() %>" size="13">
				  </td>
				  
				</tr>
			  </tbody>
			</table>
			
			
			</form>
			
			
			<div class="buttonGroup_center">
				<a href="javascript:goUpdate()" class="butt">UPDATE</a>
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




