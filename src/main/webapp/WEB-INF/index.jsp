<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Small Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    	<script type="text/javascript">
		$(document).ready(function(){
			$("#ttsBtn").click(function(){
				const text=$("#text").val();
				$.post('../tts',{text},function(fileName){
					//alert(data);
					const audio=new Audio("../media/"+fileName+".mp3");
					audio.play();
				})
			});
		});
	</script>
    <body>
        <!-- Responsive navbar-->
        <jsp:include page="nav.jsp" flush="true"/>
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7">
                <textarea class="img-fluid rounded mb-4 mb-lg-0" placeholder=" 글을 작성해주세요"style="width: 100%;height: 9.25em;resize: none;"></textarea>
                </div>
                <div class="col-lg-5">
                    <h3 class="font-weight-light">노크를 하듯 상대방에게 Talk Talk</h3>
                    <p>
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?
                    </p>
                    <a class="btn btn-primary" href="#!">Text To Speach !</a>
                    <a class="btn btn-primary" href="#!">언어 전환 </a>
                </div>
            </div>
            <!-- Call to Action-->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">자주 쓰는 말</p></div>
            </div>
            <!-- Content Row-->
            <div class="row gx-4 gx-lg-5">
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h3 class="card-title">식당</h3>
								<div style="text-align : center;">
								     <img src="./images/식당.jpg" style="max-width:100%; height:auto;">
								</div>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h3 class="card-title">공항</h3>
                            	<div style="text-align : center;">
								     <img src="./images/공항.jpg" style="max-width:100%; height:auto;">
								</div>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h3 class="card-title">영화관</h3>
                            	<div style="text-align : center;">
								     <img src="./images/영화관.jpg" style="max-width:100%; height:auto;">
								</div>                            
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
