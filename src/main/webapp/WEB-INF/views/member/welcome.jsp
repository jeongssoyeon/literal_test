<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
/* 로그인 폼에서 사용한 기본 스타일을 재사용 */
.center-div {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 80vh;
}

.welcome-wrapper {
    width: 600px;
    padding: 40px;
    box-sizing: border-box;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.welcome-wrapper > h3 {
    font-size: 24px;
    color: #6A24FE;
    text-align: center;
    margin-bottom: 20px;
}

.user-info, .next-steps {
    text-align: left;
    margin-top: 20px;
}

.button-wrapper {
    text-align: center;
    margin-top: 20px;
}

.button-wrapper input {
    padding: 10px 20px;
    border: none;
    border-radius: 6px;
    background-color: #6A24FE;
    color: white;
    font-size: 16px;
    cursor: pointer;
    margin: 5px;
}

.button-wrapper input:hover {
    background-color: #4A18CE;
}
</style>

<!-- 본문 시작 -->
<div class="center-div">
    <div class="welcome-wrapper">
        <h3>환영합니다, ${member.name}님!</h3>
        <p>회원가입이 성공적으로 완료되었습니다. 이제 다양한 서비스를 이용하실 수 있습니다.</p>
        <div class="user-info">
            <h4>사용자 정보</h4>
            <p><strong>이메일:</strong> ${member.email}</p>
            <p><strong>전화번호:</strong> ${member.phone_number}</p>
            <p><strong>주소:</strong> ${member.address1} ${member.address2}</p>
            <p><strong>생년월일:</strong> ${member.birth_date}</p>
        </div>
        <div class="button-wrapper">
            <input type="button" value="로그인" onclick="location.href='${pageContext.request.contextPath}/member/login'">
            <input type="button" value="메인페이지" onclick="location.href='${pageContext.request.contextPath}/'">
        </div>
    </div>
</div>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>
