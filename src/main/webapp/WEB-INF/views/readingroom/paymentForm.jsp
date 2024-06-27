<!-- template.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/side_menu.css">

 <main>
<!--사이드 메뉴 시작  -->
<div class="contents_inner">
    <div class="sidebar">
        <h2>열람실 예약</h2>
            <ul>
                <li><a href="${pageContext.request.contextPath}/gn_reservationForm">강남점</a></li>
                <li><a href="${pageContext.request.contextPath}/yh_reservationForm">연희점</a></li>
                <li><a href="${pageContext.request.contextPath}/jn_reservationForm">종로점</a></li>
            </ul>
    </div>
 <!--사이드 메뉴 끝  -->
 <!-- 본문 시작 -->
 <main>
    <div class="contents_inner">
        <h1>결제 진행</h1>
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
                    <option value="creditCard">신용카드</option>
                    <option value="bankTransfer">은행 이체</option>
                    <option value="mobilePayment">모바일 결제</option>
                </select><br>
                <label for="totalAmount">결제 금액:</label>
                <input type="text" name="totalAmount" id="totalAmount" value="" readonly> <!-- 예시 금액 -->
                
                <button type="submit" class="btn-primary">결제 완료</button>
            </form>
        </div>
    </div>
</main>
   
<!-- 본문 끝 -->
</div> <!-- <div class="contents_inner"> end -->
	
</main>
<%@ include file="../footer.jsp"%>



