package manager.model;

public class ManagerBean {

	private String manager_id;
	private String manager_pw;
	private String m_class;

	public ManagerBean() {

	}

	public ManagerBean(String manager_id, String manager_pw, String m_class) {
		super();
		this.manager_id = manager_id;
		this.manager_pw = manager_pw;
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

	public String getM_class() {
		return m_class;
	}

	public void setM_class(String m_class) {
		this.m_class = m_class;
	}

}
