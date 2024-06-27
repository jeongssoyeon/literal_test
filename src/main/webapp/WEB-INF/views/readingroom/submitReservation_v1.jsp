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
                <h2>이용권</h2>
                <div class="options">
                    <button type="button" class="option">2 시간<br>4,000 원</button>
                    <button type="button" class="option">4 시간<br>6,000 원</button>
                    <button type="button" class="option">6 시간<br>8,000 원</button>
                    <button type="button" class="option">종일 권<br>10,000 원</button>
                </div>
                <h2>시작 시간</h2>
                <div class="times">
                    <button type="button" class="time">09 : 00</button>
                    <button type="button" class="time">10 : 00</button>
                    <button type="button" class="time">11 : 00</button>
                    <button type="button" class="time">12 : 00</button>
                    <button type="button" class="time">13 : 00</button>
                    <button type="button" class="time">14 : 00</button>
                    <button type="button" class="time">15 : 00</button>
                    <button type="button" class="time">16 : 00</button>
                </div>
                <button type="submit" class="btn-primary" formmethod="post" formaction="${pageContext.request.contextPath}/paymentForm">결제 하기</button>
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
        let selectedOption = null;
        let selectedTime = null;

        options.forEach(option => {
            option.addEventListener("click", function() {
                if (selectedOption) {
                    selectedOption.classList.remove("selected");
                }
                selectedOption = this;
                selectedOption.classList.add("selected");
            });
        });

        times.forEach(time => {
            time.addEventListener("click", function() {
                if (selectedTime) {
                    selectedTime.classList.remove("selected");
                }
                selectedTime = this;
                selectedTime.classList.add("selected");
            });
        });
    });
</script>
