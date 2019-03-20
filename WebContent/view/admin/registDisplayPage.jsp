<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin - Charts</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.7/dist/css/bootstrap-select.min.css">

<style type="text/css">
.td_vertical tr td {
	vertical-align: inherit;
}

.td_vertical tr td input {
	width: 220px;
}
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
				<a class="dropdown-item" href="#">Settings</a> <a
					class="dropdown-item" href="#">Activity Log</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#" data-toggle="modal"
					data-target="#logoutModal">Logout</a>
			</div></li>
	</ul>

	</nav>

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/getBurgerList">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>상품 조회 / 변경</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/registPage"> <i class="fas fa-fw fa-table"></i> <span>상품 등록</span></a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/getDisplayList">
					<i class="fas fa-fw fa-table"></i> <span>전시 조회 / 변경</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="/registDisplayPage">
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
					<li class="breadcrumb-item active">등록</li>
				</ol>

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> 전시 등록
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<form id="tableForm" name="tableForm" class="needs-validation"
								novalidate>
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0"
									style="margin: auto; display: block; border: 0px;">
									<thead>
										<tr>
											<th width="30%">항목</th>
											<th width="70%">내용</th>
										</tr>
									</thead>
									<tbody class="td_vertical">
										<tr>
											<td><label for="display_type">전시유형</label></td>
											<td><select class="selectpicker" name="display_type" id="display_type">
													<option value="banner">banner</option>
													<option value="main">main</option>
											</select></td>
										</tr>
										<tr>
											<td><label for="name">이름</label></td>
											<td><input type="text" class="form-control"
												id="name" name="name" required></td>
										</tr>
										<tr>
											<td><label for="display_yn">전시유무</label></td>
											<td>
												<select class="selectpicker" name="display_yn" id="display_yn">
													<option value="Y">Y</option>
													<option value="N">N</option>
												</select>
											</td>
										</tr>
										<tr>
											<td><label for="priority">전시우선순위</label></td>
											<td><input type="number" class="form-control"
												id="priority" name="priority" required></td>
										</tr>
										<tr>
											<td>이미지 첨부</td>
											<td id="imgTd">
												<input type="file" accept="image/*" data-max-size="5000" id="imgUpload">
											</td>
										</tr>
										<tr>
											<td><label for="img_url">업로드 된 이미지 url</label></td>
											<td><input type="text" class="form-control" id="img_url"
												name="img_url" placeholder="업로드가 완료되면 url이 나타납니다."
												style="font-size: 0.7em;" required></td>
										</tr>
										<tr>
											<td colspan="2"><button type="button"
													class="btn btn-secondary" id="save_button"
													style="float: right;">새 전시 등록</button></td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
					<div class="card-footer small text-muted">Updated yesterday
						at 11:59 PM</div>
				</div>
			</div>
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

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin.min.js"></script>

	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.7/dist/js/bootstrap-select.min.js"></script>

	<!-- (Optional) Latest compiled and minified JavaScript translation files -->
	<!-- 	<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.7/dist/js/i18n/defaults-*.min.js"></script> -->
	<!-- Demo scripts for this page-->

	<script type="text/javascript">
		$("document").ready(function() {
			
			$('#save_button').click(function() {
				validEvent();
				var insVal = false;
				insVal = insertValidate();
				console.log(insVal);
				if(insVal == true){
					console.log("go");
					ajaxInsertEvent();
				}
			});

			function validEvent() {
			  'use strict';
			    // Fetch all the forms we want to apply custom Bootstrap validation styles to
			    var forms = document.getElementsByClassName('needs-validation');
			    // Loop over them and prevent submission
			    var validation = Array.prototype.filter.call(forms, function(form) {
			      form.addEventListener('click', function(event) {
			        form.classList.add('was-validated');
			      }, false);
			    });
			};
			
			function insertValidate(){
				if($('#display_type').val() == ''){
					alert("전시유형을 확인해주세요.")
					return false;
				}else if($('#name').val() == ''){
					alert("이름을 확인해주세요.")
					return false;
				}else if($('#priority').val() == ''){
					alert("전시우선순위를 확인해주세요.")
					return false;
				}else if($('#display_yn').val() == ''){
					alert("전시여부를 확인해주세요.")
					return false;
				}else if( $('#img_url').val() == ''){
					alert("이미지 경로를 확인해주세요.")
					return false;
				}
				return true;
			}
			
			function ajaxInsertEvent(){
		    	var formData = $("#tableForm").serialize();
		        $.ajax({
		            type: 'POST',
		            url: '/insertDisplay',
		            data: formData,
		            success: function(response){
		            	alert("전시등록에 성공했습니다.");
		            	console.log(response);
		            	window.location.href = "/registDisplayPage";
		            },
		            error:function(){
		            	alert("전시등록에 실패했습니다.");
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
					var apiUrl = 'https://api.imgur.com/3/image';
					var apiKey = '488d9dd87112077';

					var formData = new FormData();
					formData.append("image", $files[0]);

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
						},
						error : function() {
							alert("Failed");
						}
					}
					$.ajax(settings).done(function(response) {
						console.log(response.data.link);
						console.log("Done");
						$('#img_url').val(response.data.link);
						$('#save_button').attr('disabled', false);
					});
				}
			});
		});
		
		
	</script>

</body>


</html>