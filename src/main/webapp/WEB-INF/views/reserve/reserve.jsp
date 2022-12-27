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
					<!-- 				<li class="nav-item"><a href="pricing" class="nav-link">기간대별</a></li> -->
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
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('<%=request.getContextPath()%>/resources/images/reservemain.png');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span>예약하기 <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">렌트 예약</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row d-flex mb-5 contact-info">
				<div class="col-md-8 block-9 mb-md-5">
					<div id="joinform">
						<form class="form-group" action="reserveinsert" method="get">
							<div class="elem-group form">
								<label for="name">아이디</label> <input type="text" id="id"
									name="id" value="${login_id}" readonly>
							</div>
							<div class="elem-group inlined">
								<label for="cartype">차량선택</label> <select onchange="car(this)"
									class="form-control" name="cartype" required id="cartype">
									<option value="">차량선택</option>
									<option value="경차">경차</option>
									<option value="소형차">소형차</option>
									<option value="중형차">중형차</option>
									<option value="준대형차">준대형차</option>
									<option value="대형차">대형차</option>
									<option value="승합차">승합차</option>
									<option value="SUV">SUV</option>
									<option value="전기차">전기차</option>
									<c:if test="${cvo.cartype.length()>=2}">
										<option value="${cvo.cartype}" selected hidden="">${cvo.cartype}</option>
									</c:if>
								</select>
							</div>
							<div class="elem-group inlined">
								<label for="">차량 모델</label> <label for="" class="label">차량
									모델</label> <select id="carlist" class="form-control" name="carname"
									required>
									<option value="">차량모델을 선택해주세요</option>
									<c:choose>
										<c:when test="${cvo.carname eq null }">
										</c:when>
										<c:otherwise>
											<option value="${cvo.carname}" selected hidden>${cvo.carname}</option>
										</c:otherwise>
									</c:choose>
								</select>
							</div>
							<hr>
							<div class="elem-group inlined">
								<label for="">면허 종류</label> <input type="number"
									id="licensetype" name="licensetype" value="2" min="1" max="2"
									required>
							</div>
							<div class="elem-group inlined">
								<label for="">면허번호</label> <input type="text" id="licensenum"
									pattern="[0-9]{2}-[0-9]{2}-[0-9]{6}-[0-9]{2}" name="licensenum"
									placeholder="AA-BB-CCCCCC-DE" maxlength="15" required
									onkeyup="keyevent();">
							</div>
							<div class="elem-group inlined">
								<label for="rentdate">대여일</label> <input type="date"
									class="form-control" id="rentdate" name="rentdate" required
									value="${rvo.getRentdate() }">
							</div>


							<div class="elem-group inlined">
								<label for="" class="label">픽업 시간</label> <select
									name="time_pick" class="form-control">
									<option value="11">오전 11시</option>
									<option value="12">오후 12시</option>
									<option value="13">오후 1시</option>
									<option value="14">오후 2시</option>
									<option value="15">오후 3시</option>
									<option value="16">오후 4시</option>
									<option value="17">오후 5시</option>
									<option value="18">오후 6시</option>
									<option value="19">오후 7시</option>
									<option value="${time_pick}" selected hidden="">
										<c:if test="${time_pick < 12}">
                            			오전 ${time_pick}시
                          				</c:if>
										<c:if test="${time_pick == 12}">
                              			오후 ${time_pick}시
                           				</c:if>
										<c:if test="${time_pick > 12}">
                              			오후 ${time_pick-12}시
                           				</c:if>
									</option>
								</select>
							</div>

							<div class="elem-group inlined">

								<label for="" class="label">반납일</label> <input type="date"
									class="form-control" id="returndate" placeholder="Date"
									name="returndate" required value="${rvo.getReturndate() }">
							</div>
							<div class="elem-group inlined ">
								<label for="coupon">쿠폰선택</label> <select class="form-control"
									name="coupon" id="coupon" onchange="cal()">

									<option value="" >쿠폰선택</option>
									<c:forEach items="${coupon }" var="mvo">
										<option>${coupon }</option>
									</c:forEach>
								</select>
							</div>

							<div class="elem-group">
								<label for="insurance"
									style="margin-right: 100px; margin-top: 50px;">보험여부</label> 네<input
									type="radio" name="insurance" value="Y" required
									style="margin-right: 100px;" onchange="cal()"> 아니오<input type="radio"
									name="insurance" value="N" onclick="cal()" checked>
									<span id="sumpay" style="color:green; margin-left:100px;">
									</span>

							</div>
							<hr>

							<div class="elem-group" style="margin-top: 50px">
								<label for="message">요구사항</label> <br>
								<textarea id="require" name="require" rows="5" cols="50"
									placeholder="특이사항을 입력해주세요" required></textarea>
							</div>
							<input type="submit" value="예약하기"
								class="btn btn-primary py-3 px-5">

						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-intro"
		style="background-image: url(<%=request.getContextPath()%>/resources/images/bg_3.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row justify-content-end">
				<div
					class="col-md-6 heading-section heading-section-white ftco-animate">
					<h2 class="mb-3">Do You Want To Earn With Us? So Don't Be
						Late.</h2>
					<a href="#" class="btn btn-primary btn-lg">Become A Driver</a>
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

</body>
<script>
   
   var sumpay = document.getElementById("sumpay");
   var rentdateflag = 0;
   
   function cal(){      
      var carname = document.getElementById("carlist");
      var rentdate = document.getElementById("rentdate");
      var returndate = document.getElementById("returndate");
      var coupon = document.getElementById("coupon");
      var insurance = document.querySelector('input[name="insurance"]:checked');
         
      $.ajax({
         url:'./paySet',
         data:{'carname':carname.value, 'rentdate':rentdate.value, 'returndate':returndate.value, 'coupon':coupon.value, 'insurance':insurance.value}, 
         <%-- url:'<%=request.getContextPath()%>/paySet?carname='+carname.value+'&rentdate='+rentdate.value+'&returndate='+returndate.value
               +'&coupon='+coupon.value+'&insurance='+insurance.value, --%>
         type:'GET',
         cache:false,   // cache옵션값을 false로 주게 되면 브라우저 캐쉬를 막아서 캐쉬된 값이 아닌 현재 값을 호출해 올 수 있다.
         success: function(data){
            if(data!=""){
               sumpay.innerHTML = "총 금액"+data+"원입니다.";
               
            } else if(data=="") {
              
            }      
         }, error : function(){
            console.log("-----실패-------"+coupon.value);
         }
         
      });
   }
   
   
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
        var carlist_h = [ "볼트", "코나", "GV70", "GV60", "테슬라3", "EV6" ];
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

          
         if(sDate<now) {
            rentdateflag=0;
            alert("지난 시간으로 예약 할 수 없습니다.");
            var eSdt = document.getElementById('rentdate');
            eSdt.value="연도-월-일";
         } else {
            rentdateflag++;
            return true;
         }
     }
   
   
   
   document.getElementById('returndate').onchange=() => {
      var eFdt = document.getElementById('returndate');
      if(rentdateflag==0){
            alert("대여일을 선택 해주세요.");
            eFdt.value="연도-월-일";
            return;
         }
       var sDt = document.getElementById('rentdate').value;
          var fDt = document.getElementById('returndate').value;
          var sTm = $("#time").val();   
      

         var sDate = new Date(sDt);
          
          var fDate = new Date(fDt);
        var now = new Date();
          
         if(fDt <= sDt){
            alert("반납일은 대여일 이후로 해주세요.");
            //var eFdt = document.getElementById('returndate');
            eFdt.value="연도-월-일";
         } else if((fDate-now)< 0) {
            alert("지난 시간으로 예약 할 수 없습니다.");
            //var eFdt = document.getElementById('returndate');
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
                    var fDt = document.getElementById('returndate');
                    fDt.value=res_day[i];
	                 } else if(data!=""){  // 기존에 예약 있을 때, 넘어오는 데이터 존재
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
        } else {
           alert("예약 가능한 날짜입니다.");
		   cal();
        }
   }
   keyevent = () => {
      licensenum.value = autoHypenlicensenum(licensenum.value);
   }
   function autoHypenlicensenum(str){      //00-00-000000-00
         str = str.replace(/[^0-9]/g,'');
         var tmp = '';
         if(str.length < 3){
           return str;
         }else if(str.length < 5){
           tmp += str.substr(0, 2);
           tmp += '-';
           tmp += str.substr(2);
           return tmp;
         }else if(str.length < 11){
           tmp += str.substr(0, 2);
           tmp += '-';
           tmp += str.substr(2, 2);
           tmp += '-';
           tmp += str.substr(4, 6);
           return tmp;
         }else{
           tmp += str.substr(0, 2);
           tmp += '-';
           tmp += str.substr(2, 2);
           tmp += '-';
           tmp += str.substr(4, 6);
           tmp += '-';
           tmp += str.substr(10, 2);
           return tmp;
         }
         return str;
       }
</script>
</html>