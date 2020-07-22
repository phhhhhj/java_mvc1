package bean;

public class game_infoDTO {
	
	String gmkey;
	String gyear;
	String gmonth;
	String date;
	String day;
	String stadium;
	String gtime;
	String home_team;
	String home_score;
	String visit_team;
	String visit_score;
	String result;
	String weather;
	
	
	public String getGyear() {
		return gyear;
	}
	public void setGyear(String gyear) {
		this.gyear = gyear;
	}
	public String getGmonth() {
		return gmonth;
	}
	public void setGmonth(String gmonth) {
		this.gmonth = gmonth;
	}
	public String getGmkey() {
		return gmkey;
	}
	public void setGmkey(String gmkey) {
		this.gmkey = gmkey;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getStadium() {
		return stadium;
	}
	public void setStadium(String stadium) {
		this.stadium = stadium;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	public String getGtime() {
		return gtime;
	}
	public void setGtime(String gtime) {
		this.gtime = gtime;
	}
	public String getHome_team() {
		return home_team;
	}
	public void setHome_team(String home_team) {
		this.home_team = home_team;
	}
	public String getHome_score() {
		return home_score;
	}
	public void setHome_score(String home_score) {
		this.home_score = home_score;
	}
	public String getVisit_team() {
		return visit_team;
	}
	public void setVisit_team(String visit_team) {
		this.visit_team = visit_team;
	}
	public String getVisit_score() {
		return visit_score;
	}
	public void setVisit_score(String visit_score) {
		this.visit_score = visit_score;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	@Override
	public String toString() {
		return "game_infoDTO [gmkey=" + gmkey + ", gyear=" + gyear + ", gmonth=" + gmonth + ", date=" + date + ", day="
				+ day + ", stadium=" + stadium + ", gtime=" + gtime + ", home_team=" + home_team + ", home_score="
				+ home_score + ", visit_team=" + visit_team + ", visit_score=" + visit_score + ", result=" + result
				+ ", weather=" + weather + "]";
	}

}
