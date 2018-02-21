<!DOCTYPE html >
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소득 보기</title>
<script src="./resources/bootstrap/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript"
	src="./resources/bootstrap/js/bootstrap.js"></script>

<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
</head>
<body>

	<h2 class="text-center">소득 내역</h2>

	<div class="row">
		<table id="incomeTable"
			class="table table-bordered table-hover text-center">
			<thead class="text-center">
				<tr>
					<th>거래날짜</th>
					<th>소득구분</th>
					<th>거래코드</th>
					<th>금융사코드</th>
					<th>금액</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${incomeList}" var="income">
					<tr>

						<td>${income.income_Date}</td>
						<td>${income.income_Code}</td>
						<td>${income.trade_Code}</td>
						<td>${income.bank_Code}</td>
						<td>${income.income_Amount}</td>
						<td>${income.income_Description}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="col-lg-12" id="ex1_Result1"></div>
		<div class="col-lg-12" id="ex1_Result2"></div>
	</div>




	<script>
		//테이블의 Row 클릭시 값 가져오기
		$("#incomeTable tr")
				.click(
						function() {

							var str = ""
							var tdArr = new Array(); // 배열 선언

							// 현재 클릭된 Row(<tr>)
							var tr = $(this);
							var td = tr.children();

							// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
							console.log("클릭한 Row의 모든 데이터 : " + tr.text());

							// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
							td.each(function(i) {
								tdArr.push(td.eq(i).text());
							});

							console.log("배열에 담긴 값 : " + tdArr);

							// td.eq(index)를 통해 값을 가져올 수도 있다.
							var no = td.eq(0).text();
							var userid = td.eq(1).text();
							var name = td.eq(2).text();
							var email = td.eq(3).text();
							var amount = td.eq(4).text();
							var description = td.eq(5).text();

							str += " * 클릭된 Row의 td값 = 거래 날짜 : <font color='red'>"
									+ no
									+ "</font>"
									+ ", 소득구분 : <font color='red'>"
									+ userid
									+ "</font>"
									+ ", 거래코드 : <font color='red'>"
									+ name
									+ "</font>"
									+ ", 금융사코드 : <font color='red'>"
									+ email
									+ "</font>"
									+ ", 금액 : <font color='red'>"
									+ amount
									+ "</font>"
									+ ", 비고 : <font color='red'>"
									+ description
									+ "</font>";

							$("#ex1_Result1").html(
									" * 클릭한 Row의 모든 데이터 = " + tr.text());
							$("#ex1_Result2").html(str);
						});
	</script>






</body>


</html>