package notice.model;

public class NoticeBean {
	private int n_num;
	private String writer;
	private String subject;
	private String reg_date;
	private int readcount;
	private String content;
	
	public NoticeBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public NoticeBean(int n_num, String writer, String subject, String reg_date, int readcount, String content) {
		super();
		this.n_num = n_num;
		this.writer = writer;
		this.subject = subject;
		this.reg_date = reg_date;
		this.readcount = readcount;
		this.content = content;
	}
	
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
