package bean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.swing.JOptionPane;


import java.sql.Connection;

public class BasketDAO {
	Connection con;
	DBConnectionMgr mgr;
	public BasketDAO() {
		mgr = DBConnectionMgr.getInstance();
		}

	
	public void insert(BasketDTO dto) {
	      System.out.println("회원가입 처리하다.");
	      try {
	    	  con = mgr.getConnection();
	         
	    	 String sql = "insert into basket values (?, ?, ?, ?, ?, ?, ?)";
	         PreparedStatement ps = con.prepareStatement(sql);
	         ps.setString(1, null);
	         ps.setString(2, dto.getId());
	         ps.setString(3, dto.getName());
	         ps.setString(4, dto.getSize());
	         ps.setString(5, dto.getCount());
	         ps.setString(6, dto.getPrice());
	         ps.setString(7, dto.getAllprice());

	         System.out.println("3. sql문 결정 ok..");

	         ps.executeUpdate();
	         System.out.println("4. sql문 전송 ok..");
	         ps.close();
	         con.close();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	   }
	
	
	//삭제기능~~~~~~~~~~
	public int delete(int no2) {
		System.out.println("회원탈퇴 처리하다.");
		int result = 0; // 회원탈퇴가 안된다.
		try {
			con = mgr.getConnection();
			//3) sql문 결정
			String sql = "delete from basket where no = ? ";
			PreparedStatement ps = con.prepareStatement(sql);
			System.out.println(ps);
			ps.setInt(1, no2);
			
			System.out.println("3. sql문 결정 ok..");
			
			//4) sql문 전송
			result = ps.executeUpdate(); //delet문 전송하고 실행할때 몇개의 로우값이 실행되는지
			System.out.println("삭제 요청 결과는 " + result);
			System.out.println("4. sql문 전송 ok..");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 전체 검색기능~~~~~~~~~~~~~~~~
	public ArrayList<BasketDTO> list() {
		
		ArrayList<BasketDTO> list = new ArrayList<>();
	      try {
	    	 con = mgr.getConnection();
	         String sql = "select * from basket";
	         PreparedStatement ps = con.prepareStatement(sql);
	         System.out.println("3. sql문 결정 OK");

	         // 4) sql문 전송
	         ResultSet rs = ps.executeQuery();
	         System.out.println("4. sql문 전송 OK");

	         while (rs.next()) {
		            System.out.println("검색 결과가 있어요.");
		            BasketDTO dto2 = new BasketDTO();
		            int no = rs.getInt(1);
		            String id = rs.getString(2);
		            String name = rs.getString(3);
		            String size = rs.getString(4);
		            String count = rs.getString(5);
		            String price = rs.getString(6);
		            String allprice = rs.getString(7);
		            dto2.setNo(no);
		            dto2.setId(id);
		            dto2.setName(name);
		            dto2.setSize(size);
		            dto2.setCount(count);
		            dto2.setPrice(price);
		            dto2.setAllprice(allprice);
		            list.add(dto2);
		         }
	         mgr.freeConnection(con, ps);

	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	   }
	
		
	//수정기능~~~~~~~~~~~~~~~~~~~~
	public void update() {
		System.out.println("회원수정 처리하다.");
		try {
			con = mgr.getConnection();
			//3) sql문 결정
			String id = JOptionPane.showInputDialog("삽입할 id입력");
			String pw = JOptionPane.showInputDialog("삽입할 pw입력");
			String name = JOptionPane.showInputDialog("삽입할 name입력");
			String tel = JOptionPane.showInputDialog("삽입할 tel입력");
			
			String sql = "update product set id = ? where pw = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, name);
			ps.setString(4, tel);
			
			System.out.println("3. sql문 결정 ok..");
			
			//4) sql문 전송
			ps.executeUpdate();
			System.out.println("4. sql문 전송 ok..");
			mgr.freeConnection(con, ps);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	//선택
	public BasketDTO select(BasketDTO dto) { // select

	      BasketDTO list = null;
	      
	      try {
	         con = mgr.getConnection();
	         String sql = "select * from basket";
	         PreparedStatement ps = con.prepareStatement(sql);

	         ResultSet rs = ps.executeQuery();

	         if (rs.next()) {
	            BasketDTO dto2 = new BasketDTO();
	            int no = rs.getInt(1);
	            String id = rs.getString(2);
	            String name = rs.getString(3);
	            String size = rs.getString(4);
	            String count = rs.getString(5);
	            String price = rs.getString(6);
	            String allprice = rs.getString(7);
	            dto2.setNo(no);
	            dto2.setId(id);
	            dto2.setName(name);
	            dto2.setSize(size);
	            dto2.setCount(count);
	            dto2.setPrice(price);
	            dto2.setAllprice(allprice);
	         }
	         mgr.freeConnection(con, ps);

	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	   }
}
