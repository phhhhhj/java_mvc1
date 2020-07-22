// DBCP!!
package bean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Connection;

public class ReplyDAO {

	Connection con;
	DBConnectionMgr mgr;

	public ReplyDAO() {
		mgr = DBConnectionMgr.getInstance(); // DBConnectionMgr 싱글톤 객체 주소값 가져오기
	}

	// 추가
	public void insert(ReplyDTO dto) {
		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			// no, bbsno, content, writer, date
			String sql = "insert into reply values (?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, null);
			ps.setInt(2, dto.getBbsno());
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
			String sql = "delete from reply where no = ?";
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

	// 전체 검색 -> bbsno에 해당하는 것만 전체 검색
	public ArrayList<ReplyDTO> selectAll(int selectno) {
		ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			String sql = "select * from reply where bbsno = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, selectno);
			// System.out.println("3. sql문 결정 ok..");
			
			// 4) sql문 전송
			ResultSet rs = ps.executeQuery();
			// System.out.println("4. sql문 전송 ok..");
			
			while (rs.next()) { // 검색 결과가 있는지 체크해주는 메서드
				// no, bbsno, content, date
				int no = rs.getInt(1);
				int bbsno = rs.getInt(2);
				String content = rs.getString(3);
				String writer = rs.getString(4);
				String date = rs.getString(5);
				
				ReplyDTO dto = new ReplyDTO();
				dto.setNo(no);
				dto.setBbsno(bbsno);
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
	public int update(ReplyDTO dto) {
		int result = 0; // 수정 안된 경우 0 반환
		try {
			con = mgr.getConnection();
			// no, bbsno, content, writer, date
			// content만 수정 가능
			// 3) sql문 결정
			String sql = "update reply set content = ? where no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getContent());
			ps.setInt(2, dto.getNo());

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
