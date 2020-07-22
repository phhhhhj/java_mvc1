package bean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Connection;

public class game_detailDAO {

	public String NVL(Object text) {
		if (text == null) {
			return "";
		} else {
			return text.toString();
		}
	}
// 커넥션 설정
//	public void connect() {
//		System.out.println("DB연결 처리하다.");
//		try {
//			// 1) 커넥터 설정
//			Class.forName("com.mysql.jdbc.Driver");
//			System.out.println("1. 커넥터 설정 ok..");
//
//			// 2) db연결
//			DriverManager.getConnection(url, user, password);
//			System.out.println("2. db연결 ok..");
//
//			// 3) sql문 결정
//			// 4) sql문 전송
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

	Connection con;
	DBConnectionMgr mgr;

	public game_detailDAO() {
		mgr = DBConnectionMgr.getInstance();
	}

	public void insert(gamekeyDTO dto_key) {
		try {
			con = mgr.getConnection();

			String sql = "insert into game_detail (gmkey) values (?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto_key.getGmkey());

			System.out.println("3. sql문 결정 ok..");

			ps.executeUpdate();
			System.out.println("4. sql문 전송 ok..");

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public game_detailDTO select(game_detailDTO dto) {

		game_detailDTO record = null;

		try {
			con = mgr.getConnection();

			String sql = "select * from game_detail where gmkey = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getGmkey());

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				record = new game_detailDTO();

				String gmkey = rs.getString(1);
				String home_team = rs.getString(2);
				String home_inning1 = NVL(rs.getString(3));
				String home_inning2 = NVL(rs.getString(4));
				String home_inning3 = NVL(rs.getString(5));
				String home_inning4 = NVL(rs.getString(6));
				String home_inning5 = NVL(rs.getString(7));
				String home_inning6 = NVL(rs.getString(8));
				String home_inning7 = NVL(rs.getString(9));
				String home_inning8 = NVL(rs.getString(10));
				String home_inning9 = NVL(rs.getString(11));
				String home_inning10 = NVL(rs.getString(12));
				String home_inning11 = NVL(rs.getString(13));
				String home_inning12 = NVL(rs.getString(14));
				String visit_team = rs.getString(15);
				String visit_inning1 = NVL(rs.getString(16));
				String visit_inning2 = NVL(rs.getString(17));
				String visit_inning3 = NVL(rs.getString(18));
				String visit_inning4 = NVL(rs.getString(19));
				String visit_inning5 = NVL(rs.getString(20));
				String visit_inning6 = NVL(rs.getString(21));
				String visit_inning7 = NVL(rs.getString(22));
				String visit_inning8 = NVL(rs.getString(23));
				String visit_inning9 = NVL(rs.getString(24));
				String visit_inning10 = NVL(rs.getString(25));
				String visit_inning11 = NVL(rs.getString(26));
				String visit_inning12 = NVL(rs.getString(27));
				record.setGmkey(gmkey);
				record.setHome_team(home_team);
				record.setHome_inning1(home_inning1);
				record.setHome_inning2(home_inning2);
				record.setHome_inning3(home_inning3);
				record.setHome_inning4(home_inning4);
				record.setHome_inning5(home_inning5);
				record.setHome_inning6(home_inning6);
				record.setHome_inning7(home_inning7);
				record.setHome_inning8(home_inning8);
				record.setHome_inning9(home_inning9);
				record.setHome_inning10(home_inning10);
				record.setHome_inning11(home_inning11);
				record.setHome_inning12(home_inning12);
				record.setVisit_team(visit_team);
				record.setVisit_inning1(visit_inning1);
				record.setVisit_inning2(visit_inning2);
				record.setVisit_inning3(visit_inning3);
				record.setVisit_inning4(visit_inning4);
				record.setVisit_inning5(visit_inning5);
				record.setVisit_inning6(visit_inning6);
				record.setVisit_inning7(visit_inning7);
				record.setVisit_inning8(visit_inning8);
				record.setVisit_inning9(visit_inning9);
				record.setVisit_inning10(visit_inning10);
				record.setVisit_inning11(visit_inning11);
				record.setVisit_inning12(visit_inning12);

			}

			mgr.freeConnection(con, ps);
//			System.out.println("기록"+record);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return record;
	}

	public ArrayList<gamekeyDTO> list() {
		ArrayList<gamekeyDTO> select_key = new ArrayList<>();
		gamekeyDTO dto2 = null;

		try {
			con = mgr.getConnection();

			String sql = "select gmkey from game_detail";
			PreparedStatement ps = con.prepareStatement(sql);
			System.out.println("3. sql문 결정 OK");

			ResultSet rs = ps.executeQuery();
			System.out.println("4. sql문 전송 OK");

			while (rs.next()) {
				dto2 = new gamekeyDTO();
				String gmkey = rs.getString(1);
//				System.out.println(gmkey);
				dto2.setGmkey(gmkey);
				select_key.add(dto2);
			}

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return select_key;
	}

	public int update_home(game_detailDTO dto) {
		int result = 0;
		try {
			con = mgr.getConnection();

			String sql = "update game_detail set home_team = ?" + ", home_inning1 = ?, home_inning2 = ?"
					+ ", home_inning3 = ?, home_inning4 = ?" + ", home_inning5 = ?, home_inning6 = ?"
					+ ", home_inning7 = ?, home_inning8 = ?" + ", home_inning9 = ?, home_inning10 = ?"
					+ ", home_inning11 = ?, home_inning12 = ? where gmkey = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getHome_team());
			ps.setString(2, dto.getHome_inning1());
			ps.setString(3, dto.getHome_inning2());
			ps.setString(4, dto.getHome_inning3());
			ps.setString(5, dto.getHome_inning4());
			ps.setString(6, dto.getHome_inning5());
			ps.setString(7, dto.getHome_inning6());
			ps.setString(8, dto.getHome_inning7());
			ps.setString(9, dto.getHome_inning8());
			ps.setString(10, dto.getHome_inning9());
			ps.setString(11, dto.getHome_inning10());
			ps.setString(12, dto.getHome_inning11());
			ps.setString(13, dto.getHome_inning12());
			ps.setString(14, dto.getGmkey());

			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 ok..");

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int update_visit(game_detailDTO dto) {
		int result = 0;
		try {
			con = mgr.getConnection();

			String sql = "update game_detail set visit_team = ?" + ", visit_inning1 = ?, visit_inning2 = ?"
					+ ", visit_inning3 = ?, visit_inning4 = ?" + ", visit_inning5 = ?, visit_inning6 = ?"
					+ ", visit_inning7 = ?, visit_inning8 = ?" + ", visit_inning9 = ?, visit_inning10 = ?"
					+ ", visit_inning11 = ?, visit_inning12 = ? where gmkey = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getVisit_team());
			ps.setString(2, dto.getVisit_inning1());
			ps.setString(3, dto.getVisit_inning2());
			ps.setString(4, dto.getVisit_inning3());
			ps.setString(5, dto.getVisit_inning4());
			ps.setString(6, dto.getVisit_inning5());
			ps.setString(7, dto.getVisit_inning6());
			ps.setString(8, dto.getVisit_inning7());
			ps.setString(9, dto.getVisit_inning8());
			ps.setString(10, dto.getVisit_inning9());
			ps.setString(11, dto.getVisit_inning10());
			ps.setString(12, dto.getVisit_inning11());
			ps.setString(13, dto.getVisit_inning12());
			ps.setString(14, dto.getGmkey());

			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 ok..");

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int delete(game_detailDTO dto) {
		int result = 0;
		try {
			con = mgr.getConnection();

			String sql = "delete from * where gmkey = ? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getGmkey());

			result = ps.executeUpdate();
			System.out.println("삭제 요청 결과는 " + result);

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
