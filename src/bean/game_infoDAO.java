package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class game_infoDAO {

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

	public game_infoDAO() {
		mgr = DBConnectionMgr.getInstance();
	}

	public void insert(game_infoDTO dto) {
		try {
			con = mgr.getConnection();

			String sql = "insert into game_info(gmkey, gyear, gmonth, date, day, stadium, gtime,"
					+ " home_team, home_score, visit_team, visit_score, result) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getGmkey());
			ps.setString(2, dto.getGyear());
			ps.setString(3, dto.getGmonth());
			ps.setString(4, dto.getDate());
			ps.setString(5, dto.getDay());
			ps.setString(6, dto.getStadium());
			ps.setString(7, dto.getGtime());
			ps.setString(8, dto.getHome_team());
			ps.setString(9, dto.getHome_score());
			ps.setString(10, dto.getVisit_team());
			ps.setString(11, dto.getVisit_score());
			ps.setString(12, dto.getResult());

			System.out.println("3. sql문 결정 ok..");

			ps.executeUpdate();
			System.out.println("4. sql문 전송 ok..");

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public game_infoDTO select(game_infoDTO dto) {
		
		game_infoDTO info = null;

		try {
			con = mgr.getConnection();

			String sql = "select * from game_info where gmkey = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getGmkey());

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				info = new game_infoDTO();

				String gmkey = rs.getString(1);
				String gyear = rs.getString(2);
				String gmonth = rs.getString(3);
				String date = rs.getString(4);
				String day = rs.getString(5);
				String stadium = rs.getString(6);
				String gtime = rs.getString(7);
				String home_team = rs.getString(8);
				String home_score = rs.getString(9);
				String visit_team = rs.getString(10);
				String visit_score = rs.getString(11);
				String result = rs.getString(12);
				String weather = rs.getString(13);
				info.setGmkey(gmkey);
				info.setGyear(gyear);;
				info.setGmonth(gmonth);;
				info.setDate(date);
				info.setDay(day);
				info.setStadium(stadium);
				info.setGtime(gtime);
				info.setHome_team(home_team);
				info.setHome_score(home_score);
				info.setVisit_team(visit_team);
				info.setVisit_score(visit_score);
				info.setResult(result);
				info.setWeather(weather);
			}

			mgr.freeConnection(con, ps);
//			System.out.println("정보"+info);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}

	public ArrayList<gamekeyDTO> list() {
		ArrayList<gamekeyDTO> select_key = new ArrayList<>();
		gamekeyDTO dto2 = null;

		try {
			con = mgr.getConnection();

			String sql = "select gmkey from game_info";
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
	
	public ArrayList<game_infoDTO> list_All(game_infoDTO dto) {
		ArrayList<game_infoDTO> select = new ArrayList<>();
		game_infoDTO dto2 = null;

		try {
			con = mgr.getConnection();

			String sql = "select * from game_info where gyear = ? and gmonth = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getGyear());
			ps.setString(2, dto.getGmonth());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				dto2 = new game_infoDTO();
				
				String gmkey = rs.getString(1);
				String gyear = rs.getString(2);
				String gmonth = rs.getString(3);
				String date = rs.getString(4);
				String day = rs.getString(5);
				String stadium = rs.getString(6);
				String gtime = rs.getString(7);
				String home_team = rs.getString(8);
				String home_score = rs.getString(9);
				String visit_team = rs.getString(10);
				String visit_score = rs.getString(11);
				String result = rs.getString(12);
				String weather = rs.getString(13);
				dto2.setGmkey(gmkey);
				dto2.setGyear(gyear);;
				dto2.setGmonth(gmonth);;
				dto2.setDate(date);
				dto2.setDay(day);
				dto2.setStadium(stadium);
				dto2.setGtime(gtime);
				dto2.setHome_team(home_team);
				dto2.setHome_score(home_score);
				dto2.setVisit_team(visit_team);
				dto2.setVisit_score(visit_score);
				dto2.setResult(result);
				dto2.setWeather(weather);
				
				select.add(dto2);
			}

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return select;
	}

	public int update(game_infoDTO dto) {
		int result = 0;
		try {
			con = mgr.getConnection();

			String sql = "update game_info set weather = ? where gmkey = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getWeather());
			ps.setString(2, dto.getGmkey());

			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 ok..");

			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int delete(game_infoDTO dto) {
		int result = 0;
		try {
			con = mgr.getConnection();

			String sql = "delete from game_info where gmkey = ? ";
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
