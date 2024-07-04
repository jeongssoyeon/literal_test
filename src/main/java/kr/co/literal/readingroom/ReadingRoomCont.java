package kr.co.literal.readingroom;

import kr.co.literal.readingroom.dto.*;
import kr.co.literal.readingroom.ReadingRoomService;
import kr.co.literal.readingroom.dao.BranchDAO;
import kr.co.literal.readingroom.dao.MyCouponDAO;
import kr.co.literal.readingroom.dao.ReadingRoomDAO;
import kr.co.literal.readingroom.dao.ReservationDAO;
import kr.co.literal.readingroom.dao.SeatDAO;
import kr.co.literal.readingroom.dao.UseTimeDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ReadingRoomCont {

    @Autowired
    private ReadingRoomService readingRoomService;
    
    @Autowired
    private BranchDAO branchDAO;

    @Autowired
    private MyCouponDAO myCouponDAO;

    @Autowired
    private ReadingRoomDAO readingRoomDAO;

    @Autowired
    private ReservationDAO reservationDAO;

    @Autowired
    private SeatDAO seatDAO;

    @Autowired
    private UseTimeDAO useTimeDAO;
    
    @GetMapping("/reservationForm")
    public String reservationForm(Model model, @RequestParam(value = "branchCode", required = false) String branchCode) {
        // 지점 목록을 가져옴
        List<BranchDTO> branches = readingRoomService.getAllBranches();
        model.addAttribute("branches", branches);
        
        // 선택된 지점의 정보를 가져옴
        if (branchCode != null) {
            BranchDTO selectedBranch = readingRoomService.getBranchByCode(branchCode);
            model.addAttribute("selectedBranch", selectedBranch);
        }
        
        return "readingroom/reservationForm";
    }
}
