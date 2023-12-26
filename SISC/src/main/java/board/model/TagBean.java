package board.model;

public class TagBean {

	private String tag_val;
	private int tag_cnt;

	public TagBean() {

	}

	public TagBean(String tag_val, int tag_cnt) {
		super();
		this.tag_val = tag_val;
		this.tag_cnt = tag_cnt;
	}

	public String getTag_val() {
		return tag_val;
	}

	public void setTag_val(String tag_val) {
		this.tag_val = tag_val;
	}

	public int getTag_cnt() {
		return tag_cnt;
	}

	public void setTag_cnt(int tag_cnt) {
		this.tag_cnt = tag_cnt;
	}

}
