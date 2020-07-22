package playerCrawling;

import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class Player {

	public static void main(String[] args) throws IOException {
		// 선수 정보 크롤링
		Connection con = Jsoup.connect("https://www.lgtwins.com/service/html.ncd?baRq=IN_DS&baRs=OUT_DS%2COUT_CAREER_DS&IN_DS.USE_YN=Y&TYPE=PLYPTC&view=%2Fpc_twins%2Ftwins_player%2Ftwins_player_list&actID=BR_RetrieveTeamMemberInfo");
		Document doc = con.get();
		
		// 투수p, 포수c, 내야수i, 외야수o
		// number, name, EngName, position, img

		// 등번호
//		System.out.println("등번호");
//		System.out.println("투수------------");
		Elements listP = doc.select(".pitcher .txt_wrap .number");
//		System.out.println(listP.size());
//		System.out.println(listP.get(0).text());
//		System.out.println(listP.get(1).text());
//		System.out.println("포수------------");
		Elements listC = doc.select(".catcher .txt_wrap .number");
//		System.out.println(listC.size());
//		System.out.println(listC.get(0).text());
//		System.out.println(listC.get(1).text());
//		System.out.println("내야수------------");
		Elements listI = doc.select(".infielder .txt_wrap .number");
//		System.out.println(listI.size());
//		System.out.println(listI.get(0).text());
//		System.out.println(listI.get(1).text());
//		System.out.println("외야수------------");
		Elements listO = doc.select(".outfielder .txt_wrap .number");
//		System.out.println(listO.size());
//		System.out.println(listO.get(0).text());
//		System.out.println(listO.get(1).text());
//		System.out.println();
		
		// 이름 1
//		System.out.println("이름");
//		System.out.println("투수------------");
		Elements listP1 = doc.select(".pitcher .txt_wrap .player");
//		System.out.println(listP1.size());
//		System.out.println(listP1.get(0).text());
//		System.out.println(listP1.get(1).text());
//		System.out.println("포수------------");
		Elements listC1 = doc.select(".catcher .txt_wrap .player");
//		System.out.println(listC1.size());
//		System.out.println(listC1.get(0).text());
//		System.out.println(listC1.get(1).text());
//		System.out.println("내야수------------");
		Elements listI1 = doc.select(".infielder .txt_wrap .player");
//		System.out.println(listI1.size());
//		System.out.println(listI1.get(0).text());
//		System.out.println(listI1.get(1).text());
//		System.out.println("외야수------------");
		Elements listO1 = doc.select(".outfielder .txt_wrap .player");
//		System.out.println(listO1.size());
//		System.out.println(listO1.get(0).text());
//		System.out.println(listO1.get(1).text());
//		System.out.println();
		
		// 영어이름 2
//		System.out.println("영어이름");
//		System.out.println("투수------------");
		Elements listP2 = doc.select(".pitcher .txt_wrap .name");
//		System.out.println(listP2.size());
//		System.out.println(listP2.get(0).text());
//		System.out.println(listP2.get(1).text());
//		System.out.println("포수------------");
		Elements listC2 = doc.select(".catcher .txt_wrap .name");
//		System.out.println(listC2.size());
//		System.out.println(listC2.get(0).text());
//		System.out.println(listC2.get(1).text());
//		System.out.println("내야수------------");
		Elements listI2 = doc.select(".infielder .txt_wrap .name");
//		System.out.println(listI2.size());
//		System.out.println(listI2.get(0).text());
//		System.out.println(listI2.get(1).text());
//		System.out.println("외야수------------");
		Elements listO2 = doc.select(".outfielder .txt_wrap .name");
//		System.out.println(listO2.size());
//		System.out.println(listO2.get(0).text());
//		System.out.println(listO2.get(1).text());
//		System.out.println();
		
		// 포지션 3
//		System.out.println("포지션");
//		System.out.println("투수------------");
		Elements listP3 = doc.select(".pitcher .txt_wrap .position");
//		System.out.println(listP3.size());
//		System.out.println(listP3.get(0).text());
//		System.out.println(listP3.get(1).text());
//		System.out.println("포수------------");
		Elements listC3 = doc.select(".catcher .txt_wrap .position");
//		System.out.println(listC3.size());
//		System.out.println(listC3.get(0).text());
//		System.out.println(listC3.get(1).text());
//		System.out.println("내야수------------");
		Elements listI3 = doc.select(".infielder .txt_wrap .position");
//		System.out.println(listI3.size());
//		System.out.println(listI3.get(0).text());
//		System.out.println(listI3.get(1).text());
//		System.out.println("외야수------------");
		Elements listO3 = doc.select(".outfielder .txt_wrap .position");
//		System.out.println(listO3.size());
//		System.out.println(listO3.get(0).text());
//		System.out.println(listO3.get(1).text());
//		System.out.println();

		// 이미지 4
//		System.out.println("사진 이름");
//		System.out.println("투수------------");
		Elements listP4 = doc.select(".pitcher .img_wrap img");
//		System.out.println(listP4.size());
//		System.out.println(listP4.get(0).attr("src"));
//		System.out.println(listP4.get(1).attr("src"));
//		System.out.println(listP4.get(2).attr("src"));
//		System.out.println(listP4.get(3).attr("src"));
//		System.out.println("포수------------");
		Elements listC4 = doc.select(".catcher .img_wrap img");
//		System.out.println(listC4.size());
//		System.out.println(listC4.get(0).attr("src"));
//		System.out.println("내야수------------");
		Elements listI4 = doc.select(".infielder .img_wrap img");
//		System.out.println(listI4.size());
//		System.out.println(listI4.get(0).attr("src"));
//		System.out.println("외야수------------");
		Elements listO4 = doc.select(".outfielder .img_wrap img");
//		System.out.println(listO4.size());
//		System.out.println(listO4.get(0).attr("src"));
//		System.out.println();

		// 크롤링 끝
		// JSON 생성
		
		// 투수p, 포수c, 내야수i, 외야수o
		// number, name, EngName, position, img
		JSONObject allPlayer = new JSONObject(); // 전체 json
		
		JSONArray pitcher = new JSONArray(); // 투수 묶음
		JSONArray catcher = new JSONArray(); // 포수 묶음
		JSONArray infielder = new JSONArray(); // 내야수 묶음
		JSONArray outfielder = new JSONArray(); // 외야수 묶음
		
		JSONObject onePitcher; // 투수 한 명 정보
		JSONObject oneCatcher; // 포수 한 명 정보
		JSONObject oneInfielder; // 내야수 한 명 정보
		JSONObject oneOutfielder; // 외야수 한 명 정보
		
		String front = "https://www.lgtwins.com";
		// 입력
		// 투수
		for (int i = 0; i < listP.size(); i++) {
			onePitcher = new JSONObject();
			onePitcher.put("number", listP.get(i).text());
			onePitcher.put("name", listP1.get(i).text());
			onePitcher.put("EngName", listP2.get(i).text());
			onePitcher.put("position", listP3.get(i).text());
			onePitcher.put("img", front + listP4.get(i).attr("src"));
			pitcher.add(onePitcher);
		}
		allPlayer.put("pitcher", pitcher);
		
		// 포수
		for (int i = 0; i < listC.size(); i++) {
			oneCatcher = new JSONObject();
			oneCatcher.put("number", listC.get(i).text());
			oneCatcher.put("name", listC1.get(i).text());
			oneCatcher.put("EngName", listC2.get(i).text());
			oneCatcher.put("position", listC3.get(i).text());
			oneCatcher.put("img", front + listC4.get(i).attr("src"));
			catcher.add(oneCatcher);
		}
		allPlayer.put("catcher", catcher);
		
		// 내야수
		for (int i = 0; i < listI.size(); i++) {
			oneInfielder = new JSONObject();
			oneInfielder.put("number", listI.get(i).text());
			oneInfielder.put("name", listI1.get(i).text());
			oneInfielder.put("EngName", listI2.get(i).text());
			oneInfielder.put("position", listI3.get(i).text());
			oneInfielder.put("img", front + listI4.get(i).attr("src"));
			infielder.add(oneInfielder);
		}
		allPlayer.put("infielder", infielder);
		
		// 외야수
		for (int i = 0; i < listO.size(); i++) {
			oneOutfielder = new JSONObject();
			oneOutfielder.put("number", listO.get(i).text());
			oneOutfielder.put("name", listO1.get(i).text());
			oneOutfielder.put("EngName", listO2.get(i).text());
			oneOutfielder.put("position", listO3.get(i).text());
			oneOutfielder.put("img", front + listO4.get(i).attr("src"));
			outfielder.add(oneOutfielder);
		}
		allPlayer.put("outfielder", outfielder);
		
		System.out.println(allPlayer);

	}

}
