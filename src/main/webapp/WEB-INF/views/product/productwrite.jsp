<!-- prductwrite.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/side_menu.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>


<style>
	/* Custom button style */
	.btn-newproduct {
	    background-color: #FA8072;
	    border: none;
	    color: black;
	    padding: 10px 20px;
	    cursor: pointer;
	    font-size: 16px;
	}
	.btn-newproduct:hover {
	    background-color: #FF4500;
	}
	.table-product {
		 text-align: center;
		 width: 100%;
		 margin-top: 50px;
		 padding: 30px;
	}
</style>

<script>
	document.addEventListener('DOMContentLoaded', function() {
	    // 모달 열림 상태를 추적하기 위한 변수
	    var modalOpened = false;
	
	    // Select 요소 클릭 시 모달을 띄움
	    var gradeCodeSelect = document.getElementById('grade_code');
	    gradeCodeSelect.addEventListener('click', function(event) {
	        // 모달이 열려있지 않을 때만 모달을 띄움
	        if (!modalOpened) {
	            var gradeGuideModal = new bootstrap.Modal(document.getElementById('gradeGuideModal'));
	            gradeGuideModal.show();
	            modalOpened = true;
	        }
	        event.stopPropagation(); // 이벤트 전파 중단
	    });
	
	    // 모달이 닫힐 때 모달 열림 상태를 초기화
	    var modalElement = document.getElementById('gradeGuideModal');
	    modalElement.addEventListener('hidden.bs.modal', function () {
	        modalOpened = false; // 모달 열림 상태를 초기화
	        gradeCodeSelect.blur(); // select 요소의 포커스를 제거하여 무한 반복 방지
	    });
	
	    // 할인율 정보 객체
	    var discountRates = {
	        0: 0,    // 선택 시 할인 없음
	        1: 0.3,  // 최상 등급 시 30% 할인
	        2: 0.4,  // 상 등급 시 40% 할인
	        3: 0.5   // 중 등급 시 50% 할인
	    };
	
	    // 판매가 자동 계산
	    var originalPriceInput = document.getElementById('original_price');
	    var salePriceInput = document.getElementById('sale_price');
	    
	    // 등급 코드 선택 시 판매가 계산
	    gradeCodeSelect.addEventListener('change', function() {
	        var gradeCode = parseInt(gradeCodeSelect.value); // 선택된 등급 코드 값
	        var originalPrice = parseFloat(originalPriceInput.value) || 0; // 입력된 정가 값, 기본값 0
	        var discountRate = discountRates[gradeCode]; // 선택된 등급 코드에 따른 할인율
	        var salePrice = originalPrice * (1 - discountRate); // 할인율 적용한 판매가 계산
	        var roundedSalePrice = Math.floor(salePrice / 10) * 10; // 10의 자리로 내림하여 정수로 변환
            salePriceInput.value = roundedSalePrice; // 계산된 판매가를 소수점 2자리까지 표시하여 입력 필드에 설정
	    });
	    
	    // 정가 입력 시 판매가 계산
	    originalPriceInput.addEventListener('input', function() {
	        var gradeCode = parseInt(gradeCodeSelect.value); // 선택된 등급 코드 값
	        var originalPrice = parseFloat(originalPriceInput.value) || 0; // 입력된 정가 값, 기본값 0
	        var discountRate = discountRates[gradeCode]; // 선택된 등급 코드에 따른 할인율
	        var salePrice = originalPrice * (1 - discountRate); // 할인율 적용한 판매가 계산
	        var roundedSalePrice = Math.floor(salePrice / 10) * 10; // 10의 자리로 내림하여 정수로 변환
            salePriceInput.value = roundedSalePrice; // 계산된 판매가를 소수점 2자리까지 표시하여 입력 필드에 설정
	    });
	 	
	    // 폼 유효성 검사
	    var form = document.getElementById('fmproduct'); // 폼 요소를 가져옵니다.
	    form.addEventListener('submit', function(event) { // 폼 제출 이벤트를 리스닝합니다.
	        var isValid = true; // 폼 유효성 상태를 추적하는 변수입니다.

	        // 필수 입력 필드의 ID 목록입니다.
	        var requiredFields = ['book_title', 'author', 'original_price', 'img'];

	        // 각 필수 입력 필드를 순회하면서 값을 확인합니다.
	        requiredFields.forEach(function(fieldId) {
	            var field = document.getElementById(fieldId); // 필드를 가져옵니다.

	            // 필드가 비어있는지 확인합니다.
	            if (!field.value) {
	                isValid = false; // 필드가 비어있으면 isValid를 false로 설정합니다.
	                field.classList.add('is-invalid'); // 필드에 'is-invalid' 클래스를 추가하여 강조합니다.
	            } else {
	                field.classList.remove('is-invalid'); // 필드가 채워져 있으면 'is-invalid' 클래스를 제거합니다.
	            }
	        });

	        // 필수 입력 필드 중 하나라도 비어있으면 폼 제출을 막고 경고 메시지를 표시합니다.
	        if (!isValid) {
	            event.preventDefault(); // 폼 제출을 막습니다.
	            alert('모든 필수 항목을 입력해주세요.'); // 경고 메시지를 표시합니다.
	        }
	    });
	});
</script>

<!--사이드 메뉴 시작  -->
<div class="contents_inner">
    <div class="sidebar">
        <h2>국내도서</h2>
        <ul>
            <li><a href="#">고전소설</a></li>
            <li><a href="#">공포/미스테리소설</a></li>
            <li><a href="#">역사소설</a></li>
            <li><a href="#">판타지/과학소설</a></li>
            <li><a href="#">로맨스소설</a></li>
            <li><a href="#">무협소설</a></li>
            <li><a href="#">청소년소설</a></li>
            <li><a href="#">웹/드라마/영화소설</a></li>
        </ul>
    </div> <!-- <div class="sidebar"> end -->
 <!--사이드 메뉴 끝  -->
 <!-- 본문 시작 -->
 
	<div class="main-content">
		<div class="row">
			<div class="col-sm-12">
			<h3 class="productlist text-center"> [상 품 등 록] </h3>
			
			<form name="fmproduct" id="fmproduct" method="post" action="insert" enctype="multipart/form-data">
			<table class="table-product">
			<tbody>
				<tr>
					<td> 책 제목 </td> <!-- 필수 -->
					<td><input type="text" name="book_title" id="book_title" class="form-control"></td>
				</tr>
				<tr>
					<td> 작가 </td> <!-- 필수 -->
					<td><input type="text" name="author" id="author" class="form-control"></td>
				</tr>
				<tr>
					<td> 장르 </td>
					<td>
						<select name="genre_code" id="genre_code" class="form-control">
							<option value="0"> 선택 </option>
							<option value="G"> 고전 </option>
							<option value="M"> 공포 / 미스테리 </option>
							<option value="H"> 역사 </option>
							<option value="S"> 판타지 / 과학 </option>
							<option value="R"> 로맨스 </option>
							<option value="P"> 무협 </option>
							<option value="T"> 청소년 </option>
							<option value="W"> 웹 / 드라마 / 영화 </option>					
						</select>
					</td>															
				<tr>
				<tr>
					<td> 상세 정보 </td> <!-- 써머 노트 / 출판사, 출판일, 판매자 책소개 -->
					<td>
						<textarea rows="8" name="book_detail" id="book_detail" class="form-control">출판사 : &#10;출판일 : &#10;책 소개 : </textarea>					
					</td>
				</tr>		
				<tr>
					<td> 상품 등급 코드 </td>
					<td>
						<select name="grade_code" id="grade_code" class="form-control">
							<option value="0"> 선택 </option>
							<option value="1"> 최상 </option>
							<option value="2"> 상 </option>
							<option value="3"> 중 </option>
						</select>
					</td>															
				<tr>
					<td> 정가 </td> <!-- 필수 -->
					<td><input type="number" name="original_price" id="original_price" class="form-control"></td>
				</tr>
				<tr>
					<td> 판매가 </td>
                	<td><input type="number" name="sale_price" id="sale_price" class="form-control" readonly></td>
				</tr>
				<tr>
					<td> 이미지 </td> <!-- 필수 -->
					<td><input type="file" name="img" id="img" class="form-control"></td>
				</tr>			
				 <tr>
					<td colspan="2" align="center">
					    <input type="submit" value="상품 등록" class="btn btn-newproduct"> 
					</td>
			    </tr>  
			</tbody>
			</table>			
			</form>
		
	    	</div><!-- col end -->
	   	</div><!-- row end -->
	</div> 	
	
	<!-- Modal -->
    <div class="modal fade" id="gradeGuideModal" tabindex="-1" role="dialog" aria-labelledby="gradeGuideModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="gradeGuideModalLabel"> 중고 품질 판정 가이드 </h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <table class="table table-bordered" style="text-align: center">
              <thead>
	            <tr>
	              <th>구분</th>
	              <th>현 상태</th>
	              <th>표지</th>
	              <th>책등 / 책배</th>
	              <th>내부 / 제본상태</th>
	            </tr>
	          </thead>
	          <tbody>
	            <tr>
	              <td>최상</td>
	              <td>새것에 가까운 책</td>
	              <td>변색 없음, 찢어진 흔적 없음, 담뱃재 흔적 없음, 낙서 없음, 얼룩 없음, 도서 결표지 있음</td>
	              <td>변색 없음, 낙서 없음, 담뱃재 흔적 없음, 얼룩 없음</td>
	              <td>변색 없음, 낙서 없음, 변형 없음, 접힌 흔적 없음, 제본 탈착 없음</td>
	            </tr>
	            <tr>
	              <td>상</td>
	              <td>약간의 사용감은 있으나 깨끗한 책</td>
	              <td>희미한 변색이나 작은 얼룩이 있음, 찢어진 흔적 없음, 약간의 모서리 해짐, 낙서 없음, 도서 결표지 있음</td>
	              <td>희미한 변색이나 작은 얼룩이 있음, 약간의 담뱃재 흔적 있음, 낙서 없음</td>
	              <td>변색 없음, 낙서 없음, 변형 없음, 아주 약간의 접힌 흔적 있음, 얼룩 없음, 제본 탈착 없음</td>
	            </tr>
	            <tr>
	              <td>중</td>
	              <td>사용감이 많으며 현 느낌이 나는 책</td>
	              <td>전체적인 변색, 모서리 해짐 있음, 오염 있음, 2cm 이하의 찢어짐 있음, 낙서 있음(이름 포함)</td>
	              <td>전체적인 변색, 모서리 해짐 있음, 오염 있음, 래핑 훼손 있음</td>
	              <td>변색 있음, 낙서 있음, 2cm 이하 찢어짐 있음, 5쪽 이하 필기 및 풀칠 흔적 있음, 제본 탈착 없음, 본문 읽기에 지장 없는 부록 없음</td>
	            </tr>
	            <tr>
	              <td>매입 불가</td>
	              <td>독서 및 이용에 지장이 있는 책, 중증 도서 / 비매품</td>
	              <td>2cm 초과한 찢어진 흔적 있음, 2cm 초과한 크기의 얼룩 있음</td>
	              <td>2cm 초과한 찢어진 흔적 있음, 5쪽 초과한 필기 및 풀칠 얼룩 있음, 낙장 등 제본 불량, 분책된 경우</td>
	              <td>낙장 등 제본 불량, 분책된 경우</td>
	            </tr>
	          </tbody>
	        </table>
	      </div>
	    </div>
	  </div>
	</div> <!-- 모달 끝 -->
   
<!-- 본문 끝 -->
</div> <!-- <div class="contents_inner"> end -->
	

<%@ include file="../footer.jsp"%>