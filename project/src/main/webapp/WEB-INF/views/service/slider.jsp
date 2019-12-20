<%@ page session="false" pageEncoding="utf-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<style type="text/css">
	
	.img {
		width: 80%;
		height: 30%;
	}
	
</style>

</head>
<body>

<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
    	<a href="/project/service_view.action?num=4&list=flo"><img class="d-block w-100 img" src="/project/resources/image/flo.png" alt="First slide"></a>
    </div>
    
    <div class="carousel-item">
    	<a href="/project/service_view.action?num=1&list=wavve데이터"><img class="d-block w-100 img" src="/project/resources/image/wavve.png" alt="Second slide"></a>
    </div>
  </div>
  
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>

</body>
</html> 
