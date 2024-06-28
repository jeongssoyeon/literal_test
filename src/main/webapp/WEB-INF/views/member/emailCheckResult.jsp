<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이메일 중복확인 결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .center-div {
            text-align: center;
        }
        p {
            margin: 10px 0;
        }
        a {
            color: #6A24FE;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="center-div">
        <h3>이메일 중복확인 결과</h3>
        <p>입력된 이메일: <strong>${email}</strong></p>
        <c:choose>
            <c:when test="${cnt == 0}">
                <p>사용 가능한 이메일입니다.</p>
                <a href="javascript:apply('${email}')">[적용]</a>
                <script>
                    function apply(email) {
                        opener.document.getElementById("email").value = email;
                        window.close();
                    }
                </script>
            </c:when>
            <c:otherwise>
                <p style="color:red">해당 이메일은 사용할 수 없습니다.</p>
            </c:otherwise>
        </c:choose>
        <hr>
        <a href="javascript:history.back()">[다시 검색]</a>
        &nbsp;&nbsp;
        <a href="javascript:window.close()">[창 닫기]</a>
    </div>
</body>
</html>
