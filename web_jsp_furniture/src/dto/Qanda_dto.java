package dto;

public class Qanda_dto {
	private String no,title,content,attach,hit,reg_info,reg_date,is_guest,guest_id,guest_pw,pub_pri;

	public Qanda_dto(String no, String title, String content, String attach, String hit, String reg_info,
			String reg_date, String is_guest, String guest_id, String guest_pw, String pub_pri) {
		super();
		this.pub_pri = pub_pri;
		this.no = no;
		this.title = title;
		this.content = content;
		this.attach = attach;
		this.hit = hit;
		this.reg_info = reg_info;
		this.reg_date = reg_date;
		this.is_guest = is_guest;
		this.guest_id = guest_id;
		this.guest_pw = guest_pw;
	}

	public Qanda_dto(String no2, String title2, String content2, String reg_info2, String reg_date2, String is_guest2,
			String guest_id2, String guest_pw2, String pub_pri) {
		super();
		this.pub_pri = pub_pri;
		this.no = no2;
		this.title = title2;
		this.content = content2;
		this.reg_info = reg_info2;
		this.reg_date = reg_date2;
		this.is_guest = is_guest2;
		this.guest_id = guest_id2;
		this.guest_pw = guest_pw2;
	}
	public String getPub_pri() {
		return pub_pri;
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

	public String getIs_guest() {
		return is_guest;
	}

	public String getGuest_id() {
		return guest_id;
	}

	public String getGuest_pw() {
		return guest_pw;
	}
}
