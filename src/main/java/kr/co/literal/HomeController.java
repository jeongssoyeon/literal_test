package kr.co.literal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	public HomeController() {
		System.out.println("-----HomeController()객체생성됨");
	}//end

	@RequestMapping("/")
    public String home() {
        return "index";  
    }
}
