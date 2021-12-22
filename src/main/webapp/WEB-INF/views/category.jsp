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
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
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
<!--             <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a class="navbar-brand" href="/">Talk Talk</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="./portfolio-overview.html">카테고리</a></li>
                        <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="javascript:notice();">공지사항</a></li>
                                    <li><a class="dropdown-item" href="./proposal.html">건의사항</a></li>
                                </ul>
                            </li>
                        <li class="nav-item"><a class="nav-link" href="./login.html">로그인</a></li>
                    </ul>
                </div>
            </div>
            </nav> -->
            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="text-center mb-5">
                        <h1 class="fw-bolder">Our Work</h1>
                        <p class="lead fw-normal text-muted mb-0">Company portfolio</p>
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
            <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
