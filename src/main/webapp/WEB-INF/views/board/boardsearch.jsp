<%@page import="com.groupone.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<style>
.row {
   padding-left: 80px;
   color: black;
}

#zero {
   padding-left: 37%;
}
</style>



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
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/boardstyle.css">

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
               <li class="nav-item"><a href="reserve?id=${login_id}"
                  class="nav-link">예약</a></li>
               <!--             <li class="nav-item"><a href="pricing" class="nav-link">기간대별</a></li> -->
               <li class="nav-item"><a href="cars" class="nav-link">차종별</a></li>
               <li class="nav-item"><a href="boardview" class="nav-link">Car뮤니티</a></li>
               <li class="nav-item"><a href="#" class="nav-link">고객지원</a></li>
               <li class="nav-item active"><c:choose>
                     <c:when test="${login_id!=null}">
                        <a href="<%=request.getContextPath()%>/myInfo?id=${login_id}"
                           class="nav-link" style="margin-right: -30px;">${login_id}님</a>
                        <li class="nav-item active"><a href="logout"
                           style="color: #01d28e;" class="nav-link">로그아웃</a></li>
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
      <form action="login" method="POST"
         style="margin-top: 220px; margin-left: 550px; width: 204px;">
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
                  <span class="mr-2"><a href=".">Home <i
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
      <div class="ftco-blocks-cover-1">
         <div class="container">
            <div class="row align-items-center justify-content-center">
               <div class="col-lg-6 text-center">
                  <h1>제주도로WE 이용후기</h1>
                  <h2>
                     <b style="color: orange;">${pageVO.keyword}</b> 검색결과
                  </h2>
                  <p>실 이용객들의 생생한 탑승후기</p>
               </div>
            </div>
         </div>
      </div>


      <div style="margin-bottom: 70px; margin-left: 70px;">
         <center>
            <form id="sh" name="sh" action="search">
               <select name="search_option">
                  <option value="id"
                     <c:if test="${map.search_option == 'id'}">selected</c:if>>작성자</option>

                  <option value="title"
                     <c:if test="${map.search_option == 'title'}">selected</c:if>>제목</option>

                  <option value="content"
                     <c:if test="${map.search_option == 'content'}">selected</c:if>>내용</option>

               </select> <input type="hidden" name="page" value=1> <input
                  id="keyword" type="text" name="keyword"> <input
                  type="button" value="검색" onclick="chkkey()"
                  class="btn btn-primary btn-lg">

            </form>
         </center>
      </div>


      <div class="row">

         <c:set var="size" value="${bList.size()}" />

         <c:choose>


            <c:when test="${size==0}">

               <div id="zero" color="black">
                  <h2>
                     <b>검색 결과가 없습니다.</b>
                  </h2>
               </div>

            </c:when>

            <c:otherwise>
               <div class="site-section bg-light">
                  <div class="container">
                     <div class="row">
                        <c:forEach items="${bList}" var="bvo">

                           <div class="col-lg-4 col-md-6 mb-4">
                              <div class="post-entry-1 h-100">
                                 <div class="post-entry-1 h-100">

                                    <c:set var="fname" value="${bvo.fname}" scope="session" />
                                    <c:choose>

                                       <c:when test="${fname==null}">
                                          <a> <img src="download?filename=null.jpeg"
                                             style="width: 250px; height: 250px;" alt="Image"
                                             class="img-fluid"></a>
                                       </c:when>

                                       <c:otherwise>
                                          <a> <img src="download?filename=${bvo.fname}"
                                             style="width: 250px; height: 250px;" alt="Image"
                                             class="img-fluid"></a>
                                       </c:otherwise>
                                    </c:choose>



                                    <div style="margin-left: -20px;">
                                       <div class="post-entry-1-contents">
                                          <h2>
                                             <a href="boardone?bno=${bvo.bno}&id=${login_id}">${bvo.title }</a>
                                             <hr
                                                style="margin-top: -5px; height: 10px; margin-bottom: -30px;" />
                                          </h2>
                                          <span class="meta d-inline-block mb-30"
                                             style="font-size: 13px;">${bvo.bindate.substring(0,4) }년${bvo.bindate.substring(5,7)}월
                                             ${bvo.bindate.substring(8,10)}일
                                             ${bvo.bindate.substring(11,13)}시${bvo.bindate.substring(14,16)}분<span
                                             class="mx-4" style="font-size: 15px;">작성자 <b
                                                style="font-size: 15px; color: #007bff;"> ${bvo.id}</b>
                                          </span>
                                          </span>
                                          <p style="margin-top: 20px;">${bvo.content}</p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </c:forEach>

                     </div>
                  </div>
               </div>
            </c:otherwise>


         </c:choose>






      </div>



      <div class="row mt-5">
         <div class="col text-center">
            <div class="block-27">
               <ul>

                  <span class="p-3"></span>
                  <c:if test="${pageVO.prev}">
                     <a
                        href="search?page=${pageVO.startPage -1}&keyword=${pageVO.keyword}&search_option=${pageVO.search_option}">이전
                     </a>
                  </c:if>

                  <c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}"
                     var="idx">
                     <c:if test="${pageVO.page == idx}"></c:if>
                     <li><a
                        href="search?page=${idx}&keyword=${pageVO.keyword}&search_option=${pageVO.search_option}"}>${idx}</a></li>

                  </c:forEach>
                  <c:if test="${pageVO.next}">
                     <a
                        href="search?page=${pageVO.endPage +1}&keyword=${pageVO.keyword}&search_option=${pageVO.search_option}">
                        다음 </a>

                  </c:if>


               </ul>
            </div>
         </div>
      </div>


   </section>
   <script type="text/javascript">
   var key=document.getElementById('keyword');
   chkkey=()=>{
      if(key.value==""){
         alert("검색어를 입력해주세요");
      }else{
         document.getElementById('sh').submit();
      }
   }
   </script>



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