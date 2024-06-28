package kr.co.literal.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.literal.member.MemberService;

@Controller
public class MypageCont {

	@Autowired
    private MemberService memberService;


	
}//class end
