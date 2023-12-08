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

	public int checkMemberId(MemberBean mb) {
		int check = sqlSessionTemplate.selectOne(namespace+"checkMemberId",mb);
		return check;
	}

	public void insertMember(MemberBean mb) {
		sqlSessionTemplate.insert(namespace+"insertMember",mb);
	}

	public MemberBean findMemberId(MemberBean mb) {

		MemberBean findMB = sqlSessionTemplate.selectOne(namespace+"findMemberId");
		
		return findMB;
	}	
	
}
