package model;

public class Publisher {
    String id;
	String name;
	
	
	public Publisher(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name.replace("\n", "").replace("\r", "");
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Publisher [id=" + id + ", name=" + name + "]";
	}
	
	
}
