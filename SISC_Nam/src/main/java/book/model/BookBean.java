package book.model;

import org.springframework.web.multipart.MultipartFile;

public class BookBean {

	private int bk_num;
	private String seller; // �Ǹ��� -
	private String seller_pnum; // �Ǹ��� ��ȣ -
	private String writer; // ���� -
	private String title; // å ���� -
	private String publisher; // ���ǻ� -
	private String b_image1; // å ���� -
	private String b_image2; // å ���� -
	private String b_image3; // å ���� -
	private String sell_content; // �Ǹ��ڸ�Ʈ -
	private int dis_price; // ���ΰ� -
	private MultipartFile upload1;
	private MultipartFile upload2;
	private MultipartFile upload3;
	private String tradeway; // �ŷ� ���
	private String tradeplace; // �ŷ� ���
	private String sellstatus;
	private String prevUpload1;
	private String prevUpload2;
	private String prevUpload3;

	public BookBean() {

	}

	public BookBean(int bk_num, String seller, String seller_pnum, String writer, String title,
			String publisher, String b_image1, String b_image2, String b_image3, 
			String sell_content, int dis_price, String kind, MultipartFile upload1,
			MultipartFile upload2, MultipartFile upload3, String tradeway, String tradeplace, String sellstatus,
			String prevUpload1, String prevUpload2, String prevUpload3) {
		super();
		this.bk_num = bk_num;
		this.seller = seller;
		this.seller_pnum = seller_pnum;
		this.writer = writer;
		this.title = title;
		this.publisher = publisher;
		this.b_image1 = b_image1;
		this.b_image2 = b_image2;
		this.b_image3 = b_image3;
		this.sell_content = sell_content;
		this.dis_price = dis_price;
		this.upload1 = upload1;
		this.upload2 = upload2;
		this.upload3 = upload3;
		this.tradeway = tradeway;
		this.tradeplace = tradeplace;
		this.sellstatus = sellstatus;
		this.prevUpload1 = prevUpload1;
		this.prevUpload2 = prevUpload2;
		this.prevUpload3 = prevUpload3;
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

	public String getSeller_pnum() {
		return seller_pnum;
	}

	public void setSeller_pnum(String seller_pnum) {
		this.seller_pnum = seller_pnum;
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

	public String getB_image1() {
		return b_image1;
	}

	public void setB_image1(String b_image1) {
		this.b_image1 = b_image1;
	}

	public String getB_image2() {
		return b_image2;
	}

	public void setB_image2(String b_image2) {
		this.b_image2 = b_image2;
	}

	public String getB_image3() {
		return b_image3;
	}

	public void setB_image3(String b_image3) {
		this.b_image3 = b_image3;
	}

	public String getSell_content() {
		return sell_content;
	}

	public void setSell_content(String sell_content) {
		this.sell_content = sell_content;
	}

	public int getDis_price() {
		return dis_price;
	}

	public void setDis_price(int dis_price) {
		this.dis_price = dis_price;
	}

	public MultipartFile getUpload1() {
		return upload1;
	}

	public void setUpload1(MultipartFile upload1) {
		this.upload1 = upload1;
		if (this.upload1 != null) {
			b_image1 = upload1.getOriginalFilename();
		}
	}

	public MultipartFile getUpload2() {
		return upload2;
	}

	public void setUpload2(MultipartFile upload2) {
		this.upload2 = upload2;
		if (this.upload2 != null) {
			b_image2 = upload2.getOriginalFilename();
		}
	}

	public MultipartFile getUpload3() {
		return upload3;
	}

	public void setUpload3(MultipartFile upload3) {
		this.upload3 = upload3;
		if (this.upload3 != null) {
			b_image3 = upload3.getOriginalFilename();
		}
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

	public String getSellstatus() {
		return sellstatus;
	}

	public void setSellstatus(String sellstatus) {
		this.sellstatus = sellstatus;
	}

	public String getPrevUpload1() {
		return prevUpload1;
	}

	public void setPrevUpload1(String prevUpload1) {
		this.prevUpload1 = prevUpload1;
		if (this.prevUpload1 != null) {
			//b_image1 = prevUpload1.getOriginalFilename();
		}
	}

	public String getPrevUpload2() {
		return prevUpload2;
	}

	public void setPrevUpload2(String prevUpload2) {
		this.prevUpload2 = prevUpload2;
		if (this.prevUpload2 != null) {
			//b_image2 = prevUpload2.getOriginalFilename();
		}
	}

	public String getPrevUpload3() {
		return prevUpload3;
	}

	public void setPrevUpload3(String prevUpload3) {
		this.prevUpload3 = prevUpload3;
		if (this.prevUpload3 != null) {
			//b_image3 = prevUpload3.getOriginalFilename();
		}
	}

}