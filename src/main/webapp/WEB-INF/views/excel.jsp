<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.util.Calendar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

<head>

<meta http-equiv="Content-Type" content="application/vnd.ms-excel;charset=UTF-8">

<%

	Calendar cal = Calendar.getInstance();

	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

    response.setHeader("Content-Disposition","attachment;filename="+sdf.format(cal.getTime())+"_excel_file.xls");

    response.setHeader("Content-Description", "JSP Generated Data");

 %>

 <style>

 .list_table{width:800px;}

 .list_table tr td, .list_table tr th{border: 1px solid #000;}

 </style>

</head>

<body>

	<table class="list_table">

		<caption>리스트 목록</caption>



		<thead>

			<tr>			

                            <th scope="col">아이디</th>

                            <th scope="col">이름</th>

                            <th scope="col">성별</th>
                            <th scope="col">국가</th>
                            <th scope="col">도시</th>

			</tr>

		</thead>

		<tbody>

		<c:set var="size" value="${fn:length(list) }" />

		<c:forEach items="${list }"  var="list" varStatus="count">

			<tr>

				<td class=""><c:out value="${list.id }"/></td>

   				<td class=""><c:out value="${list.name }"/></td>

				<td class=""><c:out value="${list.gender }" /></td>
				<td class=""><c:out value="${list.country }" /></td>
				<td class=""><c:out value="${list.city }" /></td>
				

			</tr>

		</c:forEach>

		<c:if test="${empty list }">

			<tr>

				<td colspan="5">게시글이 없습니다.</td>

			</tr>

		</c:if>

		</tbody>

	</table>

</body>

</html>