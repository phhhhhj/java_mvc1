package bean;

public class ProductDTO {
	private int no;
	private String name;
	private String price;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "ProductDTO [no=" + no + ", name=" + name + ", price=" + price + "]";
	}
	
	
	
	
	
	
	
}
