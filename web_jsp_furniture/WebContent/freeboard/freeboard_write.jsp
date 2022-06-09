<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*" %>
<%@ include file="../common_head.jsp" %>
<%
	if(sessionId.equals("")){
%>
<script>
	alert("로그인 후 이용 가능합니다.")
	location.href="/freeboard/freeboard_list.jsp"
</script>
<%
	}else{
%>
<script>
function goSave(){
	/**************첨부파일 검사*****************/
	// 확장자 검사
	
	var fileName = fb.t_attach.value;
	if(fileName !=""){
		var pathFileName = fileName.lastIndexOf(".")+1;    //확장자 제외한 경로+파일명
		var extension = (fileName.substr(pathFileName)).toLowerCase();	//확장자명
		//파일명.확장자
		if(extension != "jpg" && extension != "gif" && extension != "png"){
		//if(extension != "pdf" && extension != "hwp" && extension != "txt"){
			alert(extension +" 형식 파일은 업로드 안됩니다. JPG, GIF,PNG 파일만 가능!");
			return;
		}		
	}

	// 첨부 용량 체크	
	var file = fb.t_attach;
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
	
	
	if(checkValue(fb.t_title, "제목 입력!")) return;
	if(checkValue(fb.t_content, "내용 입력!")) return;
	if(checkValue(fb.t_date, "날짜 입력!")) return;
	fb.method="post";
	fb.action="db_freeboard_save.jsp";
	fb.submit();
}
</script>
		<div id="b_left">
			<P>NOTICE & NEWS</P>
			<ul>
				<li><a href="notice_list.html"><span class="fnt"><i class="fas fa-apple-alt"></i></span> NOTICE</a></li>
				<li><a href="">NEWS</a></li>
				<li><a href="">Q & A</a></li>
				<li><a href="">FREE BOARD</a></li>
				<li><a href="">ETC</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				FREE BOARD
			</p>
			
			<table class="boardForm">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<form name="fb" enctype="multipart/form-data">
				<tbody>
					<tr>
						<th>Title</th>
						<td colspan="3"><input type="text" name="t_title" class="input600"></td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3"><textarea name="t_content" class="textArea_H250"></textarea></td>
					</tr>	
					<tr>
						<th>Attach</th>
						<td colspan="3"><input type="file" name="t_attach" class="input600"></td>
					</tr>	
					<tr>
						<th>Writer</th>
						<td><%=sessionName%></td>
						<th>RegDate</th>
						<td><input type="date" class="input130" name="t_date" value="<%=CommonUtil.getToday()%>"></td>
					</tr>	
				</tbody>
				</form>
			</table>
			<div class="buttonGroup">
				<a href="javascript:goSave()" class="butt">Save</a>
				<a href="notice_list.html" class="butt">List</a>
			</div>	
		</div>	
		<%@ include file="../common_footer.jsp" %>
	</div>	
</body>
</html>
<%} %>

		