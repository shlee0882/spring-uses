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
						<i class="fas fa-table"></i> 상품 등록
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
											<td><label for="chain_no">체인번호</label></td>
											<td><select class="selectpicker" name="chain_no" id="chain_no">
													<option value="1">맥도날드</option>
													<option value="2">롯데리아</option>
													<option value="3">버거킹</option>
													<option value="4">맘스터치</option>
											</select></td>
										</tr>
										<tr>
											<td><label for="menu_name">메뉴명</label></td>
											<td><input type="text" class="form-control"
												id="menu_name" name="menu_name" required></td>
										</tr>
										<tr>
											<td><label for="category">카테고리</label></td>
											<td>
												<select class="selectpicker" name="category" id="category">
													<option value="5">햄버거</option>
													<option value="6">치킨</option>
													<option value="7">사이드</option>
												</select>
											</td>
										</tr>
										<tr>
											<td><label for="single_price">단품가격</label></td>
											<td><input type="number" class="form-control"
												id="single_price" name="single_price" required></td>
										</tr>
										<tr>
											<td><label for="set_price">세트가격</label></td>
											<td><input type="number" class="form-control"
												id="set_price" name="set_price" required></td>
										</tr>
										<tr>
											<td><label for="calory">칼로리</label></td>
											<td><input type="number" class="form-control"
												id="calory" name="calory" required></td>
										</tr>
										<tr>
											<td>전시여부</td>
											<td><select class="selectpicker" name="display_yn" id='display_yn'>
													<option value="Y">Y</option>
													<option value="N">N</option>
											</select></td>
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
													style="float: right;">새 상품 등록</button></td>
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
			
		});
		
	</script>

</body>


</html>