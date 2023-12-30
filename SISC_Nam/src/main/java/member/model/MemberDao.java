package member.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.ManagerPaging;

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
		MemberBean findMB = sqlSessionTemplate.selectOne(namespace+"findMemberID",mb);		
		return findMB;
	}

	public MemberBean findMPW(MemberBean mb) {
		MemberBean findMB = sqlSessionTemplate.selectOne(namespace+"findMPW",mb);
		return findMB;
	}

	public void updatePW(MemberBean mb) {
		sqlSessionTemplate.update(namespace+"updatePW",mb);
	}	
	public int deleteMember(String id) {
		int checkDelete = sqlSessionTemplate.delete(namespace+"deleteMember", id);
		return checkDelete;
	}

	public int updateMember(MemberBean mb) {
		int cnt = sqlSessionTemplate.update(namespace+"updateMember", mb);
		return cnt;
	}

	public MemberBean selectGetById(String id) {
		MemberBean mb = sqlSessionTemplate.selectOne(namespace+"selectGetById", id); 
		
		return mb;
	}

	public int updateProImg(MemberBean mb) {
		int mb1 = sqlSessionTemplate.update(namespace+"updateProImg", mb); 
		return mb1;
	}

	public int getCountMember(Map<String,String> map) {
		int memberCount = sqlSessionTemplate.selectOne(namespace+"getCountMember",map);
		return memberCount;
	}

	public List<MemberBean> getAllMemberList(ManagerPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<MemberBean> member_list = sqlSessionTemplate.selectList(namespace+"getAllMemberList",map,rowBounds);
		return member_list;
	}

	// °ü¸®ÀÚ
	public int getCountMagMember(Map<String, String> map) {
		int memberMagCount = sqlSessionTemplate.selectOne(namespace+"getCountMagMember",map);
		return memberMagCount;
	}

	public List<MemberBean> getAllMagMemberList(ManagerPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<MemberBean> member_list = sqlSessionTemplate.selectList(namespace+"getAllMagMemberList",map,rowBounds);
		return member_list;
	}	
}