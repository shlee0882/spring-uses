<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="img/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w" id="loginForm" action="/loginRequest" method="post">
					<span class="login100-form-title p-b-51">
						Admin Login
					</span>

					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
						<input class="input100" type="text" name="idVal" placeholder="ID" id="idVal" value="${adminVo.id}">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
						<input class="input100" type="password" name="passVal" placeholder="Password" id="passVal">
						<span class="focus-input100"></span>
					</div>
					
					<div class="flex-sb-m w-full p-t-3 p-b-24">
						<div class="contact100-form-checkbox">
							<c:choose>
							    <c:when test="${adminVo.rememberId eq 'true' && !empty adminVo.id}">
									<input class="input-checkbox100" id="ckb1" type="checkbox" name="rememberMe" checked>
							    </c:when>
							    <c:otherwise>
									<input class="input-checkbox100" id="ckb1" type="checkbox" name="rememberMe">
							    </c:otherwise>
							</c:choose>
							<label class="label-checkbox100" for="ckb1">
								Remember me
							</label>
						</div>
<!-- 						<div> -->
<!-- 							<a href="#" class="txt1"> -->
<!-- 								Forgot? -->
<!-- 							</a> -->
<!-- 						</div> -->
					</div>
					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn" id="loginButton" type="submit" value="Submit">
							Login
						</button>
					</div>
				</form>
				
				
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<script>
// 	function redirectFunc(){
// 		 $( "#loginForm" ).submit();
// 	}
	
// 	$("#loginButton").click(function() {
// 		var idVal = $("#idVal").val();
// 		var passVal = $("#passVal").val();
// 		var sendData = {};
// 		sendData.idVal = idVal;
// 		sendData.passVal = passVal; 
// 		var requestData = sendData;
// 		console.log(requestData);
	
// 		$.ajax({
// 			url : "/loginRequest",
// 			type: "post",
// 			dataType : "json",
// 			data: JSON.stringify(requestData),
// 			contentType:'application/json; charset=utf-8',
// 			success : function(resData){
// 				alert("로그인에 성공했습니다.")
// 				console.log(resData);
// 				redirectFunc();
// 			},
// 		    error: function (request, status, error) {
// 		    	console.log(request);
// 		    	console.log(status);
// 		    	console.log(error);
// 		    	alert("아이디와 비밀번호를 다시 확인해주세요.");	
// 		    }
// 		});
		
// 	});
	
	</script>
</body>
</html>