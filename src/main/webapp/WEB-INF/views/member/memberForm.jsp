<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/memberForm.css">

<style>
/* memberForm.css */
.member-form-wrapper {
    width: 600px;
    padding: 40px;
    box-sizing: border-box;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.member-form-wrapper > h3 {
    font-size: 24px;
    color: #6A24FE;
    text-align: center;
    margin-bottom: 20px;
}

#memberForm input[type="text"],
#memberForm input[type="email"],
#memberForm input[type="password"],
#memberForm input[type="date"],
#memberForm input[type="submit"],
#memberForm input[type="button"],
#memberForm select {
    width: 100%;
    height: 48px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 16px;
    border-radius: 6px;
    background-color: #F8F8F8;
    border: 1px solid #ccc;
    transition: background-color 0.3s, color 0.3s;
}

#memberForm input::placeholder {
    color: #D2D2D2;
}

#memberForm input[type="submit"],
#memberForm input[type="button"] {
    color: #fff;
    font-size: 16px;
    background-color: #6A24FE;
    cursor: pointer;
    width: auto; /* 버튼 너비 자동 조정 */
    padding: 10px 20px; /* 버튼 안쪽 여백 조정 */
    transition: background-color 0.3s, color 0.3s;
}

#memberForm input[type="button"] {
    background-color: #ccc;
}

#memberForm input[type="button"]:hover {
    background-color: #4A18CE; /* 호버 시 배경색 변경 */
    color: #fff; /* 호버 시 텍스트 색상 변경 */
}

.button-wrapper {
    text-align: center;
    display: flex;
    justify-content: center;
    gap: 10px; /* 버튼 사이의 간격 조정 */
}

#wrap {
    width: 100%;
    max-width: 600px; /* form의 최대 너비에 맞추기 */
    border: 1px solid #ccc;
    padding: 10px;
    margin-top: 10px;
    display: none;
    position: relative;
    z-index: 1000;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#memberForm input[type="radio"] {
    margin-right: 10px;
}

#memberForm label {
    margin-right: 20px;
}
</style>

<!-- 본문 시작 memberForm.jsp -->

<div class="member-form-wrapper">
    <h3>회원가입</h3>
    <form name="memberForm" id="memberForm" method="post" action="${pageContext.request.contextPath}/member/register" onsubmit="return memberCheck()">
        <table class="table">
            <tr>
                <td>이름</td>
                <td><input type="text" name="name" id="name" size="20" maxlength="20" required></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><input type="text" name="phone_number" id="phone_number" size="15" maxlength="14" required></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>
                    <input type="email" name="email" id="email" size="30" maxlength="50" required>
                    <input type="button" value="Email중복확인" onclick="emailCheck()" class="small-button">
                </td>
            </tr>
            <tr>
                <td>우편번호</td>
                <td>
                    <input type="text" name="zipcode" id="zipcode" size="7" readonly required>
                    <input type="button" value="주소찾기" onclick="DaumPostcode()" class="small-button">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="wrap"></div>
                </td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input type="text" name="address1" id="address1" size="45" readonly required></td>
            </tr>
            <tr>
                <td>상세주소</td>
                <td><input type="text" name="address2" id="address2" size="45" required></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="password" id="password" size="10" maxlength="10" required></td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" name="repassword" id="repassword" size="10" maxlength="10" required></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input type="date" name="birth_date" id="birth_date" required></td>
            </tr>
            <tr>
                <td>은행</td>
                <td>
                    <select name="bank" id="bank" required>
                        <option value="">은행 선택</option>
                        <option value="신한">신한</option>
                        <option value="국민">국민</option>
                        <option value="농협">농협</option>
                        <option value="우리">우리</option>
                        <option value="케이뱅크">케이뱅크</option>
                        <option value="카카오뱅크">카카오뱅크</option>
                        <option value="토스뱅크">토스뱅크</option>
                        <option value="기업">기업</option>
                        <option value="우체국">우체국</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>계좌번호</td>
                <td><input type="text" name="account_number" id="account_number"></td>
            </tr>
            <tr>
                <td>회원 구분</td>
                <td>
                    <label><input type="radio" name="type_code" value="1" checked> 일반회원</label>
                    <label><input type="radio" name="type_code" value="2"> 판매자</label>
                </td>
            </tr>
        </table>
        <br>
        <div class="button-wrapper">
            <input type="submit" value="회원가입" class="btn btn-primary">
            <input type="button" value="취소" class="btn btn-primary" onclick="javascript:history.back()">
        </div>
    </form>
</div>

<!-- ----- DAUM 우편번호 API 시작 ----- -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        element_wrap.style.display = 'none';
    }//foldDaumPostcode() end

    function DaumPostcode() {
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("address2").value = extraAddr;
                } else {
                    document.getElementById("address2").value = '';
                }

                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = addr;
                document.getElementById("address2").focus();

                element_wrap.style.display = 'none';
                document.body.scrollTop = currentScroll;
            },
            onresize: function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width: '100%',
            height: '100%'
        }).embed(element_wrap);

        element_wrap.style.display = 'block';
    }//DaumPostcode() end
    
    <!-- ----- DAUM 우편번호 API 종료----- -->
    
    <!-- email 중복확인 -->   
    function emailCheck() {
        window.open("${pageContext.request.contextPath}/member/emailCheckForm", "emailCheckForm", "width=500, height=300, resizable=no, scrollbars=no");
    }//emailCheck() end


    
</script>

<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>
