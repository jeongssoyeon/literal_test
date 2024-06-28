package kr.co.literal.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {

	    @Autowired
	    private MemberDAO memberDAO;

	    public MemberDTO login(String email, String password) {
	        MemberDTO member = memberDAO.getMemberByEmail(email);
	        if (member != null && member.getPassword().equals(password)) {
	            return member;
	        }
	        return null;
	    }
	    

	    public void registerMember(MemberDTO memberDTO) {
	        memberDAO.insertMember(memberDTO);
	    }
	    

	    public boolean findId(MemberDTO member) {
	        MemberDTO foundMember = memberDAO.findByNameAndPhone(member.getName(), member.getPhone_number());
	        if (foundMember != null) {
	            // 이메일로 아이디와 임시 비밀번호 전송 로직 추가
	            //sendEmailWithTempPassword(foundMember);
	            return true;
	        }
	        return false;
	    }
	    
	    public boolean findPW(MemberDTO member) {
	        MemberDTO foundMember = memberDAO.findByNameAndEmail(member.getName(), member.getEmail());
	        if (foundMember != null) {
	            // 이메일로 아이디와 임시 비밀번호 전송 로직 추가
	            sendEmailWithTempPassword(foundMember);
	            return true;
	        }
	        return false;
	    }

	    private void sendEmailWithTempPassword(MemberDTO member) {
	        // 이메일 전송 로직 구현
	    }
	    
	    // 이메일 중복 확인 메서드
	    public int duplicateEmail(String email) {
	        return memberDAO.duplicateEmail(email);
	    }
}//class end
