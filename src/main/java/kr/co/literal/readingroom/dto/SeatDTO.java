package kr.co.literal.readingroom.dto;

public class SeatDTO {
	
	public SeatDTO() {}

    private String branch_code;
    private String seat_code;
	public String getBranch_code() {
		return branch_code;
	}
	public void setBranch_code(String branch_code) {
		this.branch_code = branch_code;
	}
	public String getSeat_code() {
		return seat_code;
	}
	public void setSeat_code(String seat_code) {
		this.seat_code = seat_code;
	}
	@Override
	public String toString() {
		return "SeatDTO [branch_code=" + branch_code + ", seat_code=" + seat_code + "]";
	}
    
    
}