<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>hong</title>
</head>
<body>
<style>

</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
 
 <table>
 	<form action="insert" method="post" id="join">
 	
 	<tr> 
 	<td><input type="text" placeholder="아이디" name="id" id="id"></td>
 	<td><input type="text" placeholder="이름" name="name" id="name" ></td>
 	<td>성별 <input type="radio" name="gender" value="M" > 남</td>
 	<td><input type="radio" name="gender" value="W" > 여</td>
 	</tr>
 	 
 	 <tr>
 	 <td>
 	 <select name="country" onchange="country_s(this)" id="country" >

 	 <option value="한국">한국</option>
 	 <option value="일본">일본</option>
 	 <option value="중국">중국</option>
 	 </td>
 	 </select>
 	 <td>
 	 <select name="city" id="city" >
	 <option value="서울">서울</option>
 	 <option value="수원">수원</option>
 	 <option value="천안">천안</option>
 	 <option value="파주">파주</option>
 	 <option value="의정부">의정부</option>
 	 <option value="안산">안산</option>
 	 <option value="고창">고창</option>
 	 <option value="대전">대전</option>
 	 <option value="부산">부산</option>
 	 <option value="익산">익산</option>
 	 </select>
 	 </td>
 	 <td> 시작일<input type="date" id="startD" onchange="chkSdate()" ></td>
 	 <td> 종료일<input type="date" id="endD" onchange="chkEdate()" ></td>
 	 
 	 </tr>
 	 <tr><td colspan="4" align="right">
 	 <input type="button" value="조회" onclick="selectDate()">
 	 <input type="button" value="저장" onclick="chkId()">
 	 <input type="button" value="엑셀다운" onclick="excelD()">
 	 <input type="button" value="삭제" onclick="deleteM()">
 	 </td></tr>
 	</FORM>
 	
 	
 </table>
	<table width="750">
		<tr>
		<td>선택</td>
		<td>아이디</td>
		<td>이름</td>
		<td>성별</td>
		<td>국가</td>
		<td>도시</td>
		</tr>
	</table>
 <script>

 
 
 	deleteM=()=>{
 		alert('삭제할 데이터가 없습니다.');
 	}
 	
	excelD=()=>{
		alert('다운로드 할 데이터가 없습니다.');
	}
 
 	chkId=()=>{
 		var chkid=document.getElementById("id").value;
 		var chkname=document.getElementById("name").value;
 		var chkgender=document.querySelector('input[name="gender"]:checked').value;
 		var chkcountry=document.getElementById("country").value;
 		var chkcity=document.getElementById("city").value;
 		console.log(chkid);
 		 $.ajax({
             url:'<%=request.getContextPath()%>/idchk?id='+chkid,
             type:'GET',
             cache:false,   // cache옵션값을 false로 주게 되면 브라우저 캐쉬를 막아서 캐쉬된 값이 아닌 현재 값을 호출해 올 수 있다.
             success: function(data){
                 if(data!=0){
                 	location.href='update?id='+chkid+'&name='+chkname+'&gender='+chkgender+'&country='+chkcountry+'&city='+chkcity;
                 	alert("수정완료!")
                 } else if(chkid=="" || chkname=="") {
                 	alert("항목을 모두 입력해주세요")
                 } else {
                 	document.getElementById("join").submit();
                 	alert("저장완료!")
                 }    
             }, error : function(){
                console.log("-----실패-------");
             }
             
          });
 	}
	function country_s(e) {
		console.log(e.value);
        var korea_city = [ "서울", "수원", "천안", "파주", "의정부", "안산", "고창", "대전", "부산", "익산" ];
        var japan_city = [ "요코하마", "쿄토", "삿포로", "후쿠오카", "고베", "히로시마", "나고야", "센다이", "이마바리" ];
        var china_city = [ "상하이", "타이위안", "베이징", "충칭", "웨이하이", "쑤저우", "샤먼", "난창" ];

        var target = document.getElementById("city");
        if (e.value == "한국") {
           var city = korea_city;
        } else if (e.value == "일본") {
           var city = japan_city;
        } else if (e.value == "중국") {
           var city = china_city;
        }
        target.options.length = 0;
        for (x in city) {
           var opt = document.createElement("option");
           opt.value = city[x];
           opt.innerHTML = city[x];
           target.appendChild(opt);
        }
     }
	chkSdate=()=>{
		var sdate=document.getElementById("startD").value;
		var edate=document.getElementById("endD").value;
		console.log(sdate);
		if(sdate>edate && edate!=""){
			alert("종료일은 시작일보다 이후 날짜로 지정해주세요");
			var esdt = document.getElementById('endD');
			esdt.value="연도-월-일";
		}
	}
	
	chkEdate=()=>{
		var sdate=document.getElementById("startD").value;
		var edate=document.getElementById("endD").value;
		console.log(sdate);
		if(sdate>edate){
			alert("종료일은 시작일보다 이후 날짜로 지정해주세요");
			var esdt = document.getElementById('endD');
			esdt.value="연도-월-일";
		}
	}
	
	selectDate=()=>{
		var startD=document.getElementById("startD").value;
		var endD=document.getElementById("endD").value;
		if(startD=="" || endD==""){
			alert("날짜를 선택해주세요")
		}else{
			location.href='select?startD='+startD+'&endD='+endD;
			
		}
	}
	
 </script>
</body>
</html>