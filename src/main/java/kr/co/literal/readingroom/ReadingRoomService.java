package kr.co.literal.readingroom;

import kr.co.literal.readingroom.dao.*;
import kr.co.literal.readingroom.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReadingRoomService {

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

    public void addBranch(BranchDTO branch) {
        branchDAO.insertBranch(branch);
    }

    public List<BranchDTO> getAllBranches() { 
        return branchDAO.selectAllBranches();
    }

    public BranchDTO getBranchByCode(String branch_code) {
        return branchDAO.selectBranchByCode(branch_code);
    }

    public List<SeatDTO> getSeatsByBranchCode(String branch_code) {
        return seatDAO.selectSeatsByBranchCode(branch_code);
    }

    public void reserveSeat(ReservationDTO reservation) {
        reservationDAO.insertReservation(reservation);
    }
}
