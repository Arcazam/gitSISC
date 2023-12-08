package member.model;

import org.springframework.web.multipart.MultipartFile;

public class MemberBean {

	private String id;
	private String password;	
	private String name;
	private String pro_img;
	private String joomin;
	private String gender;	
	private String address;
	private String phone;
	private int point;
	private String m_class;
	private MultipartFile upload;

	public MemberBean() {

	}

	public MemberBean(String id, String password, String name,String pro_img, String joomin, String gender, String address,
			String phone, int point, String m_class, MultipartFile upload) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.pro_img = pro_img;
		this.joomin = joomin;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.point = point;
		this.m_class = m_class;
		this.upload = upload;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPro_img() {
		return pro_img;
	}


	public void setPro_img(String pro_img) {
		this.pro_img = pro_img;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getM_class() {
		return m_class;
	}

	public void setM_class(String m_class) {
		this.m_class = m_class;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		if(this.upload != null) {
			pro_img = upload.getOriginalFilename();
		}
	}

	public String getJoomin() {
		return joomin;
	}

	public void setJoomin(String joomin) {
		this.joomin = joomin;
	}
}