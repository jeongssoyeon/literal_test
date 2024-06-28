<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp"%>

<!-- 본문 시작 -->

<style>
    .center-div {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 80vh; /* 화면의 세로 가운데 정렬을 위해 높이 설정 */
    }

    .find-id-form-wrapper {
        width: 400px;
        padding: 40px;
        box-sizing: border-box;
        margin: 0 auto;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .find-id-form-wrapper > h3 {
        font-size: 24px;
        color: #6A24FE;
        text-align: center;
        margin-bottom: 20px;
    }

    #findIDfrm input[type="text"],
    #findIDfrm input[type="email"],
    #findIDfrm input[type="submit"],
    #findIDfrm input[type="button"] {
        width: 100%;
        height: 48px;
        padding: 0 10px;
        box-sizing: border-box;
        margin-bottom: 16px;
        border-radius: 6px;
        background-color: #F8F8F8;
        border: 1px solid #ccc;
    }

    #findIDfrm input::placeholder {
        color: #D2D2D2;
    }

    #findIDfrm input[type="submit"],
    #findIDfrm input[type="button"] {
        color: #fff;
        font-size: 16px;
        background-color: #6A24FE;
        margin-top: 20px;
        cursor: pointer;
        width: auto; /* 버튼 너비 자동 조정 */
        padding: 10px 20px; /* 버튼 안쪽 여백 조정 */
        transition: background-color 0.3s, color 0.3s;
    }

    #findIDfrm input[type="button"] {
        background-color: #ccc;
    }

    #findIDfrm input[type="button"]:hover {
        background-color: #999; /* 호버 시 배경색 변경 */
    }

    .button-wrapper {
        text-align: center;
        display: flex;
        justify-content: center;
        gap: 10px; /* 버튼 사이의 간격 조정 */
    }

    .find-id-links {
        text-align: center;
        margin-top: 10px;
    }

    .find-id-links a {
        color: #6A24FE;
        text-decoration: none;
        margin: 0 5px;
    }

    .find-id-links a:hover {
        text-decoration: underline;
    }
    
      .alert {
        text-align: center;
        margin-top: 10px;
        padding: 10px;
        border-radius: 6px;
    }

    .alert-danger {
        color: #721c24;
        background-color: #f8d7da;
        border-color: #f5c6cb;
    }

    .alert-success {
        color: #155724;
        background-color: #d4edda;
        border-color: #c3e6cb;
    }
     
</style>

<div class="center-div">
    <div class="find-id-form-wrapper">
        <h3>이메일 찾기</h3>
        <form name="findIDfrm" id="findIDfrm" method="post" action="${pageContext.request.contextPath}/member/findIDProc">
            <table class="table" style="width: 100%; margin: 0 auto;">
                <tr>
                    <td colspan="2">
                        <input type="text" name="mname" id="mname" placeholder="이름" maxlength="50" required>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="text" name="phone_number" id="phone_number" placeholder="전화번호" maxlength="50" required>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="button-wrapper">
                        <input type="submit" value="이메일 찾기">
                        <input type="button" value="비밀번호 찾기" onclick="location.href='${pageContext.request.contextPath}/member/findPW'">
                    </td>
                </tr>
            </table>
            <div class="find-id-links">
                <a href="${pageContext.request.contextPath}/member/login">[로그인]</a>
                <a href="${pageContext.request.contextPath}/member/agreement">[회원가입]</a>
                <a href="${pageContext.request.contextPath}/">[메인페이지]</a>
            </div>
        </form>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
    </div>
</div>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>
