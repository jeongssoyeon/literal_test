<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이메일 중복확인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .center-div {
            text-align: center;
        }
        input[type="text"] {
            width: 70%;
            padding: 8px;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            padding: 8px 16px;
            background-color: #6A24FE;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        input[type="submit"]:hover {
            background-color: #4A18CE;
        }
    </style>
</head>
<body>
    <div class="center-div">
        <h3>이메일 중복확인</h3>
        <form action="${pageContext.request.contextPath}/member/emailCheck" method="post" onsubmit="return blankCheck()">
            이메일: <input type="text" name="email" id="email" size="30" maxlength="50" autofocus>
            <input type="submit" value="중복확인">
        </form>
    </div>

    <script>
        function blankCheck() {
            let email = document.getElementById("email").value;
            email = email.trim();
            if(email.indexOf('@') == -1){
                alert("이메일을 확인해 주세요.");
                document.getElementById("email").focus();
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
