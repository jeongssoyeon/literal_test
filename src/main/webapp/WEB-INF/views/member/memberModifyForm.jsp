<!-- template.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="./css/side_menu.css">
 <main>
 		<!--사이드 메뉴 시작  -->
        <div class="contents_inner">
            <div class="sidebar">
                <h2>마이페이지</h2>
                <ul>
                    <li><a href="#">회원정보</a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                </ul>
            </div>
          </div>
  		 <!--사이드 메뉴 끝  -->
	<!-- 본문 시작 -->

<style>
    .center-div {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 80vh;
    }

    .modify-form-wrapper {
        width: 600px;
        padding: 40px;
        box-sizing: border-box;
        margin: 0 auto;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .modify-form-wrapper > h3 {
        font-size: 24px;
        color: #6A24FE;
        text-align: center;
        margin-bottom: 20px;
    }

    #memberModifyForm input[type="text"],
    #memberModifyForm input[type="email"],
    #memberModifyForm input[type="password"],
    #memberModifyForm input[type="date"],
    #memberModifyForm input[type="submit"],
    #memberModifyForm input[type="button"],
    #memberModifyForm select {
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

    #memberModifyForm input::placeholder {
        color: #D2D2D2;
    }

    #memberModifyForm input[type="submit"],
    #memberModifyForm input[type="button"] {
        color: #fff;
        font-size: 16px;
        background-color: #6A24FE;
        cursor: pointer;
        width: auto;
        padding: 10px 20px;
        transition: background-color 0.3s, color 0.3s;
    }

    #memberModifyForm input[type="button"] {
        background-color: #ccc;
    }

    #memberModifyForm input[type="button"]:hover {
        background-color: #4A18CE;
        color: #fff;
    }

    .button-wrapper {
        text-align: center;
        display: flex;
        justify-content: center;
        gap: 10px;
    }

    #wrap {
        width: 100%;
        max-width: 600px;
        border: 1px solid #ccc;
        padding: 10px;
        margin-top: 10px;
        display: none;
        position: relative;
        z-index: 1000;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
</style>

<div class="center-div">
    <div class="modify-form-wrapper">
        <h3>회원 정보 수정</h3>
        <form name="memberModifyForm" id="memberModifyForm" method="post" action="${pageContext.request.contextPath}/member/modify" onsubmit="return memberCheck()">
            <table class="table">
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" id="name" size="20" maxlength="20" value="${member.name}" required></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text" name="phone_number" id="phone_number" size="15" maxlength="14" value="${member.phone_number}" required></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="email" name="email" id="email" size="30" maxlength="50" value="${member.email}" readonly></td>
                </tr>
                <tr>
                    <td>우편번호</td>
                    <td>
                        <input type="text" name="zipcode" id="zipcode" size="7" value="${member.zipcode}" readonly onclick="DaumPostcode()">
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
                    <td><input type="text" name="address1" id="address1" size="45" value="${member.address1}" readonly required></td>
                </tr>
                <tr>
                    <td>상세주소</td>
                    <td><input type="text" name="address2" id="address2" size="45" value="${member.address2}" required></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="password" id="password" size="10" maxlength="10" value="${member.password}" required></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="repassword" id="repassword" size="10" maxlength="10" value="${member.password}" required></td>
                </tr>
                <tr>
                    <td>생년월일</td>
                    <td><input type="date" name="birth_date" id="birth_date" value="${member.birth_date}" required></td>
                </tr>
                <tr>
                    <td>은행</td>
                    <td>
                        <select name="bank" id="bank" required>
                            <option value="">은행 선택</option>
                            <option value="신한" ${member.bank == '신한' ? 'selected' : ''}>신한</option>
                            <option value="국민" ${member.bank == '국민' ? 'selected' : ''}>국민</option>
                            <option value="농협" ${member.bank == '농협' ? 'selected' : ''}>농협</option>
                            <option value="우리" ${member.bank == '우리' ? 'selected' : ''}>우리</option>
                            <option value="케이뱅크" ${member.bank == '케이뱅크' ? 'selected' : ''}>케이뱅크</option>
                            <option value="카카오뱅크" ${member.bank == '카카오뱅크' ? 'selected' : ''}>카카오뱅크</option>
                            <option value="토스뱅크" ${member.bank == '토스뱅크' ? 'selected' : ''}>토스뱅크</option>
                            <option value="기업" ${member.bank == '기업' ? 'selected' : ''}>기업</option>
                            <option value="우체국" ${member.bank == '우체국' ? 'selected' : ''}>우체국</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>계좌번호</td>
                    <td><input type="text" name="account_number" id="account_number" value="${member.account_number}"></td>
                </tr>
            </table>
            <br>
            <div class="button-wrapper">
                <input type="submit" value="수정" class="btn btn-primary">
                <input type="button" value="취소" class="btn btn-primary" onclick="javascript:history.back()">
            </div>
        </form>
    </div>
</div>

<!-- ----- DAUM 우편번호 API 시작 ----- -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        element_wrap.style.display = 'none';
    }

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
    }

    function memberCheck() {
        var name = document.getElementById('name').value;
        var phoneNumber = document.getElementById('phone_number').value;
        var email = document.getElementById('email').value;
        var zipcode = document.getElementById('zipcode').value;
        var address1 = document.getElementById('address1').value;
        var address2 = document.getElementById('address2').value;
        var password = document.getElementById('password').value;
        var repassword = document.getElementById('repassword').value;
        var birthDate = document.getElementById('birth_date').value;
        var bank = document.getElementById('bank').value;
        var accountNumber = document.getElementById('account_number').value;

        if (!name || !phoneNumber || !email || !zipcode || !address1 || !address2 || !password || !repassword || !birthDate || !bank || !accountNumber) {
            alert('모든 필드를 입력해주세요.');
            return false;
        }

        if (password !== repassword) {
            alert('비밀번호가 일치하지 않습니다. 다시 확인해 주세요.');
            return false;
        }

        if (!validateEmail(email)) {
            alert('올바른 이메일 형식을 입력해주세요.');
            return false;
        }

        if (!validatePhoneNumber(phoneNumber)) {
            alert('올바른 전화번호 형식을 입력해주세요.');
            return false;
        }

        return true;

        function validateEmail(email) {
            var re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return re.test(email);
        }

    }
</script>


	<!-- 본문 끝 -->
		
</main>
<%@ include file="../footer.jsp"%>