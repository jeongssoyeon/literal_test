package kr.co.literal.readingroom.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import kr.co.literal.readingroom.dto.ReservationDTO;

@Mapper
public interface ReservationDAO {

    @Insert("INSERT INTO reservation (reservation_code, room_code, mycoupon_number, reservation_total, seat_code, reservation_payment, time_code, end_time, reservation_date, using_seat, re_name, re_phone) " +
            "VALUES (#{reservationCode}, #{roomCode}, #{myCouponNumber}, #{reservationTotal}, #{seatCode}, #{reservationPayment}, #{timeCode}, #{endTime}, #{reservationDate}, #{usingSeat}, #{reName}, #{rePhone})")
    void insertReservation(ReservationDTO reservation);
}
