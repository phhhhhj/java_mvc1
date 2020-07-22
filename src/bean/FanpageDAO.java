// DBCP!!
package bean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Connection;

public class FanpageDAO {

	Connection con;
	DBConnectionMgr mgr;

	public FanpageDAO() {
		mgr = DBConnectionMgr.getInstance(); // DBConnectionMgr 싱글톤 객체 주소값 가져오기
	}

	// 추가
	public void insert(FanpageDTO dto) {
		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			// no, title, content, writer, date
			String sql = "insert into fanpage values (?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, null);
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.setString(4, dto.getWriter());
			ps.setString(5, dto.getDate());
			// System.out.println("3. sql문 결정 OK");

			// 4) sql문 전송
			ps.executeUpdate();
			// System.out.println("4. sql문 전송 OK");

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
	} // insert

	// 삭제
	public int delete(int selectNo) {
		int result = 0; // 반환값이 0 => 삭제가 안 된 경우
		try {
			con = mgr.getConnection();

			// 3) sql문 결정
			String sql = "delete from fanpage where no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, selectNo);
			// System.out.println("3. sql문 결정 OK");

			// 4) sql문 전송
			result = ps.executeUpdate(); // 삭제된 행의 개수 반환
			// PK인 no 조건으로 일치하면 삭제할 것이기 때문에 삭제가 진행될 경우 항상 1 반환
			// System.out.println("4. sql문 전송 OK");

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	} // delete

	// 하나 검색
	public FanpageDTO select(int selectNo) {
		FanpageDTO dto2 = null;
		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			String sql = "select * from fanpage where no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, selectNo);
			// System.out.println("3. sql문 결정 ok..");

			// 4) sql문 전송
			ResultSet rs = ps.executeQuery();
			// System.out.println("4. sql문 전송 ok..");

			if (rs.next()) { // 검색 결과가 있는지 체크해주는 메서드
				dto2 = new FanpageDTO();
				// no, title, content, date
				int no = rs.getInt(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String writer = rs.getString(4);
				String date = rs.getString(5);
				dto2.setNo(no);
				dto2.setTitle(title);
				dto2.setContent(content);
				dto2.setWriter(writer);
				dto2.setDate(date);
			}

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto2;
	} // select one

	// 전체 검색
	public ArrayList<FanpageDTO> selectAll() {
		ArrayList<FanpageDTO> list = new ArrayList<FanpageDTO>();
		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			String sql = "select * from fanpage";
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
				String writer = rs.getString(4);
				String date = rs.getString(5);
				
				FanpageDTO dto = new FanpageDTO();
				dto.setNo(no);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setWriter(writer);
				dto.setDate(date);
				
				list.add(dto);
			}
			
			mgr.freeConnection(con, ps);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	} // select all
	
	// 수정
	public int update(FanpageDTO dto) {
		int result = 0; // 수정 안된 경우 0 반환
		try {
			con = mgr.getConnection();
			// no, title, content, writer, date
			// title, content만 수정 가능
			// 3) sql문 결정
			String sql = "update fanpage set title = ?, content = ? where no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setInt(3, dto.getNo());

			// 4) sql문 전송
			result = ps.executeUpdate(); // 수정된 행의 개수 반환
			// System.out.println("4. sql문 전송 ok..");

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	} // update
}
