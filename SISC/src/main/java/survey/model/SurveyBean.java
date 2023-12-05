package survey.model;

public class SurveyBean {

	private int su_num;
	private String su_Title;
	private String su_contents;
	private int su_point;

	public SurveyBean() {

	}

	public SurveyBean(int su_num, String su_Title, String su_contents, int su_point) {
		super();
		this.su_num = su_num;
		this.su_Title = su_Title;
		this.su_contents = su_contents;
		this.su_point = su_point;
	}

	public int getSu_num() {
		return su_num;
	}

	public void setSu_num(int su_num) {
		this.su_num = su_num;
	}

	public String getSu_Title() {
		return su_Title;
	}

	public void setSu_Title(String su_Title) {
		this.su_Title = su_Title;
	}

	public String getSu_contents() {
		return su_contents;
	}

	public void setSu_contents(String su_contents) {
		this.su_contents = su_contents;
	}

	public int getSu_point() {
		return su_point;
	}

	public void setSu_point(int su_point) {
		this.su_point = su_point;
	}

}
