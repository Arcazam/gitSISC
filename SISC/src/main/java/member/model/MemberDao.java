package member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myMember")
public class MemberDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="member.";

	public MemberBean getAllMember(String userId) {
		MemberBean mb = sqlSessionTemplate.selectOne(namespace+"getAllMember",userId);
		return mb;
	}
	
}
