package kr.co.literal.member;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberCont {

    @Autowired
    private MemberService memberService;

	    
	    // 로그인 폼을 보여주는 메서드
	    @GetMapping("/login")
	    public String showLoginForm(HttpServletRequest request, Model model) {
	        Cookie[] cookies = request.getCookies();
	        String c_id = "";
	        if (cookies != null) {
	            for (Cookie cookie : cookies) {
	                if ("c_id".equals(cookie.getName())) {
	                    c_id = cookie.getValue();
	                }
	            }
	        }
	        model.addAttribute("c_id", c_id);
	        return "member/loginForm"; // 로그인 폼 페이지로 이동
	    }
	    

	    // 로그인 처리 메서드
	    @PostMapping("/login")
	    public String login(@RequestParam("email") String email, 
	                        @RequestParam("password") String password, 
	                        @RequestParam(value = "c_id", required = false) String c_id, 
	                        HttpServletRequest request, HttpServletResponse response, 
	                        Model model) {
	        System.out.println("로그인 시도: " + email);
	        MemberDTO memberDTO = memberService.login(email, password);
	        if (memberDTO != null) {
	            // 로그인 성공 시 세션에 멤버 정보를 저장
	            request.getSession().setAttribute("member", memberDTO);

	            // 이메일 저장 체크박스가 체크되어 있으면 쿠키에 이메일을 저장
	            if ("SAVE".equals(c_id)) {
	                Cookie cookie = new Cookie("c_id", email);
	                cookie.setMaxAge(60 * 60 * 24 * 30); // 쿠키 유효 기간: 30일
	                response.addCookie(cookie);
	            } else {
	                // 체크가 해제되어 있으면 쿠키를 제거
	                Cookie cookie = new Cookie("c_id", null);
	                cookie.setMaxAge(0);
	                response.addCookie(cookie);
	            }

	            return "redirect:/"; // 로그인 성공 시 index 페이지로 리디렉션
	        } else {
	            model.addAttribute("errorMessage", "로그인에 실패했습니다. 이메일과 비밀번호를 확인하세요.");
	            return "member/loginForm"; // 로그인 실패 시 다시 로그인 폼으로
	        }
	    }

	    
	    // 로그아웃 처리 메서드
	    @GetMapping("/logout")
	    public String logout(HttpServletRequest request) {
	        request.getSession().invalidate();
	        return "redirect:/member/login"; // 로그아웃 후 로그인 페이지로 리디렉션
	    }
	    
	    
	    // 회원가입 약관 페이지를 보여주는 메서드
	    @GetMapping("/agreement")
	    public String showAgreementForm() {
	        return "member/agreementForm";
	    }
	    
	    
	    // 회원가입 폼을 보여주는 메서드
	    @GetMapping("/memberForm")
	    public String showMemberForm() {
	        return "member/memberForm";
	    }

	    // 회원가입 처리 메서드
	    @PostMapping("/register")
	    public String register(MemberDTO memberDTO, Model model) {
	        System.out.println("-----register() 호출됨");
	        System.out.println("MemberDTO: " + memberDTO);
	        try {
	            memberService.registerMember(memberDTO);
	            model.addAttribute("member", memberDTO); // 회원 정보를 모델에 추가해줘야 welcome창에 정보출력가능
	            return "member/welcome"; // 회원가입 성공 후 환영페이지
	        } catch (Exception e) {
	            e.printStackTrace();
	            model.addAttribute("errorMessage", "회원가입 중 오류가 발생했습니다.");
	            return "member/error";
	        }
	    }
	    

	    // 아이디 찾기 폼을 보여주는 메서드
	    @GetMapping("/findID")
	    public String showFindIDForm() {
	        return "member/findID";
	    }
	    
	    // 비밀번호 찾기 폼을 보여주는 메서드
	    @GetMapping("/findPW")
	    public String showFindPWForm() {
	        return "member/findPW";
	    }
	    
	    
	    // 아이디 찾기 처리 메서드
	    @PostMapping("/findIDProc")
	    public String findIDProc(@RequestParam("mname") String mname, @RequestParam("phone_number") String phone_number, Model model) {
	        MemberDTO member = new MemberDTO();
	        member.setName(mname);
	        member.setPhone_number(phone_number);

	        boolean flag = memberService.findId(member);
	        if (flag) {
	            String message = "임시 비밀번호가 이메일로 전송되었습니다.\n임시 비밀번호는 로그인 후 회원정보수정에서 수정하시기 바랍니다.";
	            model.addAttribute("message", message);
	            return "redirect:/member/login"; // 로그인 폼으로 리디렉션
	        } else {
	            model.addAttribute("errorMessage", "아이디 찾기를 실패했습니다.");
	            return "member/findID";
	        }
	    }
	    
	    // 비밀번호 찾기 처리 메서드
	    @PostMapping("/findPWProc")
	    public String findPWProc(@RequestParam("mname") String mname, @RequestParam("phone_number") String email, Model model) {
	        MemberDTO member = new MemberDTO();
	        member.setName(mname);
	        member.setEmail(email);

	        boolean flag = memberService.findPW(member);
	        if (flag) {
	            String message = "임시 비밀번호가 이메일로 전송되었습니다.\n임시 비밀번호는 로그인 후 회원정보수정에서 수정하시기 바랍니다.";
	            model.addAttribute("message", message);
	            return "redirect:/member/login"; // 로그인 폼으로 리디렉션
	        } else {
	            model.addAttribute("errorMessage", "아이디 찾기를 실패했습니다.");
	            return "member/findPW";
	        }
	    }
	    
	  
	    @GetMapping("/emailCheckForm")
	    public String showEmailCheckForm() {
	        return "member/emailCheckForm";
	    }
	    
	    
	    @PostMapping("/emailCheck")
	    public String emailCheck(@RequestParam("email") String email, Model model) {
	        int cnt = memberService.duplicateEmail(email);  // 이메일 중복 확인을 위한 메서드
	        model.addAttribute("email", email);
	        model.addAttribute("cnt", cnt);
	        return "member/emailCheckResult"; // 결과를 보여줄 JSP 페이지로 이동
	    }
	    

	    
	}//class end
