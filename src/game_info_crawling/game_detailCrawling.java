package game_info_crawling;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import bean.game_detailDAO;
import bean.game_detailDTO;
import bean.game_infoDAO;
import bean.gamekeyDTO;

public class game_detailCrawling { // inning score

	public static void main(String[] args) {

		game_infoDAO dao = new game_infoDAO();
		ArrayList<gamekeyDTO> gamekey = dao.list();
//		System.out.println(gamekey); // 경기 키값 리스트

		try {
			for (int i = 0; i < gamekey.size(); i++) {

				String url = "https://www.lgtwins.com/service/ajax.ncd?actID=BR_RetrieveGameBoxScore&baRq=IN_DS&baRs=OUT_DS,OUT_DS2&baRsSel=OUT_DS,OUT_DS2&IN_DS.GMKEY="
						+ gamekey.get(i);
				Connection con = Jsoup.connect(url);
				con.header("origin",
						"https://www.lgtwins.com/service/ajax.ncd?actID=BR_RetrieveGameBoxScore&baRq=IN_DS&baRs=OUT_DS,OUT_DS2&baRsSel=OUT_DS,OUT_DS2&IN_DS.GMKEY="
								+ gamekey.get(i))
						.header("referer",
								"https://www.lgtwins.com/service/ajax.ncd?actID=BR_RetrieveGameBoxScore&baRq=IN_DS&baRs=OUT_DS,OUT_DS2&baRsSel=OUT_DS,OUT_DS2&IN_DS.GMKEY="
										+ gamekey.get(i))
						.ignoreContentType(true).get();

				Document doc = con.get();
				String docu = doc.text();
				
				game_detailDTO dto = new game_detailDTO();

				JSONParser jsonParse = new JSONParser();
				JSONObject jsonObj = (JSONObject) jsonParse.parse(docu);
				JSONArray OUT_DS2Array = (JSONArray) jsonObj.get("OUT_DS2"); // visit_score
				ArrayList<String> visit_score_array = new ArrayList<String>();
				String visit_team = null;
				for (int j = 0; j < OUT_DS2Array.size(); j++) {
					JSONObject gmkeyArray = (JSONObject) OUT_DS2Array.get(j);

					String score = (String) (gmkeyArray.get("SCORE"));
					visit_score_array.add(score);
					visit_team = (String) gmkeyArray.get("VISIT_TEAM");
					
				}
//				System.out.println(gamekey.get(i));
//				System.out.println(visit_team + visit_score_array);
				
				String key = gamekey.get(i).toString();
				dto.setGmkey(key);
//				System.out.println(key);
				
				game_detailDAO dao_detail = new game_detailDAO();
				
				dto.setVisit_team(visit_team);
				if (visit_score_array.size() == 1) {
					dto.setVisit_inning1(visit_score_array.get(0));
				} else if (visit_score_array.size() == 2) {
					dto.setVisit_inning1(visit_score_array.get(0));
					dto.setVisit_inning2(visit_score_array.get(1));
				} else if (visit_score_array.size() == 3) {
					dto.setVisit_inning1(visit_score_array.get(0));
					dto.setVisit_inning2(visit_score_array.get(1));
					dto.setVisit_inning3(visit_score_array.get(2));
				} else if (visit_score_array.size() == 4) {
					dto.setVisit_inning1(visit_score_array.get(0));
					dto.setVisit_inning2(visit_score_array.get(1));
					dto.setVisit_inning3(visit_score_array.get(2));
					dto.setVisit_inning4(visit_score_array.get(3));
				} else if (visit_score_array.size() == 5) {
					dto.setVisit_inning1(visit_score_array.get(0));
					dto.setVisit_inning2(visit_score_array.get(1));
					dto.setVisit_inning3(visit_score_array.get(2));
					dto.setVisit_inning4(visit_score_array.get(3));
					dto.setVisit_inning5(visit_score_array.get(4));
				} else if (visit_score_array.size() == 6) {
					dto.setVisit_inning1(visit_score_array.get(0));
					dto.setVisit_inning2(visit_score_array.get(1));
					dto.setVisit_inning3(visit_score_array.get(2));
					dto.setVisit_inning4(visit_score_array.get(3));
					dto.setVisit_inning5(visit_score_array.get(4));
					dto.setVisit_inning6(visit_score_array.get(5));
					dao_detail.update_visit(dto);
				} else if (visit_score_array.size() == 7) {
					dto.setVisit_inning1(visit_score_array.get(0));
					dto.setVisit_inning2(visit_score_array.get(1));
					dto.setVisit_inning3(visit_score_array.get(2));
					dto.setVisit_inning4(visit_score_array.get(3));
					dto.setVisit_inning5(visit_score_array.get(4));
					dto.setVisit_inning6(visit_score_array.get(5));
					dto.setVisit_inning7(visit_score_array.get(6));
				} else if (visit_score_array.size() == 8) {
					dto.setVisit_inning1(visit_score_array.get(0));
					dto.setVisit_inning2(visit_score_array.get(1));
					dto.setVisit_inning3(visit_score_array.get(2));
					dto.setVisit_inning4(visit_score_array.get(3));
					dto.setVisit_inning5(visit_score_array.get(4));
					dto.setVisit_inning6(visit_score_array.get(5));
					dto.setVisit_inning7(visit_score_array.get(6));
					dto.setVisit_inning8(visit_score_array.get(7));
				} else if (visit_score_array.size() == 9) {
					dto.setVisit_inning1(visit_score_array.get(0));
					dto.setVisit_inning2(visit_score_array.get(1));
					dto.setVisit_inning3(visit_score_array.get(2));
					dto.setVisit_inning4(visit_score_array.get(3));
					dto.setVisit_inning5(visit_score_array.get(4));
					dto.setVisit_inning6(visit_score_array.get(5));
					dto.setVisit_inning7(visit_score_array.get(6));
					dto.setVisit_inning8(visit_score_array.get(7));
					dto.setVisit_inning9(visit_score_array.get(8));
				} else if (visit_score_array.size() == 10) {
					dto.setVisit_inning1(visit_score_array.get(0));
					dto.setVisit_inning2(visit_score_array.get(1));
					dto.setVisit_inning3(visit_score_array.get(2));
					dto.setVisit_inning4(visit_score_array.get(3));
					dto.setVisit_inning5(visit_score_array.get(4));
					dto.setVisit_inning6(visit_score_array.get(5));
					dto.setVisit_inning7(visit_score_array.get(6));
					dto.setVisit_inning8(visit_score_array.get(7));
					dto.setVisit_inning9(visit_score_array.get(8));
					dto.setVisit_inning10(visit_score_array.get(9));
				} else if (visit_score_array.size() == 11) {
					dto.setVisit_inning1(visit_score_array.get(0));
					dto.setVisit_inning2(visit_score_array.get(1));
					dto.setVisit_inning3(visit_score_array.get(2));
					dto.setVisit_inning4(visit_score_array.get(3));
					dto.setVisit_inning5(visit_score_array.get(4));
					dto.setVisit_inning6(visit_score_array.get(5));
					dto.setVisit_inning7(visit_score_array.get(6));
					dto.setVisit_inning8(visit_score_array.get(7));
					dto.setVisit_inning9(visit_score_array.get(8));
					dto.setVisit_inning10(visit_score_array.get(9));
					dto.setVisit_inning11(visit_score_array.get(10));
				} else if (visit_score_array.size() == 12) {
					dto.setVisit_inning1(visit_score_array.get(0));
					dto.setVisit_inning2(visit_score_array.get(1));
					dto.setVisit_inning3(visit_score_array.get(2));
					dto.setVisit_inning4(visit_score_array.get(3));
					dto.setVisit_inning5(visit_score_array.get(4));
					dto.setVisit_inning6(visit_score_array.get(5));
					dto.setVisit_inning7(visit_score_array.get(6));
					dto.setVisit_inning8(visit_score_array.get(7));
					dto.setVisit_inning9(visit_score_array.get(8));
					dto.setVisit_inning10(visit_score_array.get(9));
					dto.setVisit_inning11(visit_score_array.get(10));
					dto.setVisit_inning12(visit_score_array.get(11));
				} 
				dao_detail.update_visit(dto);

				JSONArray OUT_DSArray = (JSONArray) jsonObj.get("OUT_DS"); // home_score
				ArrayList<String> home_score_array = new ArrayList<String>();

				String home_team = null;
				for (int j = 0; j < OUT_DSArray.size(); j++) {
					JSONObject gmkeyArray = (JSONObject) OUT_DSArray.get(j);

					String score = (String) (gmkeyArray.get("SCORE"));
					home_score_array.add(score);
					home_team = (String) gmkeyArray.get("HOME_TEAM");
				}
				
//				System.out.println(gamekey.get(i));
//				System.out.println(home_team + home_score_array);

				dto.setHome_team(home_team);
				if (home_score_array.size() == 1) {
					dto.setHome_inning1(home_score_array.get(0));
				} else if (home_score_array.size() == 2) {
					dto.setHome_inning1(home_score_array.get(0));
					dto.setHome_inning2(home_score_array.get(1));
				} else if (home_score_array.size() == 3) {
					dto.setHome_inning1(home_score_array.get(0));
					dto.setHome_inning2(home_score_array.get(1));
					dto.setHome_inning3(home_score_array.get(2));
				} else if (home_score_array.size() == 4) {
					dto.setHome_inning1(home_score_array.get(0));
					dto.setHome_inning2(home_score_array.get(1));
					dto.setHome_inning3(home_score_array.get(2));
					dto.setHome_inning4(home_score_array.get(3));
				} else if (home_score_array.size() == 5) {
					dto.setHome_inning1(home_score_array.get(0));
					dto.setHome_inning2(home_score_array.get(1));
					dto.setHome_inning3(home_score_array.get(2));
					dto.setHome_inning4(home_score_array.get(3));
					dto.setHome_inning5(home_score_array.get(4));
				} else if (home_score_array.size() == 6) {
					dto.setHome_inning1(home_score_array.get(0));
					dto.setHome_inning2(home_score_array.get(1));
					dto.setHome_inning3(home_score_array.get(2));
					dto.setHome_inning4(home_score_array.get(3));
					dto.setHome_inning5(home_score_array.get(4));
					dto.setHome_inning6(home_score_array.get(5));
				} else if (home_score_array.size() == 7) {
					dto.setHome_inning1(home_score_array.get(0));
					dto.setHome_inning2(home_score_array.get(1));
					dto.setHome_inning3(home_score_array.get(2));
					dto.setHome_inning4(home_score_array.get(3));
					dto.setHome_inning5(home_score_array.get(4));
					dto.setHome_inning6(home_score_array.get(5));
					dto.setHome_inning7(home_score_array.get(6));
				} else if (home_score_array.size() == 8) {
					dto.setHome_inning1(home_score_array.get(0));
					dto.setHome_inning2(home_score_array.get(1));
					dto.setHome_inning3(home_score_array.get(2));
					dto.setHome_inning4(home_score_array.get(3));
					dto.setHome_inning5(home_score_array.get(4));
					dto.setHome_inning6(home_score_array.get(5));
					dto.setHome_inning7(home_score_array.get(6));
					dto.setHome_inning8(home_score_array.get(7));
				} else if (home_score_array.size() == 9) {
					dto.setHome_inning1(home_score_array.get(0));
					dto.setHome_inning2(home_score_array.get(1));
					dto.setHome_inning3(home_score_array.get(2));
					dto.setHome_inning4(home_score_array.get(3));
					dto.setHome_inning5(home_score_array.get(4));
					dto.setHome_inning6(home_score_array.get(5));
					dto.setHome_inning7(home_score_array.get(6));
					dto.setHome_inning8(home_score_array.get(7));
					dto.setHome_inning9(home_score_array.get(8));
				} else if (home_score_array.size() == 10) {
					dto.setHome_inning1(home_score_array.get(0));
					dto.setHome_inning2(home_score_array.get(1));
					dto.setHome_inning3(home_score_array.get(2));
					dto.setHome_inning4(home_score_array.get(3));
					dto.setHome_inning5(home_score_array.get(4));
					dto.setHome_inning6(home_score_array.get(5));
					dto.setHome_inning7(home_score_array.get(6));
					dto.setHome_inning8(home_score_array.get(7));
					dto.setHome_inning9(home_score_array.get(8));
					dto.setHome_inning10(home_score_array.get(9));
				} else if (home_score_array.size() == 11) {
					dto.setHome_inning1(home_score_array.get(0));
					dto.setHome_inning2(home_score_array.get(1));
					dto.setHome_inning3(home_score_array.get(2));
					dto.setHome_inning4(home_score_array.get(3));
					dto.setHome_inning5(home_score_array.get(4));
					dto.setHome_inning6(home_score_array.get(5));
					dto.setHome_inning7(home_score_array.get(6));
					dto.setHome_inning8(home_score_array.get(7));
					dto.setHome_inning9(home_score_array.get(8));
					dto.setHome_inning10(home_score_array.get(9));
					dto.setHome_inning11(home_score_array.get(10));
				} else if (home_score_array.size() == 12) {
					dto.setHome_inning1(home_score_array.get(0));
					dto.setHome_inning2(home_score_array.get(1));
					dto.setHome_inning3(home_score_array.get(2));
					dto.setHome_inning4(home_score_array.get(3));
					dto.setHome_inning5(home_score_array.get(4));
					dto.setHome_inning6(home_score_array.get(5));
					dto.setHome_inning7(home_score_array.get(6));
					dto.setHome_inning8(home_score_array.get(7));
					dto.setHome_inning9(home_score_array.get(8));
					dto.setHome_inning10(home_score_array.get(9));
					dto.setHome_inning11(home_score_array.get(10));
					dto.setHome_inning12(home_score_array.get(11));
				} 
				dao_detail.update_home(dto);

			}

		} // try
		catch (Exception e) {
			e.printStackTrace();
		} // catch

	} // main
} // class