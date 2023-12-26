package quiz.model;

public class QuizBean {

	private int qz_num;
	private String que_cate;
	private String question;
	private String qz_view;
	private String answer;
	private String interpre; // 문제풀이 해석

	public QuizBean() {

	}

	public QuizBean(int qz_num, String que_cate, String question, String qz_view, String answer, String interpre) {
		this.qz_num = qz_num;
		this.que_cate = que_cate;
		this.question = question;
		this.qz_view = qz_view;
		this.answer = answer;
		this.interpre = interpre;
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

	public String getQz_view() {
		return qz_view;
	}

	public void setQz_view(String qz_view) {
		this.qz_view = qz_view;
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

}
