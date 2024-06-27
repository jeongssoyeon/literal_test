<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/side_menu.css">

<main>
    <!-- 사이드 메뉴 시작 -->
    <div class="contents_inner">
        <div class="sidebar">
            <h2>열람실 예약</h2>
            <ul>
                <li><a href="${pageContext.request.contextPath}/gn_reservationForm">강남점</a></li>
                <li><a href="${pageContext.request.contextPath}/yh_reservationForm">연희점</a></li>
                <li><a href="${pageContext.request.contextPath}/jn_reservationForm">종로점</a></li>
            </ul>
        </div>
        <!-- 사이드 메뉴 끝 -->
        
        <!-- 본문 시작 -->
        <div class="reservation-form">
            <h1>종로점</h1> <!-- 나중에 지워도 됩니다. -->
            <h2>${branch}</h2>
            <hr class="title-divider">
            <div class="seats">
                <!-- 예약 폼 시작 -->
                <form id="reservationForm" action="${pageContext.request.contextPath}/submitReservation" method="post">
                    <!-- 숨겨진 필드로 지점 정보 전달 -->
                    <input type="hidden" name="branch" value="종로점">
                    <div class="seat-grid">
                        <!-- 좌석 버튼 생성 -->
                        <% for (int i = 1; i <= 15; i++) { %>
                            <button type="button" class="seat" data-seat="<%=i%>"><%=i%><br>남은 시간:</button>
                        <% } %>
                    </div>
                    <!-- 선택된 좌석 정보를 저장할 숨겨진 필드 -->
                    <input type="hidden" name="seat" id="selectedSeat">
                    <!-- 예약하기 버튼 -->
                    <button type="submit" class="btn-primary">예약 하기</button>
                </form>
            </div>
        </div>
        <!-- 본문 끝 -->
    </div>
</main>
<%@ include file="../footer.jsp"%>

<!-- JavaScript 코드 -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const seats = document.querySelectorAll(".seat");
        let selectedSeat = null;

        seats.forEach(seat => {
            seat.addEventListener("click", function() {
                // 이미 선택된 좌석이 있다면 선택 해제
                if (selectedSeat) {
                    selectedSeat.classList.remove("selected");
                }
                // 새로운 좌석 선택
                selectedSeat = this;
                selectedSeat.classList.add("selected");
                // 선택된 좌석 번호를 숨겨진 필드에 저장
                document.getElementById("selectedSeat").value = selectedSeat.getAttribute("data-seat");
            });
        });
    });
</script>
