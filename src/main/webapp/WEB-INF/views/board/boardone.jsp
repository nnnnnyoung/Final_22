<%@page import="com.groupone.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.groupone.vo.CommentsVO"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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


<style>

.bbody {
	margin-left: 100px;
	color: black;
}

#good, #boardMD {
	margin-left: 900px;
}

a {
	color: gray;
}

.maindiv {
	border: 1px solid #bcbcbc;
}

.jb-table {
	display: table;
	width: 100%;
	border: 1px solid #bcbcbc;
}

.jb-table-row {
	display: table-row;
}

.jb-table-cell {
	display: table-cell;
	padding: 15px 20px;
	height: 70px;
}

.jb-top {
	vertical-align: top;
}

.jb-middle {
	vertical-align: middle;
}

.jb-bottom {
	vertical-align: bottom;
}

.btn.btn-ss {
    background: rgb(235, 159, 206) !important;
    border: 1px solid rgb(235, 159, 206) !important;
    color: #fff !important; }
    .btn.btn-secondary:hover {
      border: 1px solid #01d28e;
      background: transparent;
      color: #01d28e; }
    .btn.btn-secondary.btn-outline-secondary {
      border: 1px solid #01d28e;
      background: transparent;
      color: #01d28e; }
      .btn.btn-secondary.btn-outline-secondary:hover {
        border: 1px solid transparent;
        background: #01d28e;
        color: #fff; }

</style>



</head>
<body>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
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


	<hr>

	<div class="ftco-blocks-cover-1">
		<div class="ftco-cover-1 overlay innerpage">
			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-lg-6 text-center">
						<h1>제주도로WE 이용후기</h1>
						<p>실 이용객들의 생생한 탑승후기</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section class="bbody">
		<div class="maindiv">
			<div class="jb-table">
				<div class="jb-table-row">
					<div class="jb-table-cell">
						<span style="display: inline-block; width: 60px;"><b>
								글번호 </b></span> ${bvo.bno}
					</div>
					<div class="jb-table-cell">
						<span style="display: inline-block; width: 60px;"><b>
								제목 </b></span> ${bvo.title}
					</div>

					<div class="jb-table-cell">
						<span style="display: inline-block; width: 60px;"><b>
								작성자 </b></span> ${bvo.id}
					</div>
				</div>
				<div class="jb-table-row">
					<div class="jb-table-cell">
						<span style="display: inline-block; width: 60px;"><b>
								조회수 </b></span>${bvo.cnt}</div>
					<div class="jb-table-cell ">
						<span style="display: inline-block; width: 60px;"><b>게시일
						</b></span>${bvo.bindate.substring(0,4) }년${bvo.bindate.substring(5,7)}월
										${bvo.bindate.substring(8,10)}일
										${bvo.bindate.substring(11,13)}시${bvo.bindate.substring(14,16)}분</div>

					<div class="jb-table-cell ">
						<span style="display: inline-block; width: 60px;"><b>모델명
						</b></span>${carName}
					</div>
				</div>
			</div>
			</div>
			<div>
				<b>내용 </b>
			</div>

			<div>
				<c:set var="fname" value="${bvo.fname}" scope="session" />
				<c:choose>

					<c:when test="${fname == null}">

					</c:when>

					<c:otherwise>
						<img src="download?filename=${bvo.fname}" width='250px' height='250px'>
					</c:otherwise>
				</c:choose>

			</div>

			<div>${bvo.content}</div>
			
			<div id="boardMD">
				<c:set var="lid" value="${login_id}" />
				<c:set var="id" value="${bvo.id}" />
				<c:if test="${id eq lid}">
					<td><input type="button" value="수정"
						onclick="modiB(${bvo.bno})" class="btn btn-primary btn-lg"> <input type="button"
						value="삭제" onclick="delB(${bvo.bno})" class="btn btn-primary btn-lg"></td>
				</c:if>
			</div>

			<br>

			<div id='good'>
				<a class="text-dark heart" style="text-decoration-line: none;">
					<input type="hidden" id="chkL" value="${heartval}">
					<button onclick="updateL()" class="btn btn-ss py-2 px-4">
						<img id="heart"
							src="<%=request.getContextPath()%>/resources/icon/suit-heart-fill.svg">
						좋아요 <span id="gnum">${bvo.good}</span>
					</button>
				</a>
			</div>

			<hr>

			<!-- 댓글 출력부분  -->
			<div>

				<div>
					<b>댓글</b>
				</div>


				<c:forEach items="${clist}" var="cvo">
					<div class="modiC${cvo.bbno}">
						<div>
							<span style="display: inline-block; width: 100px;">
								${cvo.id}</span> <span id="${cvo.bbno}C"
								style="display: inline-block; width: 500px;">
								${cvo.comments}</span> <span
								style="display: inline-block; width: 200px;">
								${cvo.bbindate} </span>
							<c:set var="lid" value="${login_id}" />
							<c:set var="id" value="${cvo.id}" />
							<c:if test="${id eq lid}">

								<a style="color: blue" id="m${cvo.bbno}"
									onclick="cmUpdateOpen(${cvo.bbno})">수정</a>
								<a style="color: blue" onclick="delC(${cvo.bbno},${bvo.bno})">삭제</a>

								<div id="modiComment${cvo.bbno}"></div>

							</c:if>
						</div>
					</div>
				</c:forEach>



				<hr>
			</div>


			<div>

				<div>
					<b>댓글 작성</b>
				</div>
				<form id="com" action="comAction">

					<input type="hidden" name='id' value='${login_id}'> <input
						type="hidden" name='bno' value='${bvo.bno}'>

					<textarea cols="80" rows="8" id="comments" name="comments"
						placeholder="50자 이내로 입력해주세요."></textarea>


					<input type="button" value="등록" onclick="chkCon()" class="btn btn-primary btn-lg">

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

	<script>	      
		function cmUpdateOpen(bbno) {      
        var modiF = document.getElementById('modiComment'+bbno); //div id 댓글별로 서로다른 div가 있어야 하기때문에 div id에 기본키인 댓글 번호를 붙여주어 구분함
        var modiC = document.getElementById(bbno+'C').innerHTML; // span의 value값 꺼내오기
        var modiOK = document.getElementById(bbno+'C');
        
        modiF.innerHTML="<input type='text'style='width:500px;'  maxlength='50' id='modText"+bbno+"' value='"+modiC.trim()+"'>";
        modiF.innerHTML+="<button id='modiBtn' >수정</button>";
        modiF.innerHTML   +="<button id='backBtn' onclick='back()' >취소</button>";
        let msg = "수정하시겠습니까?";
        if(confirm(msg)!=0){ 
           var modText=document.getElementById('modText'+bbno).value;

           $('html').click(function(e) {   
              //내가 클릭한 부분이 수정할 댓글 범위의 div를 넘어가면 수정내용을 입력하는 텍스트 필드가 사라진다.
              var b= e.target;
              //b=b.parentNode;
              var a=document.querySelector('.modiC'+bbno);
              console.log(a);
              var c = 0;
              
              
              while(b!=null){ //b의 최상위 nord까지 while문이 돌아감
                 b=b.parentNode; 
                 console.log(b);   
                  if(a==b) {
                    c=1;
                     break;         
                 } 
              }
              
              if(c==0){
                 console.log('modiC'+bbno);
                 modiF.innerHTML="";
              }
              
           });   
           
           back=()=>{
              modiF.innerHTML="";
           }
           
           $(document).on('click', '#modiBtn', function(e) {
                    modText=document.getElementById('modText'+bbno).value;
                    console.log(modText);
                       $.ajax({
                          
                          type: 'GET',
                          url: './modicom?bbno='+bbno+'&comments='+modText,
                       
                          cache:false,
                          success: function(data) {
                             modiOK.innerHTML=modText;
                             modiF.innerHTML="";
                             console.log("DB상 수정 완료");
                          },error : function(){
                             console.log("-----실패-------");
                          }
                          
                       }) 
                    
           
                 });   
        } else {  // 취소버튼 누르면 없어짐
           modiF.innerHTML="";
           
        }
     }


		
		//댓글 수정 삭제

	$(document).ready(function () {
				
	// 좋아요가 있는지 확인한 값을 heartval에 저장
        var heartval = ${heartval}
        // heartval이 1이면 좋아요가 이미 되있는것이므로 heart-fill.svg를 출력하는 코드
        if(heartval>0) {
            console.log(heartval);
            $("#heart").prop("src", "<%=request.getContextPath()%>/resources/icon/suit-heart-fill.svg");
           
        }
        else {
            console.log(heartval);
            $("#heart").prop("src", "<%=request.getContextPath()%>/resources/icon/suit-heart.svg");
            
        }
    });
		
		
	// 좋아요 버튼을 클릭 시 실행되는 코드
 		updateL=()=>{
 			var heartval = document.getElementById('chkL');
 			var gnumval = Number(document.getElementById('gnum').innerHTML);
 			var gnum = document.getElementById('gnum');
 			// 총 좋아요 갯수를 숫자로 변환
 			
 			
 	        if(heartval.value>0) {
 	            console.log(heartval);
 	           $("#heart").prop("src", "<%=request.getContextPath()%>/resources/icon/suit-heart.svg");	            
 	           
 	        }else {
 	            console.log(heartval);
 	           $("#heart").prop("src", "<%=request.getContextPath()%>/resources/icon/suit-heart-fill.svg"); 
 	        }
 			
 			
 			
  			$.ajax({
				type: 'GET',
				url: './updateG',
				data : {'heartval': heartval.value, 'id':'${login_id}', 'bno':${bvo.bno}},
				cache:false,
				success: function(data) {
					if(heartval.value>0) {
						console.log(heartval);
						heartval.value=0;
						gnum.innerHTML=gnumval-1;
						console.log("0??????")
		 	        }else {
		 	        	heartval.value=1;
		 	        	console.log("1??????")
		 	        	gnum.innerHTML=gnumval+1;
		 	        }
					console.log("DB상 수정 완료");
				},error : function(){
					console.log("-----실패-------");
				}
				
			})
			

 				
 		}
	
	

		delC=(cbno,bno)=>{				
	        let msg = "삭제하시겠습니까?";
	        if (confirm(msg)!=0) {
	        	location.href='delCom?bbno='+cbno+'&bno='+bno+'&id='+'${login_id}';
	        } else {
	            // no click
	        }    
		}
		
		// 게시글 수정 삭제
		delB=(bno)=>{
	        let msg = "삭제하시겠습니까?";
	        if (confirm(msg)!=0) {
	        	location.href='delBoard?bno='+bno;
	        } else {
	            // no click
	        }    
		}
		
		modiB=(bno)=>{
	        let msg = "수정하시겠습니까?";
	        if (confirm(msg)!=0) {
	        	location.href='modiBoard?bno='+bno;
	        } else {
	            // no click
	        }    
		}
		
		chkCon=()=>{ //댓글의 내용이 입력되었는지 확인 후 댓글 등록
			let comments=document.getElementById('comments');
			console.log(comments);
			
			if(comments.value==""){
				alert('내용을 입력해주세요')
			}else if(comments.value.length>=50){
				alert('50글자 이하로 입력해주세요')
			}else{
				document.getElementById('com').submit();
			}
		}
	   </script>


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