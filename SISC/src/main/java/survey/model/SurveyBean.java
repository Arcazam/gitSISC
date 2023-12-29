package survey.model;

public class SurveyBean {

	private int su_num;
	private String su_text1;
	private String su_text2;
	private String su_text3;
	private String su_text4;
	private String su_text5;
	
	public SurveyBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SurveyBean(int su_num, String su_text1, String su_text2, String su_text3, String su_text4, String su_text5) {
		super();
		this.su_num = su_num;
		this.su_text1 = su_text1;
		this.su_text2 = su_text2;
		this.su_text3 = su_text3;
		this.su_text4 = su_text4;
		this.su_text5 = su_text5;
	}
	
	public int getSu_num() {
		return su_num;
	}
	public void setSu_num(int su_num) {
		this.su_num = su_num;
	}
	public String getSu_text1() {
		return su_text1;
	}
	public void setSu_text1(String su_text1) {
		this.su_text1 = su_text1;
	}
	public String getSu_text2() {
		return su_text2;
	}
	public void setSu_text2(String su_text2) {
		this.su_text2 = su_text2;
	}
	public String getSu_text3() {
		return su_text3;
	}
	public void setSu_text3(String su_text3) {
		this.su_text3 = su_text3;
	}
	public String getSu_text4() {
		return su_text4;
	}
	public void setSu_text4(String su_text4) {
		this.su_text4 = su_text4;
	}
	public String getSu_text5() {
		return su_text5;
	}
	public void setSu_text5(String su_text5) {
		this.su_text5 = su_text5;
	}

	
}
