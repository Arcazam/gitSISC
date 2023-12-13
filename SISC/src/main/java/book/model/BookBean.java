package book.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BookBean {

	private int bk_num;
	private String seller; // 판매자 -
	private String seller_name; // 판매자 이름 -
	private String seller_pnum; // 판매자 번호 -
	private String writer; // 저자 -
	private String title; // 책 제목 -
	private String publisher; // 출판사 -
	private String b_image; // 책 사진 -
	private Date pub_date; // 출간일 -
	private Date sell_date; // 판매일 -
	private String sell_content; // 판매코멘트 -
	private int pri_price; // 원가 -
	private int dis_price; // 할인가 -
	private String kind; // 책 상태 -
	private MultipartFile upload;
	private String tradeway; // 거래 방식
	private String tradeplace; //거래 장소

	public BookBean() {

	}

	public BookBean(int bk_num, String seller, String seller_name, String seller_pnum, String writer, String title, String publisher,String b_image, Date pub_date,
			Date sell_date, String sell_content, int pri_price, int dis_price, String kind, MultipartFile upload, String tradeway, String tradeplace) {
		super();
		this.bk_num = bk_num;
		this.seller = seller;
		this.seller_name = seller_name;
		this.seller_pnum = seller_pnum;
		this.writer = writer;
		this.title = title;
		this.publisher = publisher;
		this.b_image = b_image;
		this.pub_date = pub_date;
		this.sell_date = sell_date;
		this.sell_content = sell_content;
		this.pri_price = pri_price;
		this.dis_price = dis_price;
		this.kind = kind;
		this.upload = upload;
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

	public int getPri_price() {
		return pri_price;
	}

	public void setPri_price(int pri_price) {
		this.pri_price = pri_price;
	}

	public int getDis_price() {
		return dis_price;
	}

	public void setDis_price(int dis_price) {
		this.dis_price = dis_price;
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

	public String getB_image() {
		return b_image;
	}

	public void setB_image(String b_image) {
		this.b_image = b_image;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		if (this.upload != null) {
			b_image = upload.getOriginalFilename();
		}
	}

	public String getSeller_pnum() {
		return seller_pnum;
	}

	public void setSeller_pnum(String seller_pnum) {
		this.seller_pnum = seller_pnum;
	}

	public String getSeller_name() {
		return seller_name;
	}

	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}
	
}
