<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*,common.*,com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.*" %>
<%@ include file="../common_head.jsp" %>
<%
	if(!sessionLevel.equals("top")){%>
		<script>
		alert("잘못된 접근입니다.");
		location.href="/index.jsp";
		</script>
	<%} else{
		
		String no = request.getParameter("t_no");
		Furniture_dao dao = new Furniture_dao();
		Furniture_dto dto = dao.getView(no);
	%>


		<div id="b_left">
			<P>MANAGER</P>
			<ul>
				<li><a href="/admin/member_list.jsp"><span class="fnt"></span> NOTICE</a></li>
				<li><a href="/admin/furniture_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span> FURNIture LIST</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				NOTICE
			</p>
			
			<table class="boardForm">
			<form name="furn" enctype="multipart/form-data">
				<input type="hidden" name="t_ori_attach" value="<%=dto.getAttach()%>">
				<input type="hidden" name="t_no" value="<%=dto.getNo()%>">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tbody>
					<tr>
						<th>제품명</th>
						<td colspan="3"><input type="text" size="40" name="t_title" class="input300" value="<%=dto.getName()%>"></td>
					</tr>
					<tr>
						<th>사이즈</th>
						<td colspan="3"><input type="text" size="40" name="t_size" class="input300" value="<%=dto.getSize()%>"></td>
					</tr>
					<tr>
						<th>정렬순서</th>
						<td colspan="3">
						<select name="t_order">
						    <option value="1" <%if(dto.getOrder().equals("1")) out.print("selected");%>>1</option>
						    <option value="2" <%if(dto.getOrder().equals("2")) out.print("selected");%>>2</option>
						    <option value="3" <%if(dto.getOrder().equals("3")) out.print("selected");%>>3</option>
						    <option value="4" <%if(dto.getOrder().equals("4")) out.print("selected");%>>4</option>
						    <option value="5" <%if(dto.getOrder().equals("5")) out.print("selected");%>>5</option>
						    <option value="6" <%if(dto.getOrder().equals("6")) out.print("selected");%>>6</option>
						    <option value="etc" <%if(dto.getOrder().equals("etc")) out.print("selected");%>>제외</option>
						</select>
						</td>
					</tr>
					<tr>
						<th>IMAGE</th>
						<td colspan="3"><input type="file" name="t_attach" class="input600"><%=dto.getAttach()%></td>
					</tr>	
					<tr>
						<th>Writer</th>
						<td><%=sessionName%></td>
						<th>Reg Date</th>
						<td><%=CommonUtil.getToday() %></td>
					</tr>	
				</tbody>
			</form>
			</table>
			<div class="buttonGroup">
				<a href="javascript:goUpdate()" class="butt">수정</a>
				<a href="furniture_list.jsp" class="butt">목록</a>
			</div>	
		</div>	

<%@ include file="../common_footer.jsp" %>
	</div>	
</body>
<script>
	function goUpdate(){
		/**************첨부파일 검사*****************/
		// 확장자 검사
		
		var fileName = furn.t_attach.value;
		if(fileName !=""){
			var pathFileName = fileName.lastIndexOf(".")+1;    //확장자 제외한 경로+파일명
			var extension = (fileName.substr(pathFileName)).toLowerCase();	//확장자명
			//파일명.확장자
			if(extension != "jpg" && extension != "gif" && extension != "png"){
			//if(extension != "pdf" && extension != "hwp" && extension != "txt"){
				alert(extension +" 형식 파일은 업로드 안됩니다. jpg,png,gif 파일만 가능!");
				return;
			}		
		}
	
		// 첨부 용량 체크	
		var file = furn.t_attach;
		var fileMaxSize  = 1; // 첨부 최대 용량 설정
		if(file.value !=""){
			// 사이즈체크
			var maxSize  = 1024 * 1024 * fileMaxSize;  
			var fileSize = 0;

			// 브라우저 확인
			var browser=navigator.appName;
			// 익스플로러일 경우
			if (browser=="Microsoft Internet Explorer"){
				var oas = new ActiveXObject("Scripting.FileSystemObject");
				fileSize = oas.getFile(file.value).size;
			}else {
			// 익스플로러가 아닐경우
				fileSize = file.files[0].size;
			}
			//alert("파일사이즈 : "+ fileSize);

			if(fileSize > maxSize){
				alert(" 첨부파일 사이즈는 "+fileMaxSize+"MB 이내로 등록 가능합니다. ");
				return;
			}	
		}
/**************첨부파일 검사*****************/
		
		if(checkValue(furn.t_title, "제목을 입력하세요")) return;
		if(checkValue(furn.t_size, "사이즈를 입력하세요")) return;
		if(checkValue(furn.t_order, "순서를 입력하세요")) return;
		furn.method="post";
		furn.action="db_furniture_update.jsp";
		furn.submit();
	}
</script>
</html>

<%} %>