package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

//db처리 전담 클래스
public class ProductDAO {
	Connection con;
	DBConnectionMgr mgr;
	
	
	public ProductDAO() {
	mgr = DBConnectionMgr.getInstance();
	}

	
	public ProductDTO select(int no) throws Exception {
		con = mgr.getConnection();
		// 3.SQL문 결정/생성
		String sql = "select name, price from product where no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		System.out.println("3.ok----------");

		// 4.DB로 SQL문 전송
		ResultSet rs = ps.executeQuery();
		System.out.println("4.ok----------");
		ProductDTO dto2 = null;
		
		while (rs.next()) { 
			//결과로 가지고 온 테이블의 행을 한줄씩 내려가서 있는지 체크
			String name = rs.getString(1);
			String price = rs.getString(2);
			
			//dao java코드 <--- db table
			//table의 결과값 행 1개당(rdb,관계형 db) 
			//dto 1개로 mapping(object)
			//ORM
			//변수의 선언의 위치가 변수의 생존범위!
			dto2 = new ProductDTO();
			dto2.setName(name);
			dto2.setPrice(price);
			
		}
		
		return dto2;
	}
	public ArrayList<ProductDTO> list() throws Exception {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		con = mgr.getConnection();
		
		// 3.SQL문 결정/생성
		String sql = "select * from product";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("3.ok----------");
		
		// 4.DB로 SQL문 전송
		ResultSet rs = ps.executeQuery();
		System.out.println("4.ok----------");
		while (rs.next()) { 
			//결과로 가지고 온 테이블의 행을 한줄씩 내려가서 있는지 체크
			String no = rs.getString(1); //id 컬럼
			String name = rs.getString(2);
			String price = rs.getString(3);
			
			//dao java코드 <--- db table
			//table의 결과값 행 1개당(rdb,관계형 db) 
			//dto 1개로 mapping(object)
			//ORM
			ProductDTO dto = new ProductDTO();
			dto.setName(name);
			dto.setPrice(price);
			
			list.add(dto);
		}
		
		return list;
	}

	
}

