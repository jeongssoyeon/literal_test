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
            <div class="payment-summary">
                <p>지점: ${branch}</p>
                <p>좌석 번호: ${seat}</p>
                <p>이용 시간: ${usageTime}</p>
                <p>시작 시간: ${startTime}</p>
                <!-- 추가적인 결제 정보 입력란 -->
                <form action="${pageContext.request.contextPath}/processPayment" method="post">
                    <input type="hidden" name="branch" value="${branch}">
                    <input type="hidden" name="seat" value="${seat}">
                    <input type="hidden" name="usageTime" value="${usageTime}">
                    <input type="hidden" name="startTime" value="${startTime}">
                    <!-- 결제 관련 추가 입력란 -->
                    <label for="paymentMethod">결제 방법:</label>
                    <select id="paymentMethod" name="paymentMethod">
                        <option value="신용카드">신용카드</option>
                        <option value="계좌이체">계좌이체</option>
                    </select><br>
                    <label for="totalAmount">결제 금액:</label>
                    <input type="text" name="totalAmount" id="totalAmount" value="" readonly> <!-- 예시 금액 -->
                    
                    <button type="submit" class="btn-primary">결제 완료</button>
                </form>
            </div>
        </div>
    </div>
</main>
<%@ include file="../footer.jsp"%>

<!-- JavaScript 코드 -->
<script>
    // 이용 시간과 금액 매핑
    const usageTimeToAmount = {
        "2시간": 4000,
        "4시간": 6000,
        "6시간": 8000,
        "종일권": 10000
    };

    // 이용 시간에 따른 금액 설정
    const usageTime = "${usageTime}";
    const totalAmount = usageTimeToAmount[usageTime] || 0;
    document.getElementById("totalAmount").value = totalAmount;

    // 결제 방법에 따른 추가 로직이 필요한 경우 추가 가능
</script>
