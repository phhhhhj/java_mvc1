package bean;

public class BasketDTO {
	private int no;
	private String id;
	private String name;
	private String size;
	private String count;
	private String price;
	private String allprice;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getAllprice() {
		return allprice;
	}
	public void setAllprice(String allprice) {
		this.allprice = allprice;
	}
	@Override
	public String toString() {
		return "BasketDTO [no=" + no + ", id=" + id + ", name=" + name + ", size=" + size + ", count=" + count
				+ ", price=" + price + ", allprice=" + allprice + "]";
	}
	
}