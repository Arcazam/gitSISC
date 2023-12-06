package member.model;

public class MemberBean {

	private String id;
	private String password;	
	private String name;
	private String birth;
	private String gender;	
	private String address;
	private String phone;
	private int point;
	private String u_class;

	public MemberBean() {

	}

	public MemberBean(String id, String password, String name, String birth, String gender, String address,
			String phone, int point, String u_class) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.point = point;
		this.u_class = u_class;
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

	public String getU_class() {
		return u_class;
	}

	public void setU_class(String u_class) {
		this.u_class = u_class;
	}

}
