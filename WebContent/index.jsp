<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>BurgerInfo</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="css/landing-page.css" rel="stylesheet">

  <style>
  .bd-placeholder-img {
    font-size: 1.125rem;
    text-anchor: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }

  @media (min-width: 768px) {
    .bd-placeholder-img-lg {
      font-size: 3.5rem;
    }
  }
</style>

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand" href="#">BurgerInfo</a>
      <a class="btn btn-primary" href="#">Admin Login</a>
    </div>
  </nav>
  <!-- Masthead -->
  <header class="masthead text-white text-center">
    <div class="overlay"></div>

    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h1 class="mb-5">Welcome, Burger Info<br>Choose Your Hamburger</h1>
        </div>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <div class="form-row">
            <div class="col-12 col-md-1 col-lg-1">
            </div>
            <div class="col-12 col-md-4 col-lg-4">
              <select class="custom-select" id="inputGroupSelect02">
                <option selected>브랜드 선택</option>
 			  <c:forEach var="brand" items="${brandList}">
 			  	<option value="1">${brand.contents}</option>
			  </c:forEach>
              </select>
            </div>
            <div class="col-12 col-md-2 col-lg-2">
            </div>
            <div class="col-12 col-md-4 col-lg-4">
              <select class="custom-select" id="inputGroupSelect02">
                <option selected>메뉴 선택</option>
 			  <c:forEach var="menu" items="${menuList}">
 			  	<option value="1">${menu.contents}</option>
			  </c:forEach>
              </select>
            </div>
            <div class="col-12 col-md-1 col-lg-1">
            </div>
          </div>
        </div> 
        <br><br><br>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <div class="form-row">
            <div class="col-12 col-md-1 col-lg-1">
            </div>
            <div class="col-12 col-md-4">
              <select class="custom-select" id="inputGroupSelect02">
              <option selected>가격 선택</option>
 			  <c:forEach var="price" items="${priceList}">
 			  	<option value="1">${price.contents}</option>
			  </c:forEach>
              </select>
            </div>
            <div class="col-12 col-md-2 col-lg-2">
            </div>
            <div class="col-12 col-md-4">
              <select class="custom-select" id="inputGroupSelect02">
                <option selected>칼로리 선택</option>
 			  <c:forEach var="calory" items="${caloryList}">
 			  	<option value="1">${calory.contents}</option>
			  </c:forEach>
              </select>
            </div>
            <div class="col-12 col-md-1 col-lg-1">
            </div>
          </div>
        </div> 
        <br><br><br>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <div class="form-row">
            <div class="col-12 col-md-12">
	              <button id="submit" type="submit" class="btn btn-block btn-lg btn-primary">Search</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>


<div class="album py-5 bg-light">
  <div class="container">

    <div class="row" id="cardRow">
        
      </div>
      <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
          <li class="page-item disabled">
            <a class="page-link" href="#" tabindex="-1">Previous</a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#">Next</a>
          </li>
        </ul>
      </nav>
    </div>
  </div>

  <div class="bd-example bg-light">
    <div id="carouselExampleCaptions" class="carousel slide container" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="../img/macdonalds_logo.jpg" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>First slide label</h5>
            <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="../img/background7.jpg" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>Second slide label</h5>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="../img/event1.png" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>Third slide label</h5>
            <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>

  <!-- Footer -->
  <footer class="footer bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
          <p class="text-muted small mb-4 mb-lg-0">&copy; shlee0882 2019. All Rights Reserved.</p>
        </div>
        <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
          <ul class="list-inline mb-0">
            <li class="list-inline-item mr-3">
              <a target="_blank" rel="noopener noreferrer" href="https://shlee0882.tistory.com/" style="color: orange">
                <i class="fas fa-blog fa-2x fa-fw"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a target="_blank" rel="noopener noreferrer" href="https://github.com/shlee0882" style="color: black">
                <i class="fab fa-github fa-2x fa-fw"></i>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>

	$("#submit").click(function() {
	    $.ajax({
	        url : "/burgers",
	        type: "get",
	        success : function(resData){
	        	console.log(resData);
	        	var markup = '<div class="col-md-4">';
	        		markup += '<div class="card mb-4 shadow-sm">';
	 	            markup += '<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">';
	                markup += '<title>Placeholder</title>';
	                markup += '<rect width="100%" height="100%" fill="#f2f2f2">';
	                markup += '</rect>';
        	
	            var markup3 = '</svg>';
		            markup3 += '<div class="card-body">';
		            markup3 += '<table class="table">';
		            markup3 += '<thead>';
		            markup3 += '<tr>';
		            markup3 += '<th scope="col">항목</th>';
		            markup3 += '<th scope="col">내용</th>';
		            markup3 += '</tr>';
		            markup3 += '</thead>';
		            markup3 += '<tbody>';
				  
				  var markup5 = '</tbody>';
				  markup5 += '</table>';
				  markup5 += '</div>';
				  markup5 += '</div>';
				  markup5 += '</div>';
	        	
	        	var newMarkUp = "";
	        	for(var i=0; i<resData.length; i++){
	        		console.log(resData[i].menu_name);
	        		console.log(resData[i].img_url);
	        		console.log(resData[i].single_price);
	        		console.log(resData[i].set_price);
	        		console.log(resData[i].calory);
	        		
	                var markup2 = '<image xlink:href="'+resData[i].img_url+'" height="100%" width="100%"></image>';
	          	  
			        var markup4 = '<tr>';
					  markup4 += '<td>브랜드</td>';
					  markup4 += '<td>맥도날드</td>';
					  markup4 += '</tr>';
					  markup4 += '<tr>';
					  markup4 += '<td>메뉴명</td>';
					  markup4 += '<td>'+resData[i].menu_name+'</td>';
					  markup4 += '</tr>';
					  markup4 += '<tr>';
					  markup4 += '<td>단품가격</td>';
					  markup4 += '<td>'+resData[i].single_price+'</td>';
					  markup4 += '</tr>';
					  markup4 += '<tr>';
					  markup4 += '<td>세트가격</td>';
					  markup4 += '<td>'+resData[i].set_price+'</td>';
					  markup4 += '</tr>';
					  markup4 += '<tr>';
					  markup4 += '<td>칼로리</td>';
					  markup4 += '<td>'+resData[i].calory+'</td>';
					  markup4 += '</tr>';
					  
	        		newMarkUp += markup + markup2 + markup3 + markup4 + markup5;
	        		
	        	}
	        	
	        	console.log(newMarkUp);
	        	$("#cardRow").append(newMarkUp);
	        }
	    });
	});
	</script>
</body>

</html>
