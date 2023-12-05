package community.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myCommunity")
public class CommunityDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="community.";
	
}
