package kr.co.literal.readingroom.dto;

public class ReadingRoomDTO {
	
	public ReadingRoomDTO() {}
	
    private String room_code;
    private String duration;
    private int room_amount;
	public String getRoom_code() {
		return room_code;
	}
	public void setRoom_code(String room_code) {
		this.room_code = room_code;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public int getRoom_amount() {
		return room_amount;
	}
	public void setRoom_amount(int room_amount) {
		this.room_amount = room_amount;
	}
	@Override
	public String toString() {
		return "ReadingRoomDTO [room_code=" + room_code + ", duration=" + duration + ", room_amount=" + room_amount
				+ "]";
	}
    
	
    
    
}