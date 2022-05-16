package dto;

public class News_dto {//reg_info id, 작성자이름 들어가는 칼럼
	private String no,title,content,attach,hit,reg_info,reg_date;
	
	public News_dto(String no, String title, String content, String attach, String hit, String reg_info,
			String reg_date) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.attach = attach;
		this.hit = hit;
		this.reg_info = reg_info;
		this.reg_date = reg_date;
	}
	
	public String getNo() {
		return no;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getAttach() {
		return attach;
	}
	public String getHit() {
		return hit;
	}
	public String getReg_info() {
		return reg_info;
	}
	public String getReg_date() {
		return reg_date;
	}

}
