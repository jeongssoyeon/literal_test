<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/side_menu.css">

<main>
    <div class="contents_inner">
        <div class="sidebar">
            <h2>열람실 예약</h2>
            <ul>
                <li><a href="${pageContext.request.contextPath}/gn_reservationForm">강남점</a></li>
                <li><a href="${pageContext.request.contextPath}/yh_reservationForm">연희점</a></li>
                <li><a href="${pageContext.request.contextPath}/jn_reservationForm">종로점</a></li>
            </ul>
        </div>
        <div class="reservation-form">
            <h1>결제하기</h1>
            <hr class="title-divider">
            <div class="payment-options">
                <h2>선택된 좌석 정보</h2>
                <p>지점 : ${branch_code}</p>
                <p>좌석 번호 : ${seat}</p>
                <p>이용 시간 : ${time_code}</p>
                <p>시작 시간 : ${end_time}</p>
                <p>결제 금액 : ${totalAmount}</p>
                <!-- 결제 정보 입력 -->
                <form id="processReservationForm" action="${pageContext.request.contextPath}/processReservation" method="post">
                    <input type="hidden" name="branch_code" value="${branch_code}">
                    <input type="hidden" name="seat" value="${seat}">
                    <input type="hidden" name="time_code" value="${time_code}">
                    <input type="hidden" name="end_time" value="${end_time}">
                    <input type="hidden" name="totalAmount" value="${totalAmount}">
                    <h2>예약자 정보</h2>
                    <div class="form-group">
                        <label for="re_name">이름:</label>
                        <input type="text" id="re_name" name="re_name" required>
                    </div>
                    <div class="form-group">
                        <label for="re_phone">전화번호:</label>
                        <input type="text" id="re_phone" name="re_phone" required>
                    </div>
                    <button type="submit" class="btn-primary">결제 완료</button>
                </form>
            </div>
        </div>
    </div>
</main>
<%@ include file="../footer.jsp"%>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const options = document.querySelectorAll(".option");
        const times = document.querySelectorAll(".time");
        const paymentForm = document.getElementById("paymentForm");
        let selectedOption = null;
        let selectedTime = null;

        options.forEach(option => {
            option.addEventListener("click", function() {
                if (selectedOption) {
                    selectedOption.classList.remove("selected");
                }
                selectedOption = this;
                selectedOption.classList.add("selected");
                document.getElementById("selectedUsageTime").value = selectedOption.getAttribute("data-usageTime");
                document.getElementById("totalAmount").value = selectedOption.getAttribute("data-amount");
            });
        });

        times.forEach(time => {
            time.addEventListener("click", function() {
                if (selectedTime) {
                    selectedTime.classList.remove("selected");
                }
                selectedTime = this;
                selectedTime.classList.add("selected");
                document.getElementById("selectedStartTime").value = selectedTime.getAttribute("data-startTime");
            });
        });

        paymentForm.addEventListener("submit", function(event) {
            if (!selectedOption || !selectedTime) {
                event.preventDefault();
                alert("이용권과 시작 시간을 모두 선택해 주세요.");
            }
        });
    });
</script>
