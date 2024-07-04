package kr.co.literal.readingroom.dao;

import kr.co.literal.readingroom.dto.ReservationDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class ReservationDAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "kr.co.literal.readingroom.ReadingRoomMapper";

    public void insertReservation(ReservationDTO reservation) {
        sqlSession.insert(NAMESPACE + ".insertReservation", reservation);
    }

    public List<ReservationDTO> getAllReservations() {
        return sqlSession.selectList(NAMESPACE + ".getAllReservations");
    }

    public ReservationDTO getReservationByCode(String reservation_code) {
        return sqlSession.selectOne(NAMESPACE + ".getReservationByCode", reservation_code);
    }

    public void updateReservation(ReservationDTO reservation) {
        sqlSession.update(NAMESPACE + ".updateReservation", reservation);
    }

    public void deleteReservation(String reservation_code) {
        sqlSession.delete(NAMESPACE + ".deleteReservation", reservation_code);
    }
}
