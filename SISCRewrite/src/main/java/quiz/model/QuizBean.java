package quiz.model;

public class QuizBean {

	private int qz_num;
	private String que_cate;
	private String question;
	private String answer;
	private String interpre; // 문제풀이 해석
	private int point;

	public QuizBean() {

	}

	public QuizBean(int qz_num, String que_cate, String question, String answer, String interpre, int point) {
		super();
		this.qz_num = qz_num;
		this.que_cate = que_cate;
		this.question = question;
		this.answer = answer;
		this.interpre = interpre;
		this.point = point;
	}

	public int getQz_num() {
		return qz_num;
	}

	public void setQz_num(int qz_num) {
		this.qz_num = qz_num;
	}

	public String getQue_cate() {
		return que_cate;
	}

	public void setQue_cate(String que_cate) {
		this.que_cate = que_cate;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getInterpre() {
		return interpre;
	}

	public void setInterpre(String interpre) {
		this.interpre = interpre;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

}
