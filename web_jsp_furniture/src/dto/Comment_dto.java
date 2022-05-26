package dto;

public class Comment_dto {
	public String no, content, reg_id, reg_date;
	public int reg_order;
	public Comment_dto(String no, int reg_order, String content, String reg_id, String reg_date) {
		super();
		this.no = no;
		this.content = content;
		this.reg_id = reg_id;
		this.reg_date = reg_date;
		this.reg_order = reg_order;
	}
	public String getNo() {
		return no;
	}
	public String getContent() {
		return content;
	}
	public String getReg_id() {
		return reg_id;
	}
	public String getReg_date() {
		return reg_date;
	}
	public int getReg_order() {
		return reg_order;
	}

}
