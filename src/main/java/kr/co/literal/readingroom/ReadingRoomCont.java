package kr.co.literal.readingroom;

import kr.co.literal.readingroom.dao.ReadingRoomDAO;
import kr.co.literal.readingroom.dto.ReadingRoomDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ReadingRoomCont {

    @Autowired
    private ReadingRoomDAO readingRoomDAO;

    @GetMapping("/reservationForm")
    public String reservationForm() {
        return "readingroom/reservationForm";
    }

    @GetMapping("/gn_reservationForm")
    public String gnReservationForm() {
        return "readingroom/gn_reservationForm";
    }

    @GetMapping("/yh_reservationForm")
    public String yhReservationForm() {
        return "readingroom/yh_reservationForm";
    }

    @GetMapping("/jn_reservationForm")
    public String jnReservationForm() {
        return "readingroom/jn_reservationForm";
    }

    @PostMapping("/submitReservation")
    public String submitReservation(@RequestParam("branch") String branch, 
                                    @RequestParam("seat") String seat, 
                                    Model model) {
        model.addAttribute("branch", branch);
        model.addAttribute("seat", seat);
        return "readingroom/submitReservation";
    }

    @PostMapping("/paymentForm")
    public String paymentForm(@RequestParam("branch") String branch, 
                              @RequestParam("seat") String seat,
                              @RequestParam("usageTime") String usageTime, 
                              @RequestParam("startTime") String startTime,
                              Model model) {
        model.addAttribute("branch", branch);
        model.addAttribute("seat", seat);
        model.addAttribute("usageTime", usageTime);
        model.addAttribute("startTime", startTime);
        return "readingroom/paymentForm";
    }

    // 테스트용 메소드 추가
    @GetMapping("/test")
    public String test(Model model) {
        List<ReadingRoomDTO> readingRooms = readingRoomDAO.getAllReadingRooms();
        model.addAttribute("readingRooms", readingRooms);
        return "readingroom/test";
    }
}
