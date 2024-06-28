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
                <p>지점 : ${branch}</p>
                <p>좌석 번호 : ${seat}</p>
                <!-- 결제 옵션 추가 -->
                <form id="paymentForm" action="${pageContext.request.contextPath}/paymentForm" method="post">
                    <input type="hidden" name="branch" value="${branch}">
                    <input type="hidden" name="seat" value="${seat}">
                    <input type="hidden" name="totalAmount" id="totalAmount">
                    <h2>이용권</h2>
                    <div class="options">
                        <button type="button" class="option" data-usageTime="2시간" data-amount="4000">2 시간<br>4,000 원</button>
                        <button type="button" class="option" data-usageTime="4시간" data-amount="6000">4 시간<br>6,000 원</button>
                        <button type="button" class="option" data-usageTime="6시간" data-amount="8000">6 시간<br>8,000 원</button>
                        <button type="button" class="option" data-usageTime="종일권" data-amount="10000">종일권<br>10,000 원</button>
                    </div>
                    <input type="hidden" name="usageTime" id="selectedUsageTime">
                    <h2>시작 시간</h2>
                    <div class="times">
                        <button type="button" class="time" data-startTime="09:00">09 : 00</button>
                        <button type="button" class="time" data-startTime="10:00">10 : 00</button>
                        <button type="button" class="time" data-startTime="11:00">11 : 00</button>
                        <button type="button" class="time" data-startTime="12:00">12 : 00</button>
                        <button type="button" class="time" data-startTime="13:00">13 : 00</button>
                        <button type="button" class="time" data-startTime="14:00">14 : 00</button>
                        <button type="button" class="time" data-startTime="15:00">15 : 00</button>
                        <button type="button" class="time" data-startTime="16:00">16 : 00</button>
                    </div>
                    <input type="hidden" name="startTime" id="selectedStartTime">
                    <button type="submit" class="btn-primary">결제하기</button>
                </form>
            </div>
        </div>
    </div>
</main>
<%@ include file="../footer.jsp"%>

<!-- JavaScript 코드 -->
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