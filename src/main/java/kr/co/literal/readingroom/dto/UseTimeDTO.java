package kr.co.literal.readingroom.dto;

public class UseTimeDTO {
	
	public UseTimeDTO() {}

    private String time_code;
    private String start_time;
	public String getTime_code() {
		return time_code;
	}
	public void setTime_code(String time_code) {
		this.time_code = time_code;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	@Override
	public String toString() {
		return "Use_TimeDTO [time_code=" + time_code + ", start_time=" + start_time + "]";
	}
    
    
}