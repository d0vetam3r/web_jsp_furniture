<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*" %>
<%@ include file="../common_head.jsp" %>
<%
	String no = request.getParameter("v_no");
	News_dao dao = new News_dao();
	News_dto dto = dao.getView(no);
%>
<script>
	function goDBUpdate(no, id){
		/**************첨부파일 검사*****************/
		// 확장자 검사
		 
		var fileName = update.u_new_attach.value;
		if(fileName !=""){
			var pathFileName = fileName.lastIndexOf(".")+1;    //확장자 제외한 경로+파일명
			var extension = (fileName.substr(pathFileName)).toLowerCase();	//확장자명
			//파일명.확장자
			//if(extension != "jpg" && extension != "gif" && extension != "png"){
			if(extension != "pdf" && extension != "hwp" && extension != "txt"){
				alert(extension +" 형식 파일은 업로드 안됩니다. 한글, PDF 파일만 가능!");
				return;
			}		
		}
	
		// 첨부 용량 체크	
		var file = update.u_new_attach;
		var fileMaxSize  = 5; // 첨부 최대 용량 설정
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
		
		if(checkValue(update.u_title, "제목을 입력하세요")) return;
		if(checkValue(update.u_content, "내용을 입력하세요")) return;
		if(checkValue(update.u_reg_date, "작성일을 입력하세요")) return;
		update.u_no.value=no;
		update.u_id.value=id;
		update.method="post";
		update.action="db_news_update.jsp";
		update.submit();
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
				NOTICE
			</p>
			
			<form name="update" enctype="multipart/form-data">
			<input type="text" name="u_no" value="1">
			<input type="text" name="u_id" value="1">
			<input type="text" name="u_ori_attach" value="<%=dto.getAttach()%>">
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
						<td colspan="3"><input type="text" name="u_title" class="input600" value="<%=dto.getTitle()%>"></td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3"><textarea class="textArea_H250" name="u_content"><%=dto.getContent()%></textarea></td>
					</tr>	
					<tr>
						<th>Attach</th>
						<td colspan="3">
						<%if(!dto.getAttach().equals("없음")){%>
						<%=dto.getAttach()%> 삭제
						<input type="checkbox" name="u_del_attach" value="<%=dto.getAttach()%>"><br>
						<%} %>
							<input type="file" class="input600" name="u_new_attach">
						</td>
					</tr>	
					<tr>
						<th>Writer</th>
						<td><%=dto.getReg_info()%></td>
						<th>RegDate</th>
						<td><input type="date" name="u_reg_date" value="<%=dto.getReg_date()%>" class="input130"></td>
					</tr>	

				</tbody>
			</table>
			</form>
			<div class="buttonGroup">
				
				<a href="javascript:goDBUpdate('<%=no%>', '<%=dto.getReg_info()%>')" class="butt">Save</a>
				<a href="news_list.jsp" class="butt">List</a>
			</div>	
		</div>	
		<%@ include file="../common_footer.jsp" %>
	</div>	
</body>
</html>
		