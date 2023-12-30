package manager.model;

import org.springframework.web.multipart.MultipartFile;

public class ManagerBean {

	private String manager_id;
	private String manager_pw;
	private String manager_img;
	private MultipartFile upload;
	private String m_class;

	public ManagerBean() {

	}

	public ManagerBean(String manager_id, String manager_pw, String manager_img, MultipartFile upload, String m_class) {
		super();
		this.manager_id = manager_id;
		this.manager_pw = manager_pw;
		this.manager_img = manager_img;
		this.upload = upload;
		this.m_class = m_class;
	}

	public String getManager_id() {
		return manager_id;
	}

	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}

	public String getManager_pw() {
		return manager_pw;
	}

	public void setManager_pw(String manager_pw) {
		this.manager_pw = manager_pw;
	}

	public String getManager_img() {
		return manager_img;
	}

	public void setManager_img(String manager_img) {
		this.manager_img = manager_img;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		if(this.upload != null) {
			manager_img = upload.getOriginalFilename();
		}
	}

	public String getM_class() {
		return m_class;
	}

	public void setM_class(String m_class) {
		this.m_class = m_class;
	}

}
