<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin - Dashboard</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
<style type="text/css">
.table1 { display: table; } 
.table1>* { display: table-row; }
.table1>*>* { display: table-cell; }

#dataTable > tbody > tr > td > span { display:none; }

</style>
</head>
<body id="page-top">

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

	<a class="navbar-brand mr-1" href="#">Admin Page</a>

	<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
		id="sidebarToggle" href="#">
		<i class="fas fa-bars"></i>
	</button>

	<!-- Navbar Search -->
	<form
		class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
	</form>

	<!-- Navbar -->
	<ul class="navbar-nav ml-auto ml-md-0">
		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" href="#" id="userDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
		</a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="userDropdown">
				<a class="dropdown-item" href="#" data-toggle="modal"
					data-target="#logoutModal">Logout</a>
			</div></li>
	</ul>

	</nav>

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="/getBurgerList">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>상품 조회 / 변경</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/registPage"> <i class="fas fa-fw fa-table"></i> <span>상품 등록</span></a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/getDisplayList">
					<i class="fas fa-fw fa-table"></i> <span>전시 조회 / 변경</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="/registDisplayPage">
					<i class="fas fa-fw fa-table"></i> <span>전시 등록</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="/">
					<i class="fas fa-fw fa-table"></i> <span>사용자 화면</span>
			</a></li>			
		</ul>

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><span>조회 / 변경</span></li>
				</ol>

				<!-- Icon Cards-->
				<div class="row"></div>

				<div>
					<!-- 			allBurgerList -->
				</div>
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Data Table Example
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th width="6%">번호</th>
										<th width="5%">메뉴명</th>
										<th width="10%">단품가격</th>
										<th width="10%">세트가격</th>
										<th width="5%">칼로리</th>
										<th width="5%">전시</th>
										<th width="5%">경로</th>
										<th width="11%">첨부</th>
										<th width="10%">저장</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="burger" items="${allBurgerList}" varStatus="status">
										<tr>
											<td><form id="form${status.count}" name="frmSave">
												<input type="number" name="chain_no" value="${burger.chain_no}" style="width: 30px;"/></form></td>
												<input form="form${status.count}" style="display:none;" type="hidden" name="product_no" value="${burger.product_no}" />
											<td>
												<input form="form${status.count}" type="text" name="menu_name" value="${burger.menu_name}" />
											</td>
											<td>
												<input form="form${status.count}" type="number" name="single_price" value="${burger.single_price}"  style="width: 100px;"/>
											</td>
											<td>
												<input form="form${status.count}" type="number" name="set_price" value="${burger.set_price}" style="width: 100px;" />
											</td>
											<td>
												<input form="form${status.count}"  type="number" name="calory" value="${burger.calory}" style="width: 100px;" />
											</td>
											<td>
												<input form="form${status.count}"  type="text" name="display_yn" value="${burger.display_yn}" style="width: 100px;" />
											</td>
											<td>
												<input form="form${status.count}" type="text" name="img_url"  id="imgform${status.count}" value="${burger.img_url}" style="width: 100px;" />
											</td>
											<td>
												<input form="form${status.count}" type="file" name="img_file" style="width: 100%;"/>
											</td>
											<td>
												<button form="form${status.count}" type="button" id="saveform${status.count}">저장</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
					</div>
					<div class="card-footer small text-muted">Updated yesterday
						at 11:59 PM</div>
				</div>

			</div>
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
			<footer class="sticky-footer">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright © Your Website 2019</span>
				</div>
			</div>
			</footer>

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">정말 로그아웃 하시겠습니까?</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="/logOut">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
<!-- 	<script src="vendor/chart.js/Chart.min.js"></script> -->
	<script src="vendor/datatables/jquery.dataTables.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin.min.js"></script>

	<!-- Demo scripts for this page-->
	<script src="js/demo/datatables-demo.js"></script>
<!-- 	<script src="js/demo/chart-area-demo.js"></script> -->
	<script type="text/javascript">
	$(document).ready(function() {
	    var formData;
		$('button[type=button]').click(function() {
			var formId = $(this).attr('id');
			formId  = formId.substring(4);
			console.log(formId);
			if(formData instanceof FormData){
				uploadImgAPI(formId, formData);
			}else{
				ajaxUpdateEvent(formId);
			}
		});
		
		function ajaxUpdateEvent(formId){
	    	var formData = $('#'+formId).serialize();
	    	console.log(formData);
	        $.ajax({
	            type: 'POST',
	            url: '/updateBurger',
	            data: formData,
	            success: function(response){
	            	alert("상품변경에 성공했습니다.");
	            	console.log(response);
	            	window.location.href = "/getBurgerList";
	            },
	            error:function(){
	            	alert("상품변경에 실패했습니다.");
	            }
	        })
	        return false;
		};
	    
	    
		$('input[type=file]').on("change", function() {
			var $files = $(this).get(0).files;
			if ($files.length) {
				// Reject big files
				if ($files[0].size > $(this).data("max-size") * 1024) {
					console.log("Please select a smaller file");
					return false;
				}

				formData = new FormData();
				formData.append("image", $files[0]);
				
			}
		});

		function uploadImgAPI(formId, formData){
			
			var apiUrl = 'https://api.imgur.com/3/image';
			var apiKey = '488d9dd87112077';
			
			var settings = {
					"async" : true,
					"crossDomain" : true,
					"url" : apiUrl,
					"method" : "POST",
					"datatype" : "json",
					"headers" : {
						"Authorization" : "Client-ID " + apiKey
					},
					"processData" : false,
					"contentType" : false,
					"data" : formData,
					beforeSend : function(xhr) {
						$('#save_button').attr('disabled', true);
						console.log("Uploading");
					},
					success : function(res) {
						console.log(res.data.link);
						$('#img'+formId).val(res.data.link);
						ajaxUpdateEvent(formId);
					},
					error : function() {
						alert("Failed");
					}
				}
				$.ajax(settings).done(function(response) {
					console.log(response.data.link);
					console.log("Done");
				});
			
		}
		
	});
	</script>
</body>
</html>