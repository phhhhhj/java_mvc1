// DBCP!!
package bean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Connection;

public class NoticeDAO {

	Connection con;
	DBConnectionMgr mgr;

	public NoticeDAO() {
		mgr = DBConnectionMgr.getInstance(); // DBConnectionMgr 싱글톤 객체 주소값 가져오기
	}

	// 하나 검색
	public NoticeDTO select(int selectNo) {
		NoticeDTO dto2 = null;
		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			String sql = "select * from notice where no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, selectNo);
			// System.out.println("3. sql문 결정 ok..");

			// 4) sql문 전송
			ResultSet rs = ps.executeQuery();
			// System.out.println("4. sql문 전송 ok..");

			if (rs.next()) { // 검색 결과가 있는지 체크해주는 메서드
				dto2 = new NoticeDTO();
				// no, title, content, date
				int no = rs.getInt(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String date = rs.getString(4);
				dto2.setNo(no);
				dto2.setTitle(title);
				dto2.setContent(content);
				dto2.setDate(date);
			}

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto2;
	} // select one

	// 전체 검색
	public ArrayList<NoticeDTO> selectAll() {
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			String sql = "select * from notice";
			PreparedStatement ps = con.prepareStatement(sql);
			// System.out.println("3. sql문 결정 ok..");
			
			// 4) sql문 전송
			ResultSet rs = ps.executeQuery();
			// System.out.println("4. sql문 전송 ok..");
			
			while (rs.next()) { // 검색 결과가 있는지 체크해주는 메서드
				// no, title, content, date
				int no = rs.getInt(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String date = rs.getString(4);
				
				NoticeDTO dto = new NoticeDTO();
				dto.setNo(no);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setDate(date);
				
				list.add(dto);
			}
			
			mgr.freeConnection(con, ps);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	} // select all
	
}
