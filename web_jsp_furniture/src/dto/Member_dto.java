package dto;

public class Member_dto {
	private String id, name, password, area, address, tel_1, tel_2, tel_3, gen, hobby_traval, hobby_reading, hobby_sports, reg_date, level_gubun, exit_gubun, exit_date;

	public Member_dto(String id, String name, String password, String area, String address, String tel_1,
			String tel_2, String tel_3, String gen, String hobby_traval, String hobby_reading, String hobby_sports,
			String reg_date, String level_gubun, String exit_gubun, String exit_date) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.area = area;
		this.address = address;
		this.tel_1 = tel_1;
		this.tel_2 = tel_2;
		this.tel_3 = tel_3;
		this.gen = gen;
		this.hobby_traval = hobby_traval;
		this.hobby_reading = hobby_reading;
		this.hobby_sports = hobby_sports;
		this.reg_date = reg_date;
		this.level_gubun = level_gubun;
		this.exit_gubun = exit_gubun;
		this.exit_date = exit_date;
	}
	public Member_dto(String name2, String level_gubun2) {
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getPassword() {
		return password;
	}
	public String getArea() {
		return area;
	}
	public String getAddress() {
		return address;
	}
	public String getTel_1() {
		return tel_1;
	}
	public String getTel_2() {
		return tel_2;
	}
	public String getTel_3() {
		return tel_3;
	}
	public String getGen() {
		return gen;
	}
	public String getHobby_traval() {
		return hobby_traval;
	}
	public String getHobby_reading() {
		return hobby_reading;
	}
	public String getHobby_sports() {
		return hobby_sports;
	}
	public String getReg_date() {
		return reg_date;
	}
	public String getLevel_gubun() {
		return level_gubun;
	}
	public String getExit_gubun() {
		return exit_gubun;
	}
	public String getExit_date() {
		return exit_date;
	}
}
