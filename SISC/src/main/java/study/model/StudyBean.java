package study.model;

import java.sql.Date;

public class StudyBean {

	private int s_num;
	private String s_writer;
	private String memoCate;
	private String memoTitle;
	private String subTitle;
	private Date memoDate;
	private String s_content;

	public StudyBean() {

	}

	public StudyBean(int s_num, String s_writer, String memoCate, String memoTitle, String subTitle, Date memoDate,
			String s_content) {
		super();
		this.s_num = s_num;
		this.s_writer = s_writer;
		this.memoCate = memoCate;
		this.memoTitle = memoTitle;
		this.subTitle = subTitle;
		this.memoDate = memoDate;
		this.s_content = s_content;
	}

	public int getS_num() {
		return s_num;
	}

	public void setS_num(int s_num) {
		this.s_num = s_num;
	}

	public String getS_writer() {
		return s_writer;
	}

	public void setS_writer(String s_writer) {
		this.s_writer = s_writer;
	}

	public String getMemoCate() {
		return memoCate;
	}

	public void setMemoCate(String memoCate) {
		this.memoCate = memoCate;
	}

	public String getMemoTitle() {
		return memoTitle;
	}

	public void setMemoTitle(String memoTitle) {
		this.memoTitle = memoTitle;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public Date getMemoDate() {
		return memoDate;
	}

	public void setMemoDate(Date memoDate) {
		this.memoDate = memoDate;
	}

	public String getS_content() {
		return s_content;
	}

	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
}
