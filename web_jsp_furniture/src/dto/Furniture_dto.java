package dto;

public class Furniture_dto {
	public Furniture_dto(String no, String name, String size, String attach, String order, String id, String date) {
		super();
		this.no = no;
		this.name = name;
		this.size = size;
		this.attach = attach;
		this.order = order;
		this.id = id;
		this.date = date;
	}

	private String no, name, size, attach, order, id, date;

	public String getNo() {
		return no;
	}

	public String getName() {
		return name;
	}

	public String getSize() {
		return size;
	}

	public String getAttach() {
		return attach;
	}

	public String getOrder() {
		return order;
	}

	public String getId() {
		return id;
	}

	public String getDate() {
		return date;
	}
}
