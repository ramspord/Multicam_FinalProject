<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <title>카테고리 페이지</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">
		<style>
		.fw-bolder{font-family: 'Dongle', sans-serif; font-size: 60px;}
		.h3{font-family: 'Dongle', sans-serif; font-size: 50px;}
		.lead{font-family: 'Dongle', sans-serif; font-size: 40px;}
		</style>
                <script>
        function categoryDetail(btn){
            var form = document.createElement("form");
            document.body.appendChild(form);
            form.setAttribute("charset", "UTF-8");
            form.setAttribute("method", "Post");  //Post 방식
            form.setAttribute("action", "categoryDetail"); //요청 보낼 주소
            var place = btn.text;
       		var hiddenField = document.createElement('input');
       		hiddenField.setAttribute('type','hidden');
       		hiddenField.setAttribute('name','place');
       		hiddenField.setAttribute('value',place);
       		form.appendChild(hiddenField);
       		
            form.submit(); 
        }
        </script>
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <jsp:include page="nav.jsp" flush="true"/>

            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="text-center mb-5">
                        <h1 class="fw-bolder">카테고리</h1>
                        <p class="lead fw-normal text-muted mb-0">상황에 맞는 문장을 선택해주세요</p>
                    </div>
                    <div class="row gx-5">
						<c:forEach var="category" items="${category}" varStatus="status">
                        <div class="col-lg-6">
                            <div class="position-relative mb-5">
                            	<c:choose>
                            	<c:when test="${category eq '공항'}">
                            	<img class="img-fluid rounded-3 mb-3" src="./images/공항.jpg" alt="..." />
                                <a class="h3 fw-bolder text-decoration-none link-dark stretched-link" href="#" onclick="categoryDetail(this);">${category}</a>
                            	</c:when>
                            	<c:when test="${category eq '병원'}">
                            	<img class="img-fluid rounded-3 mb-3" src="./images/병원.jpg" alt="..." />
                                <a class="h3 fw-bolder text-decoration-none link-dark stretched-link" href="#" onclick="categoryDetail(this);">${category}</a>
                            	</c:when>
                            	<c:when test="${category eq '식당'}">
                            	<img class="img-fluid rounded-3 mb-3" src="./images/식당.jpg" alt="..." />
                                <a class="h3 fw-bolder text-decoration-none link-dark stretched-link" href="#" onclick="categoryDetail(this);">${category}</a>
                            	</c:when>
                            	<c:otherwise>
                            	<img class="img-fluid rounded-3 mb-3" src="./images/영화관.jpg" alt="..." />
                                <a class="h3 fw-bolder text-decoration-none link-dark stretched-link" href="#" onclick="categoryDetail(this);">${category}</a>
                            	</c:otherwise>
                            	</c:choose>
                            </div>
                        </div>							
						</c:forEach>
                    </div>
                </div>
            </section>
        </main>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">TALK TALK 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
