package manager.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myManager")
public class ManagerDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="manager.";

	public ManagerBean getCheckManager(ManagerBean magb) {
		ManagerBean contrastMagB = sqlSessionTemplate.selectOne(namespace+"getCheckManager",magb);
		return contrastMagB;
	}
	
}
