<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="/js/jquery-3.7.1.min.js"></script>
    <link href="/css/style.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">  <!-- 구글이모티콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<title>index.jsp</title>
</head>
<body>

	<!-- header 시작 -->
    <header>
        <div class="header-container">
            <div class="logo">
                <h1>LITERAL</h1>
            </div>
            <div class="search-bar">
                <input type="text" placeholder="검색어를 입력해주세요">
				<i class="material-icons search-icon">search</i>
            </div>
            <div class="header-links">
            	<a href="#"><i class="fas fa-user"></i> LOGIN</a>
			    <a href="#"><i class="fas fa-user-circle"></i> MYPAGE</a>
			    <a href="#"><i class="fas fa-shopping-cart"></i> CART</a>
            </div>
        </div>
    </header>
    <!-- header 끝 -->
    
    
    <!-- 메인 카테고리 시작 -->
    <nav>
        <ul>
        	<li><a href="#"><i class="fas fa-home home-icon"></i></a></li>
            <li><a href="#">서점</a></li>
            <li><a href="#">공지사항</a></li>
            <li><a href="#">열람실</a></li>
            <li><a href="#">지점안내</a></li>
            <li><a href="#">이벤트</a></li>
        </ul>
    </nav>
    <!-- 메인 카테고리 끝 -->
    
    
    <!-- Content 시작 -->
    <main>
        <div class="banner">
            <h2>어떤 책을 좋아하세요?</h2>
            <p>어떤 분야 나와 맞을까? 책 퀴즈로 진단해보세요.</p>
            <img src="banner.png" alt="Banner Image">
        </div>
        
        <div class="best-books">
            <h2>BEST</h2>
            <div class="books">
                <div class="book">
                    <img src="./images/gray.jpg" alt="Book 1">
                    <p>회색인간</p>
                    <span>11,700원</span>
                </div>
                <div class="book">
                    <img src="./images/oneday.jpg" alt="Book 2">
                    <p>하루한장</p>
                    <span>11,000원</span>
                </div>
                <div class="book">
                    <img src="./images/stoner.jpg" alt="Book 3">
                    <p>스토너</p>
                    <span>11,900원</span>
                </div>
            </div>
            <button>View More →</button>
        </div>
        
        <div class="today-book">
            <h2>오늘의 추천도서</h2>
            <div class="books">
                <div class="book">
                    <img src="./images/mosoon.jpg" alt="Book 4">
                    <p>모순</p>
                    <span>11,200원</span>
                </div>
                <div class="book">
                    <img src="./images/cal.jpg" alt="Book 5">
                    <p>칼의 노래</p>
                    <span>13,000원</span>
                </div>
                <div class="book">
                    <img src="./images/kind.jpg" alt="Book 6">
                    <p>나는 다정한 <br>관찰자가<br> 되기로 했다</p>
                    <span>15,000원</span>
                </div>
            </div>
            <button>View More →</button>
        </div>
        <!-- Content 끝 -->
    </main>
    
    
    <!-- Footer -->
    <footer>
        <div class="footer-container">
            <div class="footer-logo">
                <h1>LITERAL</h1>
                <p>LITERAL is <br>a used novel bookstore.</p>
            </div>
            <div class="footer-info">
	            <p>대표 : LITERAL</p>
	            <p>주소 : 서울특별시 강남구 테헤란로 124 4층(역삼동, 삼원타워)</p>
	            <p>사업자등록번호 : 172-87-02395</p>
	            <p>TEL : 02-6255-8002</p>
	            <p>이메일 : admin@literal.co.kr</p>
        	</div>
            <div class="footer-links">
                <a href="#">HOME</a>
                <a href="#">ABOUT US</a>
                <a href="#">BOOKS</a>
                <a href="#">CONTACT US</a>
            </div>
        </div>
        <div class="footer-bottom">
            <p>Copyright © LITERAL Corp. All Rights Reserved.</p>
        </div>
    </footer>
    
    
</body>
</html>

    