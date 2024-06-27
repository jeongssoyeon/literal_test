package kr.co.literal.readingroom.dto;

public class ReservationDTO {
	
	public ReservationDTO() {}
	
    private String reservation_code;
    private String room_code;
    private String mycoupon_number;
    private int reservation_total;
    private String seat_code;
    private String reservation_payment;
    private String time_code;
    private String end_time;
    private String reservation_date;
    private String using_seat;
    private String re_name;
    private String re_phone;
    
	public String getReservation_code() {
		return reservation_code;
	}
	public void setReservation_code(String reservation_code) {
		this.reservation_code = reservation_code;
	}
	public String getRoom_code() {
		return room_code;
	}
	public void setRoom_code(String room_code) {
		this.room_code = room_code;
	}
	public String getMycoupon_number() {
		return mycoupon_number;
	}
	public void setMycoupon_number(String mycoupon_number) {
		this.mycoupon_number = mycoupon_number;
	}
	public int getReservation_total() {
		return reservation_total;
	}
	public void setReservation_total(int reservation_total) {
		this.reservation_total = reservation_total;
	}
	public String getSeat_code() {
		return seat_code;
	}
	public void setSeat_code(String seat_code) {
		this.seat_code = seat_code;
	}
	public String getReservation_payment() {
		return reservation_payment;
	}
	public void setReservation_payment(String reservation_payment) {
		this.reservation_payment = reservation_payment;
	}
	public String getTime_code() {
		return time_code;
	}
	public void setTime_code(String time_code) {
		this.time_code = time_code;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}
	public String getUsing_seat() {
		return using_seat;
	}
	public void setUsing_seat(String using_seat) {
		this.using_seat = using_seat;
	}
	public String getRe_name() {
		return re_name;
	}
	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}
	public String getRe_phone() {
		return re_phone;
	}
	public void setRe_phone(String re_phone) {
		this.re_phone = re_phone;
	}
	@Override
	public String toString() {
		return "ReservationDTO [reservation_code=" + reservation_code + ", room_code=" + room_code
				+ ", mycoupon_number=" + mycoupon_number + ", reservation_total=" + reservation_total + ", seat_code="
				+ seat_code + ", reservation_payment=" + reservation_payment + ", time_code=" + time_code
				+ ", end_time=" + end_time + ", reservation_date=" + reservation_date + ", using_seat=" + using_seat
				+ ", re_name=" + re_name + ", re_phone=" + re_phone + "]";
	}
    
    
}
