<!DOCTYPE html >
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/resources/include/header.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소득 보기</title>
<script src="./resources/bootstrap/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="./resources/bootstrap/js/bootstrap.js"></script>

<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
<script type="text/javascript">
	function createRow() { // 입력란 추가 함수
		var objTable = document.getElementById('incomeTable');
		var rowLength = objTable.rows.length; // 테이블 행 갯수 저장
		var now = new Date() // 현재 날짜
	    var curr_date = now.getDate();
	    var curr_month = now.getMonth() + 1; //Months are zero based
	    if(curr_month < 10) curr_month = "0"+curr_month;
	    var curr_year = now.getFullYear();
	    var result = curr_year + "-" + curr_month + "-" + curr_date;
	 
		//var nowDate = now.toLocaleString(); //날짜를 보기좋게 출력 (YYYY. MM. DD. 오전/오후 HH:mm:ss)

		// \d - 숫자 , * - 0회 이상 , \D - 문자 , \s - 공백 , ? - 0회 또는 1회 
		//var regExp = /\d*\D?\s\d*\D?\s\d*/; //YYYY. MM. DD 까지막 출력하기위한 정규표현식
		//var result = nowDate.match(regExp); //정규표현식과 매치되는 값만 result에 저장

		var oRow = objTable.insertRow(rowLength); // 행 하나 추가 
		var lastRow = objTable.rows[rowLength - 1];// 열 갯수를 구하기 위해 마지막 행 정보 불러오기
		for (var i = 0; i < lastRow.cells.length; i++) {
			var oCell = oRow.insertCell(i);
			if (i == 0) {
				oCell.innerHTML = result; // 첫번째 컬럼에는 날짜가 저장되게끔
			}
		}

	}
</script>
</head>
<body>

	<h2 class="text-center">소득 내역</h2>

	<div class="container">
		<table class="table table-bordered table-hover table-condensed"
			id=incomeTable>
			<thead>
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
		<hr />
		<input type="button" value="행 생성" onclick="createRow()" /> <input
			type="button" value="행 삭제">
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
<%@ include file="/resources/include/footer.jsp"%>


</html>