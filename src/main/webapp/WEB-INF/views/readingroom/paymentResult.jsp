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
            <h1>결제 완료</h1>
            <hr class="title-divider">
            <div class="payment-summary">
                <p>지점: ${branch}</p>
                <p>좌석 번호: ${seat}</p>
                <p>이용 시간: ${usageTime}</p>
                <p>시작 시간: ${startTime}</p>
                <p>결제 방법: ${paymentMethod}</p>
                <p>결제 금액: ${totalAmount}원</p>
            </div>
        </div>
    </div>
</main>

<%@ include file="../footer.jsp"%>
