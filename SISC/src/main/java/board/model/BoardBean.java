package board.model;

import java.sql.Timestamp;

public class BoardBean {

	private int b_num;
	private String b_cate;
	private String writer;
	private String subject;
	private String passwd;
	private Timestamp reg_date;
	private int readcount;
	private int ref;
	private int re_step;
	private int re_level;
	private String content;
	
	public BoardBean() {
		
	}

	public BoardBean(int b_num, String b_cate, String writer, String subject, String passwd, Timestamp reg_date,
			int readcount, int ref, int re_step, int re_level, String content) {
		super();
		this.b_num = b_num;
		this.b_cate = b_cate;
		this.writer = writer;
		this.subject = subject;
		this.passwd = passwd;
		this.reg_date = reg_date;
		this.readcount = readcount;
		this.ref = ref;
		this.re_step = re_step;
		this.re_level = re_level;
		this.content = content;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getB_cate() {
		return b_cate;
	}

	public void setB_cate(String b_cate) {
		this.b_cate = b_cate;
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

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
