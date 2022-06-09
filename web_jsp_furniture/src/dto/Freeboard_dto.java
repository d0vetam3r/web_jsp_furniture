package dto;

public class Freeboard_dto {
	private String no,title,content,hit,reg_id,reg_date,attach;
	
	public Freeboard_dto(String no, String title, String content, String hit, String reg_id, String reg_date, String attach) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.reg_id = reg_id;
		this.reg_date = reg_date;
		this.attach = attach;

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
	public String getHit() {
		return hit;
	}
	public String getReg_id() {
		return reg_id;
	}
	public String getReg_date() {
		return reg_date;
	}
	public String getAttach() {
		return attach;
	}
}
