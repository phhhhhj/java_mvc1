package game_info_crawling;

// data crawling
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

// DB link
import bean.game_infoDAO;
import bean.game_infoDTO;

public class game_infoCrawling { // 경기 일정

	public static void main(String[] args) {
		String[] years = { "2019", "2020"};
		String[] month = { "03", "04", "05", "06", "07", "08", "09", "10" };
		for (int i = 0; i < years.length; i++) {
			for (int j = 0; j < month.length; j++) {
				try {
					String url = "https://www.lgtwins.com/service/ajax.ncd?actID=BR_RetrieveGameSchedule&baRq=IN_DS&baRs=OUT_DS,OUT_TEAM&baRsSel=OUT_DS,OUT_TEAM&IN_DS.GYEAR="
							+ years[i] + "&IN_DS.GMONTH=" + month[j] + "&IN_DS.HOME_TEAM=&IN_DS.TEAM_CODE=";
					Connection con = Jsoup.connect(url);
					con.header("origin",
							"https://www.lgtwins.com/service/ajax.ncd?actID=BR_RetrieveGameSchedule&baRq=IN_DS&baRs=OUT_DS,OUT_TEAM&baRsSel=OUT_DS,OUT_TEAM&IN_DS.GYEAR="
									+ years[i] + "&IN_DS.GMONTH=" + month[j] + "&IN_DS.HOME_TEAM=&IN_DS.TEAM_CODE=")
							.header("referer",
									"https://www.lgtwins.com/service/ajax.ncd?actID=BR_RetrieveGameSchedule&baRq=IN_DS&baRs=OUT_DS,OUT_TEAM&baRsSel=OUT_DS,OUT_TEAM&IN_DS.GYEAR="
											+ years[i] + "&IN_DS.GMONTH=" + month[j]
											+ "&IN_DS.HOME_TEAM=&IN_DS.TEAM_CODE=")
							.ignoreContentType(true).get();
					Document doc = con.get();
					String docu = doc.text();
					
					JSONParser jsonParse = new JSONParser();
					JSONObject jsonObj = (JSONObject) jsonParse.parse(docu);
					JSONArray OUT_DSArray = (JSONArray) jsonObj.get("OUT_DS");
					
					for (int k = 0; k < OUT_DSArray.size(); k++) {
						JSONObject gmkeyArray = (JSONObject) OUT_DSArray.get(k);
//						System.out.println(gmkeyArray);
						
						String gmkey = (String) gmkeyArray.get("GMKEY");
						String gyear = (String) gmkeyArray.get("GYEAR");
						String gmonth = (String) gmkeyArray.get("GMONTH");
						String date = (String) gmkeyArray.get("GDAY");
						String day = (String) gmkeyArray.get("GWEEK");
						String stadium = (String) gmkeyArray.get("STADIUM");
						String gtime = (String) gmkeyArray.get("GTIME");
						String home_team = (String) gmkeyArray.get("HOME_KEY");
						String home_score = (String) gmkeyArray.get("HSCORE");
						String visit_team = (String) gmkeyArray.get("VISIT_KEY");
						String visit_score = (String) gmkeyArray.get("VSCORE");
						String result;
						
						if (home_team.equals("LG")) {
							if (home_score == null || visit_score == null) {
								result = null;
							} else if (Integer.parseInt(home_score) == Integer.parseInt(visit_score)) {
								result = "무승부";
							} else if (Integer.parseInt(home_score) < Integer.parseInt(visit_score)) {
								result = "패";
							} else {
								result = "승";
							}
						} else if (visit_team.equals("LG")) {
							if (home_score == null || visit_score == null) {
								result = null;
							} else if (Integer.parseInt(home_score) == Integer.parseInt(visit_score)) {
								result = "무승부";
							} else if (Integer.parseInt(home_score) > Integer.parseInt(visit_score)) {
								result = "패";
							} else {
								result = "승";
							}
						} else {
							result = null;
						}
//						System.out.println(result);

						game_infoDTO dto = new game_infoDTO();
						dto.setGmkey(gmkey);
						dto.setGyear(gyear);
						dto.setGmonth(gmonth);
						dto.setDate(date);
						dto.setDay(day);
						dto.setStadium(stadium);
						dto.setGtime(gtime);
						dto.setHome_team(home_team);
						dto.setHome_score(home_score);
						dto.setVisit_team(visit_team);
						dto.setVisit_score(visit_score);
						dto.setResult(result);
						
						game_infoDAO dao = new game_infoDAO();
						dao.insert(dto);
					}
				} // try
				catch (Exception e) {
					e.printStackTrace();
				} // catch
			} // for j
		} // for i

	} // main
} // class
