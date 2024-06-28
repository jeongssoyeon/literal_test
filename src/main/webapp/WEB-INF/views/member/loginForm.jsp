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

    .login-form-wrapper {
        width: 400px;
        padding: 40px;
        box-sizing: border-box;
        margin: 0 auto;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .login-form-wrapper > h3 {
        font-size: 24px;
        color: #6A24FE;
        text-align: center;
        margin-bottom: 20px;
    }

    #loginfrm input[type="email"],
    #loginfrm input[type="password"],
    #loginfrm input[type="submit"] {
        width: 100%;
        height: 48px;
        padding: 0 10px;
        box-sizing: border-box;
        margin-bottom: 16px;
        border-radius: 6px;
        background-color: #F8F8F8;
        border: 1px solid #ccc;
    }

    #loginfrm input::placeholder {
        color: #D2D2D2;
    }

    #loginfrm input[type="submit"] {
        color: #fff;
        font-size: 16px;
        background-color: #6A24FE;
        margin-top: 20px;
        cursor: pointer;
    }

    #loginfrm input[type="checkbox"] {
        margin-right: 8px;
    }

    .login-links {
        text-align: center;
        margin-top: 10px;
    }

    .login-links a {
        color: #6A24FE;
        text-decoration: none;
        margin: 0 5px;
    }

    .login-links a:hover {
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
    <div class="login-form-wrapper">
        <h3>로그인</h3>
        <form name="loginfrm" id="loginfrm" action="${pageContext.request.contextPath}/member/login" method="post">
            <table class="table" style="width: 100%; margin: 0 auto;">
                <tr>
                    <td colspan="2">
                        <input type="email" name="email" id="email" value="${cookie.c_id.value}" placeholder="이메일" maxlength="50" required>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="password" name="password" id="passwd" placeholder="비밀번호" maxlength="50" required>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label>
				            <input type="checkbox" name="c_id" value="SAVE" 
				            <c:if test="${cookie.c_id != null && not empty cookie.c_id.value}">checked</c:if>>
				            이메일 저장
				        </label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="로그인">
                    </td>
                </tr>
            </table>
            <div class="login-links">
                <a href="${pageContext.request.contextPath}/member/agreement">[회원가입]</a>
                <a href="${pageContext.request.contextPath}/member/findID">[이메일/비밀번호찾기]</a>
            </div>
        </form>
         <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
    </div>
</div>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>
