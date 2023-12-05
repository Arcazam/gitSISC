package book.model;

import java.util.Date;

public class BookBean {

	private int bk_num;
	private String seller;
	private String writer;
	private String title;
	private String publisher;
	private Date pub_date; // 출간일
	private Date sell_date; // 판매일
	private String sell_content; // 판매코멘트
	private int price;
	private String kind;
	private String tradeway;
	private String tradeplace;

	public BookBean() {

	}

	public BookBean(int bk_num, String seller, String writer, String title, String publisher, Date pub_date,
			Date sell_date, String sell_content, int price, String kind, String tradeway, String tradeplace) {
		super();
		this.bk_num = bk_num;
		this.seller = seller;
		this.writer = writer;
		this.title = title;
		this.publisher = publisher;
		this.pub_date = pub_date;
		this.sell_date = sell_date;
		this.sell_content = sell_content;
		this.price = price;
		this.kind = kind;
		this.tradeway = tradeway;
		this.tradeplace = tradeplace;
	}

	public int getBk_num() {
		return bk_num;
	}

	public void setBk_num(int bk_num) {
		this.bk_num = bk_num;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public Date getPub_date() {
		return pub_date;
	}

	public void setPub_date(Date pub_date) {
		this.pub_date = pub_date;
	}

	public Date getSell_date() {
		return sell_date;
	}

	public void setSell_date(Date sell_date) {
		this.sell_date = sell_date;
	}

	public String getSell_content() {
		return sell_content;
	}

	public void setSell_content(String sell_content) {
		this.sell_content = sell_content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getTradeway() {
		return tradeway;
	}

	public void setTradeway(String tradeway) {
		this.tradeway = tradeway;
	}

	public String getTradeplace() {
		return tradeplace;
	}

	public void setTradeplace(String tradeplace) {
		this.tradeplace = tradeplace;
	}
	
}
