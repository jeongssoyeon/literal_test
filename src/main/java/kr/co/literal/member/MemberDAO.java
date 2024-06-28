package kr.co.literal.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class MemberDAO {
	
	    @Autowired
	    private SqlSession sqlSession;
	
	    private static final String NAMESPACE = "kr.co.literal.member.MemberMapper";
	
	    
	    public void insertMember(MemberDTO member) {
	        sqlSession.insert(NAMESPACE + ".insertMember", member);
	    }
	
	
	    public MemberDTO getMemberByEmail(String email) {
	        return sqlSession.selectOne(NAMESPACE + ".getMemberByEmail", email);
	    }


	
	    public List<MemberDTO> getAllMembers() {
	        return sqlSession.selectList(NAMESPACE + ".getAllMembers");
	    }
   
	    
	    public MemberDTO findByNameAndPhone(String name, String phone_number) {
	        Map<String, Object> params = new HashMap<>();
	        params.put("name", name);
	        params.put("phone_number", phone_number);
	        return sqlSession.selectOne(NAMESPACE + ".findByNameAndPhone", params);
	    }
	    
	  
	    public MemberDTO findByNameAndEmail(String name, String email) {
	        Map<String, Object> params = new HashMap<>();
	        params.put("name", name);
	        params.put("email", email);
	        return sqlSession.selectOne(NAMESPACE + ".findByNameAndEmail", params);
	    }
	    	    
	   
        public int duplicateEmail(String email) {
            return sqlSession.selectOne(NAMESPACE + ".duplicateEmail", email); // 이메일 중복 확인 메서드 추가
        }
}//class end
