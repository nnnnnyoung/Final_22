<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>JejuDoroWE</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/animate.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/magnific-popup.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/aos.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/ionicons.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jquery.timepicker.css">


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/flaticon.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/icomoon.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">
</head>
<body>

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href=".">제주<span
				style="color: rgb(190, 175, 175);">도로</span><span
				style="color: rgb(10, 183, 252);">WE</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="." class="nav-link">Home</a></li>
					<li class="nav-item"><a href="reserve?id=${login_id}" class="nav-link">예약</a></li>
	<!-- 				<li class="nav-item"><a href="pricing" class="nav-link">기간대별</a></li> -->
					<li class="nav-item"><a href="cars" class="nav-link">차종별</a></li>
					<li class="nav-item"><a href="boardview" class="nav-link">Car뮤니티</a></li>
					<li class="nav-item"><a href="#" class="nav-link">고객지원</a></li>
					<li class="nav-item active" ><c:choose>
							<c:when test="${login_id!=null}">
								<a href="<%=request.getContextPath()%>/myInfo?id=${login_id}" class="nav-link" style="margin-right:-30px;">${login_id}님</a>
								<li class="nav-item active" ><a href="logout" style="color:#01d28e;" class="nav-link">로그아웃</a></li>
							</c:when>
							<c:otherwise>
								<a data-toggle="modal" href="#myModal" class="nav-link">로그인</a>
							</c:otherwise>
						</c:choose></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 모달시작 -->
   <div class="modal hide" id="myModal">
      <form action="login" method="POST"  style="margin-top: 220px; margin-left: 550px; width: 204px;">
         <div class="member_login_input">
            <input type="text" name="id" placeholder="아이디">
         </div>
         <div class="member_login_input">
            <input type="password" name="pass" placeholder="비밀번호">
         </div>
         <div class="member_login_btn">
            <input type="submit" class="btn btn-secondary" id="btn-login"
               value="로그인"> <input type="button" class="btn btn-secondary"
               value="회원가입" onclick="location.href='memberjoinview'">
         </div>
      </form>
   </div>
   <!-- 모달종료 -->
	<!-- END nav -->

	<div class="hero-wrap ftco-degree-bg"
		style="background-image: url('<%=request.getContextPath()%>/resources/images/bg_1.png');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-start align-items-center justify-content-center">
				<div class="col-lg-8 ftco-animate">
					<div class="text w-100 text-center mb-md-5 pb-md-5">
						<h1 class="mb-4">Fast &amp; Easy Way To Rent A Car</h1>
						<br>
						<p style="font-size: 18px;">제주의 기울어진 산길 확 뚫린 해안도로서 부드러움 실컷 느끼자</p>
						<!--<a href="https://vimeo.com/45830194" class="icon-wrap popup-vimeo d-flex align-items-center mt-4 justify-content-center">
                  <div class="icon d-flex align-items-center justify-content-center">
                     <span class="ion-ios-play"></span>
                  </div>
                  <div class="heading-title ml-5">
                     <span>Easy steps for renting a car</span>
                  </div>-->
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section ftco-no-pt bg-light">
		<div class="container">
			<div class="row no-gutters">
				<div class="col-md-11   featured-top">
					<div class="row no-gutters">
						<div class="col-md-4 d-flex align-items-center">
							<form action="fast_reserve" method="get"
								class="request-form ftco-animate bg-primary"
								style="padding-right: 70px; padding-left: 60px;" id="rent_form">
								<h2 style="padding-left: 60px;">빠른 예약</h2>
								<div class="form-group" id="cartype">
									<label for="" class="label">차량 분류</label> <select
										onchange="car(this)" class="form-control" name="cartype"
										required>
										<option value="">차량선택</option>
										<option value="경차">경차</option>
										<option value="소형차">소형차</option>
										<option value="중형차">중형차</option>
										<option value="준대형차">준대형차</option>
										<option value="대형차">대형차</option>
										<option value="승합차">승합차</option>
										<option value="SUV">SUV</option>
										<option value="전기차">전기차</option>
									</select>
								</div>
								<div class="form-group">
									<label for="" class="label">차량 모델</label> <select id="carlist"
										class="form-control" name="carname" required>
										<option>차량모델을 선택해주세요</option>
										<!-- 선택된 기종의 모델 정보 가져오기 -->
									</select>
								</div>
								<div class="d-flex">
									<div class="form-group mr-2">
										<label for="" class="label">대여일</label> <input type="date"
											class="form-control" id="rentdate" placeholder="Date"
											name="rentdate" required>
									</div>

									<div class="form-group mr-2">
										<label for="" class="label">Pick-up time</label> <select
											name="time_pick" class="form-control" id="time" required>
											<option value="11">오전 11시</option>
											<option value="12">오후 12시</option>
											<option value="13">오후 1시</option>
											<option value="14">오후 2시</option>
											<option value="15">오후 3시</option>
											<option value="16">오후 4시</option>
											<option value="17">오후 5시</option>
											<option value="18">오후 6시</option>
											<option value="19">오후 7시</option>
										</select>

									</div>
								</div>

								<div class="d-flex">
									<div class="form-group mr-2" id="clickk">

										<label for="" class="label">반납일</label> <input type="date"
											class="form-control" id="returndate" placeholder="Date"
											name="returndate" required>
									</div>
								</div>
								<div class="form-group">
									<c:choose>
										<c:when test="${login_id!=null}">
											<input type="button" value="렌트하기"
										class="btn btn-secondary py-3 px-4" id="rent_btn">
										</c:when>
										<c:otherwise>
											<input type="button" value="렌트하기"
										class="btn btn-secondary py-3 px-4" id="rent_btn"
										data-toggle="modal" data-target="#myModal">
										</c:otherwise>
									</c:choose>
									 <input
										type="hidden" value="Y" id="chkD">
										<input type="hidden" value="${login_id}" id="id" name="id"/>
								</div>
							</form>
						</div>
						<div class="col-md-8 d-flex align-items-center">
							<div class="services-wrap rounded-right w-100">
								<h3 class="heading-section mb-4" style="padding-left:160px;">최고의 차를 렌트하는 방법</h3>
								<div class="row d-flex mb-4">
									<div class="col-md-4 d-flex align-self-stretch ftco-animate">
										<div class="services w-100 text-center">
											<div
												class="icon d-flex align-items-center justify-content-center">
												<span class="flaticon-route"></span>
											</div>
											<div class="text w-100">
												<h3 class="heading mb-2">픽업 장소 고르기</h3>
											</div>
										</div>
									</div>
									<div class="col-md-4 d-flex align-self-stretch ftco-animate">
										<div class="services w-100 text-center">
											<div
												class="icon d-flex align-items-center justify-content-center">
												<span class="flaticon-handshake"></span>
											</div>
											<div class="text w-100">
												<h3 class="heading mb-2">최적의 거래 고르기</h3>
											</div>
										</div>
									</div>
									<div class="col-md-4 d-flex align-self-stretch ftco-animate">
										<div class="services w-100 text-center">
											<div
												class="icon d-flex align-items-center justify-content-center">
												<span class="flaticon-rent"></span>
											</div>
											<div class="text w-100">
												<h3 class="heading mb-2"> 렌트카 예약하기</h3>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section ftco-no-pt bg-light">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12 heading-section text-center ftco-animate mb-5">
					<span class="subheading">제주에서 추억을 함께할</span>
					<h2 class="mb-2">RentCars</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="carousel-car owl-carousel">
						<div class="item">
							<div class="car-wrap rounded ftco-animate">
								<div class="img rounded d-flex align-items-end"
									style="background-image: url(<%=request.getContextPath()%>/resources/images/car-1.PNG);">
								</div>
								<div class="text">
									<h2 class="mb-0">
										<a href="#">CASPER</a>
									</h2>
									<div class="d-flex mb-3">
										<span class="cat">경차</span>
										<p class="price ml-auto">
											53,000 <span>/day</span>
										</p>
									</div>
									<p class="d-flex mb-0 d-block">
										<a href="reserve?id=${login_id}" class="btn btn-primary py-2 mr-1">예약하기</a> <a
											href="boardview" class="btn btn-secondary py-2 ml-1">Car뮤니티</a>
									</p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="car-wrap rounded ftco-animate">
								<div class="img rounded d-flex align-items-end"
									style="background-image: url(<%=request.getContextPath()%>/resources/images/car-2.PNG);">
								</div>
								<div class="text">
									<h2 class="mb-0">
										<a href="#">K3 GT</a>
									</h2>
									<div class="d-flex mb-3">
										<span class="cat">소형차</span>
										<p class="price ml-auto">
											83,000 <span>/day</span>
										</p>
									</div>
									<p class="d-flex mb-0 d-block">
										<a href="reserve?id=${login_id}" class="btn btn-primary py-2 mr-1">예약하기</a> <a
											href="boardview" class="btn btn-secondary py-2 ml-1">Car뮤니티</a>
									</p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="car-wrap rounded ftco-animate">
								<div class="img rounded d-flex align-items-end"
									style="background-image: url(<%=request.getContextPath()%>/resources/images/car-3.PNG);">
								</div>
								<div class="text">
									<h2 class="mb-0">
										<a href="#">Carnival</a>
									</h2>
									<div class="d-flex mb-3">
										<span class="cat">승합차</span>
										<p class="price ml-auto">
											150,000 <span>/day</span>
										</p>
									</div>
									<p class="d-flex mb-0 d-block">
										<a href="reserve?id=${login_id}" class="btn btn-primary py-2 mr-1">예약하기</a> <a
											href="boardview" class="btn btn-secondary py-2 ml-1">Car뮤니티</a>
									</p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="car-wrap rounded ftco-animate">
								<div class="img rounded d-flex align-items-end"
									style="background-image: url(<%=request.getContextPath()%>/resources/images/car-4.PNG);">
								</div>
								<div class="text">
									<h2 class="mb-0">
										<a href="#">Santa Fe</a>
									</h2>
									<div class="d-flex mb-3">
										<span class="cat">SUV&RV</span>
										<p class="price ml-auto">
											150,000 <span>/day</span>
										</p>
									</div>
									<p class="d-flex mb-0 d-block">
										<a href="reserve?id=${login_id}" class="btn btn-primary py-2 mr-1">예약하기</a> <a
											href="boardview" class="btn btn-secondary py-2 ml-1">Car뮤니티</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">Car뮤니티</span>
					<h2>후기 게시판</h2>
					<!-- 더보기 > 게시판으로 넘어가기 -->
				</div>
			</div>
			<div class="row d-flex">
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<a href="blog-single.html" class="block-20"
							style="background-image: url('<%=request.getContextPath()%>/resources/images/image_1.jpg');">
						</a>
						<div class="text pt-4">
							<div class="meta mb-3">
								<div>
									<a href="#">2022년 09월 12일</a>
								</div>
								<div>
									<a href="#">Adam</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
							<h3 class="heading mt-2">
								<a href="boardview">The joy of driving</a>
							</h3>
							<p>
								<a href="boardview" class="btn btn-primary">더보기</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<a href="blog-single.html" class="block-20"
							style="background-image: url('<%=request.getContextPath()%>/resources/images/image_2.jpg');">
						</a>
						<div class="text pt-4">
							<div class="meta mb-3">
								<div>
									<a href="#">2020년 12월 07일</a>
								</div>
								<div>
									<a href="#">여행자</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										5</a>
								</div>
							</div>
							<h3 class="heading mt-2">
								<a href="boardview">제주도의 겨울 바다는..</a>
							</h3>
							<p>
								<a href="boardview" class="btn btn-primary">더보기</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry">
						<a href="blog-single.html" class="block-20"
							style="background-image: url('<%=request.getContextPath()%>/resources/images/image_3.jpg');">
						</a>
						<div class="text pt-4">
							<div class="meta mb-3">
								<div>
									<a href="#">2021년 03월 15일</a>
								</div>
								<div>
									<a href="#">유채꽃</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										2</a>
								</div>
							</div>
							<h3 class="heading mt-2">
								<a href="boardview">봄여행은 역시 제주도 드라이브가 최고</a>
							</h3>
							<p>
								<a href="boardview" class="btn btn-primary">더보기</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section "
		style="background-image: url(<%=request.getContextPath()%>/resources/images/bg_3.gif);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row justify-content-end">
				<div
					class="col-md-6 heading-section heading-section-white ftco-animate">
					<h2 class="mb-4">
						떠나요 제주도로~ <br> 차는 안필요하세요?
					</h2>
					<a href="memberjoinview" class="btn btn-primary btn-lg">회원가입하고
						렌트하기</a>
				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section testimony-section bg-light">
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div class="col-md-7 text-center heading-section ftco-animate">
					<span class="subheading">Testimonial</span>
					<h2 class="mb-3">프로젝트 구성원</h2>
				</div>
			</div>
			<div class="row ftco-animate">
				<div class="col-md-12">
					<div class="carousel-testimony owl-carousel ftco-owl">
						<div class="item">
							<div class="testimony-wrap rounded text-center py-4 pb-5">
								<div class="user-img mb-2"
									style="background-image: url(<%=request.getContextPath()%>/resources/images/person_1.jpg)">
								</div>
								<div class="text pt-4">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">조현우</p>
									<span class="position">Web Developer</span>
								</div>
							</div>
							<div class="item">
								<div class="testimony-wrap rounded text-center py-4 pb-5">
									<div class="user-img mb-2"
										style="background-image: url(<%=request.getContextPath()%>/resources/images/person_2.jpg)">
									</div>
									<div class="text pt-4">
										<p class="mb-4">Far far away, behind the word mountains,
											far from the countries Vokalia and Consonantia, there live
											the blind texts.</p>
										<p class="name">홍나영</p>
										<span class="position">Web Developer</span>
									</div>
								</div>

							</div>
						</div>



						<div class="item">
							<div class="testimony-wrap rounded text-center py-4 pb-5">
								<div class="user-img mb-2"
									style="background-image: url(<%=request.getContextPath()%>/resources/images/hwang.PNG)">
								</div>
								<div class="text pt-4">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">황나영</p>
									<span class="position">Web Developer</span>
								</div>
							</div>
							<div class="item">
								<div class="testimony-wrap rounded text-center py-4 pb-5">
									<div class="user-img mb-2"
										style="background-image: url(<%=request.getContextPath()%>/resources/images/kun.PNG)">
									</div>
									<div class="text pt-4">
										<p class="mb-4">Far far away, behind the word mountains,
											far from the countries Vokalia and Consonantia, there live
											the blind texts.</p>
										<p class="name">권병군</p>
										<span class="position">UI Designer</span>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap rounded text-center py-4 pb-5">
								<div class="user-img mb-2"
									style="background-image: url(<%=request.getContextPath()%>/resources/images/person_1.jpg)">
								</div>
								<div class="text pt-4">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">권병국</p>
									<span class="position">Web Developer</span>
								</div>
							</div>
							<div class="item">
								<div class="testimony-wrap rounded text-center py-4 pb-5">
									<div class="user-img mb-2"
										style="background-image: url(<%=request.getContextPath()%>/resources/images/person_3.jpg)">
									</div>
									<div class="text pt-4">
										<p class="mb-4">Far far away, behind the word mountains,
											far from the countries Vokalia and Consonantia, there live
											the blind texts.</p>
										<p class="name">박지담</p>
										<span class="position">Web Developer</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="ftco-counter ftco-section img bg-light"
		id="section-counter">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18">
						<div class="text text-border d-flex align-items-center">
							<strong class="number" data-number="60">0</strong> <span>Year
								<br>Experienced
							</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18">
						<div class="text text-border d-flex align-items-center">
							<strong class="number" data-number="1090">0</strong> <span>Total
								<br>Cars
							</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18">
						<div class="text text-border d-flex align-items-center">
							<strong class="number" data-number="2590">0</strong> <span>Happy
								<br>Customers
							</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18">
						<div class="text d-flex align-items-center">
							<strong class="number" data-number="67">0</strong> <span>Total
								<br>Branches
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">
							<a href="#" class="logo">제주<span
								style="color: rgb(190, 175, 175);">도로</span><span
								style="color: rgb(10, 183, 252);">WE</span></a>
						</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Information</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">About</a></li>
							<li><a href="#" class="py-2 d-block">Services</a></li>
							<li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
							<li><a href="#" class="py-2 d-block">Best Price
									Guarantee</a></li>
							<li><a href="#" class="py-2 d-block">Privacy &amp;
									Cookies Policy</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Customer Support</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">FAQ</a></li>
							<li><a href="#" class="py-2 d-block">Payment Option</a></li>
							<li><a href="#" class="py-2 d-block">Booking Tips</a></li>
							<li><a href="#" class="py-2 d-block">How it works</a></li>
							<li><a href="#" class="py-2 d-block">Contact Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">제주 제주시 다호5길 400 제주도로WE</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+81) 016-7117-972</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@human.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
         <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
         <circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.easing.1.3.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.stellar.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/aos.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.animateNumber.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.timepicker.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="<%=request.getContextPath()%>/resources/js/google-map.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>


	<script>
	function car(e) {
		var sDt = document.getElementById('rentdate');
		var eFdt = document.getElementById('returndate');
		sDt.value="연도-월-일";
        eFdt.value="연도-월-일";
        var carlist_a = [ "스파크", "케스퍼", "레이", "모닝" ];
        var carlist_b = [ "아반떼 AD", "아이오닉", "벨로스터", "K3", "K3 GT" ];
        var carlist_c = [ "쏘나타", "G70", "K5", "스팅어 2.5", "LF 쏘나타", "BMW X5" ];
        var carlist_d = [ "그랜저2.5", "그랜저3.3", "K7", "K8" ];
        var carlist_e = [ "제네시스 G80", "G90", "G90 리무진 ", "벤츠 E클래스","아우디 A6" ];
        var carlist_f = [ "스타리아", "스타렉스", "카니발", "카니발 KA4" ];
        var carlist_g = [ "포드", "랜드로버", "GV80", "GV70", "싼타페", "투싼", "베뉴" ];
        var carlist_h = [ "볼트", "코나", "GV70", "GV60", "테슬라 3", "EV6" ];
        var target = document.getElementById("carlist");
        if (e.value == "경차") {
           var d = carlist_a;
        } else if (e.value == "소형차") {
           var d = carlist_b;
        } else if (e.value == "중형차") {
           var d = carlist_c;
        } else if (e.value == "준대형차") {
           var d = carlist_d;
        } else if (e.value == "대형차") {
           var d = carlist_e;
        } else if (e.value == "승합차") {
           var d = carlist_f;
        } else if (e.value == "SUV") {
           var d = carlist_g;
        } else if (e.value == "전기차") {
           var d = carlist_h;
        }
        target.options.length = 0;
        for (x in d) {
           var opt = document.createElement("option");
           opt.value = d[x];
           opt.innerHTML = d[x];
           target.appendChild(opt);
        }
     }
	var carlist = document.getElementById("carlist");
	carlist.onchange=()=>{
		var sDt = document.getElementById('rentdate');
		var eFdt = document.getElementById('returndate');
		sDt.value="연도-월-일";
        eFdt.value="연도-월-일";
	}
	document.getElementById('rentdate').onchange=() => {
 		 var sDt = document.getElementById('rentdate').value;
 		 var eFdt = document.getElementById('returndate');
         eFdt.value="연도-월-일";
     	 //var sTm = $("#time").val();
     	 
     	// var sum = sDt+" "+sTm+":00:00";

     	 var sDate = new Date(sDt);
         var now = new Date();

     	 
     	if((sDate-now)< 0) {
     		alert("지난 시간으로 예약 할 수 없습니다.");
     		var eSdt = document.getElementById('rentdate');
     		eSdt.value="연도-월-일";
     	} else {
     		return true;
     	}
 	}
	
	
	
	document.getElementById('returndate').onchange=() => {
 		 var sDt = document.getElementById('rentdate').value;
     	 var fDt = document.getElementById('returndate').value;
		
     	 //var sumSdt = sDt+" "+sTm+":00:00";

    	 var sDate = new Date(sDt);
     	 
     	 var fDate = new Date(fDt);
       var now = new Date();
     	 
     	if(fDt <= sDt){
     		alert("반납일은 대여일 이후로 해주세요.");
     		var eFdt = document.getElementById('returndate');
     		eFdt.value="연도-월-일";
     	} else if((fDate-now)< 0) {
     		alert("지난 시간으로 예약 할 수 없습니다.");
     		var eFdt = document.getElementById('returndate');
     		eFdt.value="연도-월-일";
     	} else {
     		chkdate(sDate,fDate);
     	}
 	}

	
	
	
	function chkdate(sDate,fDate) {  //sumSdt은 시작일, fDt는 종료일이다.
		var carname=document.getElementById('carlist');
		var res_day = [];
		var reservNo = null;
 	
	  	while(sDate.getTime() <= fDate.getTime()){
	  			var _mon_ = (sDate.getMonth()+1);
	  			_mon_ = _mon_ < 10 ? '0'+_mon_ : _mon_;
	  			var _day_ = sDate.getDate();
	  			_day_ = _day_ < 10 ? '0'+_day_ : _day_;	  			
	   			res_day.push(sDate.getFullYear() + '-' + _mon_ + '-' +  _day_);
	   			sDate.setDate(sDate.getDate() + 1);
	   	}

	  	for(var i=0; i<res_day.length; i++){
	  		
	  		$.ajax({
	  			url:'<%=request.getContextPath()%>/chkDate?rentdate='+res_day[i]+'&carname='+carname.value,
	  			type:'GET',
	  			async:false,  // 동기식 처리 > 함수가 순차적으로 실행되기 위해서
	  			cache:false,
	  			success:function(data){
	  				if(data==""){   // 예약 가능할 때, 넘어오는 데이터 null
	  					//alert("예약 가능");
	  					var fDt = document.getElementById('returndate');
	  					fDt.value=res_day[i];
	  				
	  				} else if(data!=""){  // 기존에 예약 있을 때, 넘어오는 데이터 존재
	  					//alert("예약 불가능");
	  					//alert(해당 차량은 이미 예약이 되었습니다. \n 다른 날짜를 선택해주세요");
	  					reservNo += (res_day[i]+", ");
	  					var sDt = document.getElementById('rentdate');
	  					var fDt = document.getElementById('returndate');
	  					fDt.value="연도-월-일";
	  					sDt.value="연도-월-일";
	  					
	  					
	  				}
	  			}, error : function(){
					console.log("-----실패-------");
				}

	  		})
	  		
	  	}
	  	if(reservNo!=null){
	  		reservNo=reservNo.replace("null","");
	  		alert("해당 차량은 이미 "+reservNo+"날에 예약이 있습니다. \n 다른 날짜를 선택해주세요");
	  		var chkD = document.getElementById('chkD');
	  		chkD.value="N";
	  	} else {
	  		alert("예약 가능한 날짜입니다.");
	  		chkD.value="Y";
	  	}
	  	
	}

	var rent_form = document.getElementById('rent_form');
	var rent_btn = document.getElementById('rent_btn');
	var chkD = document.getElementById('chkD');
	rent_btn.onclick=()=>{
		if(${login_id!=null}&&chkD.value=="Y"){			
			rent_form.submit();
		}
	}
	
	
	
 </script>
</body>
</html>