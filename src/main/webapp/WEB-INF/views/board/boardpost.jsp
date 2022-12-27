<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>JejuDoroWE</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">

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
	href="<%=request.getContextPath()%>/resources/css/css/aos.css">

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

<link
	href="https://fonts.googleapis.com/css?family=DM+Sans:300,400,700&display=swap"
	rel="stylesheet">



<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap-datepicker.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/fonts/flaticon/font/flaticon.css">







</head>
<body>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href=".">제주<span
				style="color: rgb(73, 70, 70);">도로</span><span
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
	</nav>.l
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

	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('<%=request.getContextPath()%>/resources/images/board_main.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span>Services <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">이용후기</h1>
				</div>
			</div>
		</div>
	</section>
	<section>

		<hr>
		<div></div>
		<div class="ftco-blocks-cover-1">
			<div class="ftco-cover-1 overlay innerpage"
				style="background-image: url('images/hero_2.jpg')">
				<div class="container">
					<div class="row align-items-center justify-content-center">
						<div class="col-lg-6 text-center">
							<h1>제주도로WE 이용후기</h1>
						</div>
					</div>
				</div>
			</div>
		</div>

		<c:forEach items="${bList}" var="bvo">

			<div class="row">
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="post-entry-1 h-100">
						<a href="single.html"> <img src="" alt="Image"
							class="img-fluid">
						</a>
						<div class="post-entry-1-contents">
							<h2>
								<a href="single.html">${bvo.title }</a>
							</h2>
							<span class="meta d-inline-block mb-3">July 17, 2019 <span
								class="mx-2">by</span> <a href="#">Admin</a></span>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Dolores eos soluta, dolore harum molestias consectetur.</p>
						</div>
					</div>
				</div>
		</c:forEach>






		<div class="container site-section mb-5">
			<div id="wrap" align="center">
				<h1>게시글 등록</h1>
				<form name="frm" method="post" action="wrAction"
					encType="multipart/form-data" id="com">
					<table>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="id" value="${login_id}"
								readonly></td>
						</tr>
						<tr>

							<th>예약차량</th>
							<td><select onchange="relist" class="form-control"
								name="rno" id="rno">
									<option>
										<c:choose>
											<c:when test="${not empty list}">
												<c:forEach items="${list}" var="rvo">
													예약내용
													<option id="rlist" value="${rvo.rno }">예약번호
														${rvo.cno } / 대여일 ${rvo.rentdate.substring(0, 10)} / 반납일
														${rvo.returndate.substring(0, 10) }</option>
												</c:forEach>
											</c:when>
											<c:otherwise>
												예약없음
											</c:otherwise>
										</c:choose>
									</option>
							</select></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" size="70" name="title" id="title"
								placeholder="50글자 이하로 작성해주세요" maxlength='50' required></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea cols="70" rows="15" name="content"
									id="content" placeholder="300글자 이하로 작성해주세요" maxlength='300'
									required></textarea></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td><input type="file" name="file" id="file"></td>
						</tr>
					</table>
					<br> <br> <input type="submit" value="등록">
					<input type="reset" value="다시 작성"> <input type="button"
                  value="목록" onclick="location.href='boardview'">
				</form>
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
	<script>
		/*  chkCon=()=>{ //댓글의 내용이 입력되었는지 확인 후 댓글 등록
		     let content=document.getElementById('content');
		     let title=document.getElementById('title');
		     console.log(content);
		     
		     if(title.value.length>=50){
		     	alert('50글자 이하로 입력해주세요')
		     	if(content.value.length>=300){
		     		alert('300글자 이하로 입력해주세요')	
		     	}
		     }else{
		        document.getElementById('com').submit();
		     }
		  } */
	</script>

	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-migrate-3.0.1.min.js"></script>

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

</body>
</html>