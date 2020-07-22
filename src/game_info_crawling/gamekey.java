package game_info_crawling;

import java.util.ArrayList;

import bean.game_detailDAO;
import bean.game_infoDAO;
import bean.gamekeyDTO;

public class gamekey {

	public static void main(String[] args) {
		
		game_infoDAO dao = new game_infoDAO();
		ArrayList<gamekeyDTO> gamekey = dao.list();
//		System.out.println(gamekey);
		for (int j = 0; j < gamekey.size(); j++) {
			String gk = "";
			gamekeyDTO dto = new gamekeyDTO();
			gk = gamekey.get(j).toString();
			dto.setGmkey(gk);
//			System.out.println(gk);
			game_detailDAO dao2 = new game_detailDAO();
			dao2.insert(dto);
		}
	}

}
