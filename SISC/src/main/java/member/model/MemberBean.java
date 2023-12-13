package member.model;

import org.springframework.web.multipart.MultipartFile;

public class MemberBean {

	private String id;
	private String password;
	private String name;
	private String pro_img;
	private String joomin;
	private String birth;
	private String gender;
	private String address;
	private String division;
	private String code;
	private String start_day;
	private String end_day;
	private String phone;
	private int point;
	private String m_class;
	private MultipartFile upload;
	private MultipartFile upload2;
	private String curriculum;

	public MemberBean() {

	}

	public MemberBean(String id, String password, String name, String pro_img, String joomin, String birth,
			String gender, String address, String division, String code, String start_day, String end_day, String phone,
			int point, String m_class, MultipartFile upload, MultipartFile upload2, String curriculum) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.pro_img = pro_img;
		this.joomin = joomin;
		this.birth = birth;
		this.gender = gender;
		this.address = address;
		this.division = division;
		this.code = code;
		this.start_day = start_day;
		this.end_day = end_day;
		this.phone = phone;
		this.point = point;
		this.m_class = m_class;
		this.upload = upload;
		this.upload = upload2;
		this.curriculum = curriculum;
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

	public String getJoomin() {
		return joomin;
	}

	public void setJoomin(String joomin) {
		this.joomin = joomin;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
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

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getStart_day() {
		return start_day;
	}

	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}

	public String getEnd_day() {
		return end_day;
	}

	public void setEnd_day(String end_day) {
		this.end_day = end_day;
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
		if (this.upload != null) {
			pro_img = upload.getOriginalFilename();
		}
	}

	public MultipartFile getUpload2() {
		return upload2;
	}

	public void setUpload2(MultipartFile upload2) {
		this.upload2 = upload2;
	}
	
	public String getCurriculum() {
		return curriculum;
	}

	public void setCurriculum(String curriculum) {
		this.curriculum = curriculum;
	}
}