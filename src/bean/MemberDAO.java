// DBCP!!
package bean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import bean.MemberDTO;
import java.sql.Connection;

public class MemberDAO {

	Connection con;
	DBConnectionMgr mgr;

	public MemberDAO() {
		mgr = DBConnectionMgr.getInstance(); // DBConnectionMgr 싱글톤 객체 주소값 가져오기
	}

	// id 중복 체크
	public int idCheck(String id) {
		int result = 0;

		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			String sql = "select id from member where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			// System.out.println("3. sql문 결정 ok..");

			// 4) sql문 전송
			ResultSet rs = ps.executeQuery();
			// System.out.println("4. sql문 전송 ok..");

			if (rs.next()) { // 검색 결과가 있는지 체크해주는 메서드
				result = 1; // 일치하는 id 있으면 1 반환, 없으면 0 반환, 0이어야 회원가입 가능!
			}

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	} // idCheck

	// 회원가입
	public int insert(MemberDTO dto) {
		int result = 0;

		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			// id, pw, name, tel, address, birth, gender
			String sql = "insert into member values (?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getTel());
			ps.setString(5, dto.getAddress());
			ps.setString(6, dto.getBirth());
			ps.setString(7, dto.getGender());
			// System.out.println("3. sql문 결정 OK");

			// 4) sql문 전송
			result = ps.executeUpdate();
			// System.out.println("4. sql문 전송 OK");

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	} // insert

	// id, pw로 로그인 체크
	public int loginCheck(MemberDTO dto) {
		int result = 0;

		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			String sql = "select id from member where id = ? and pw = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			// System.out.println("3. sql문 결정 ok..");

			// 4) sql문 전송
			ResultSet rs = ps.executeQuery();
			// System.out.println("4. sql문 전송 ok..");

			if (rs.next()) { // 검색 결과가 있는지 체크해주는 메서드
				result = 1; // 일치하는 id , pw 있으면 1 반환, 없으면 0 반환
			}

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	} // loginCheck

	// id로 회원탈퇴
	public int delete(MemberDTO dto) {
		int result = 0; // 반환값이 0 => 삭제가 안 된 경우
		try {
			con = mgr.getConnection();

			// 3) sql문 결정
			String sql = "delete from member where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			// System.out.println("3. sql문 결정 OK");

			// 4) sql문 전송
			result = ps.executeUpdate(); // 삭제된 행의 개수 반환
			// PK인 id 조건으로 일치하면 삭제할 것이기 때문에 삭제가 진행될 경우 항상 1 반환
			// System.out.println("4. sql문 전송 OK");

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	} // delete

	// id로 회원검색
	public MemberDTO select(String inputId) {
		MemberDTO dto2 = null;
		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			String sql = "select * from member where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, inputId);
			// System.out.println("3. sql문 결정 ok..");

			// 4) sql문 전송
			ResultSet rs = ps.executeQuery();
			// System.out.println("4. sql문 전송 ok..");

			if (rs.next()) { // 검색 결과가 있는지 체크해주는 메서드
				dto2 = new MemberDTO();
				// id, pw, name, tel, address, birth, gender
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String tel = rs.getString(4);
				String address = rs.getString(5);
				String birth = rs.getString(6);
				String gender = rs.getString(7);
				dto2.setId(id);
				dto2.setPw(pw);
				dto2.setName(name);
				dto2.setTel(tel);
				dto2.setAddress(address);
				dto2.setBirth(birth);
				dto2.setGender(gender);
			}

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto2;
	} // select

	// id로 회원정보수정
	public int update(MemberDTO dto) {
		// id, pw, name, tel, address, birth, gender 중
		// pw, tel, address, gender만 수정 가능

		int result = 0; // 수정 안된 경우 0 반환
		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			String sql = "update member set pw = ?, tel = ?, address =?, gender = ? where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPw());
			ps.setString(2, dto.getTel());
			ps.setString(3, dto.getAddress());
			ps.setString(4, dto.getGender());
			ps.setString(5, dto.getId());

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
