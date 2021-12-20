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
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <jsp:include page="nav.jsp" flush="true"/>
            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-3">
                            <div class="d-flex align-items-center mt-lg-5 mb-4">
                                <div class="ms-3">
                                <c:choose>
                            	<c:when test="${placeDetail eq '공항'}">
                            	<div class="fw-bold" id="place">공항</div>
                                    <div class="text-muted">News, Business</div>
                            	</c:when>
                            	<c:when test="${placeDetail eq '병원'}">
								<div class="fw-bold" id="place">병원</div>
                                    <div class="text-muted">News, Business</div>
                            	</c:when>
                            	<c:when test="${placeDetail eq '식당'}">
								<div class="fw-bold" id="place">식당</div>
                                    <div class="text-muted">News, Business</div>
                            	</c:when>
                            	<c:otherwise>
                            	<div class="fw-bold" id="place">영화관</div>
                                    <div class="text-muted">News, Business</div>
                            	</c:otherwise>
                            	</c:choose>                                
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <!-- Post content-->
                            <article>
                                <!-- Post header-->
                                <header class="mb-4">
                                    <!-- Post title-->
                                    <h1 class="fw-bolder mb-1">Welcome to Blog Post!</h1>
                                    <!-- Post meta content-->
                                    <div class="text-muted fst-italic mb-2">January 1, 2021</div>
                                    <!-- Post categories-->
                                    <a class="badge bg-secondary text-decoration-none link-light" href="#!">Web Design</a>
                                    <a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a>
                                </header>
                                <!-- Preview image figure-->
                                <c:choose>
                            	<c:when test="${placeDetail eq '공항'}">
                            	<figure class="mb-4"><img class="img-fluid rounded-3 mb-3" src="./images/공항.jpg" alt="..." /></figure>
                            	</c:when>
                            	<c:when test="${placeDetail eq '병원'}">
								<figure class="mb-4"><img class="img-fluid rounded-3 mb-3" src="./images/병원.jpg" alt="..." /></figure>
                            	</c:when>
                            	<c:when test="${placeDetail eq '식당'}">
								<figure class="mb-4"><img class="img-fluid rounded-3 mb-3" src="./images/식당.jpg" alt="..." /></figure>
                            	</c:when>
                            	<c:otherwise>
                            	<figure class="mb-4"><img class="img-fluid rounded-3 mb-3" src="./images/영화관.jpg" alt="..." /></figure>
                            	</c:otherwise>
                            	</c:choose>
                                <!-- Post content-->
                            </article>
                            <!-- Comments section-->
                            <section>
                            <input type="hidden" name="user_no" id="user_no" value="${session.user_no }"/>
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <!-- Single comment-->
                                        <c:forEach var="categoryDetail" items="${categoryDetail}" varStatus="status">
                                        <div class="d-flex">
                                            <div class="flex-shrink-0" style="cursor:pointer;"><i class="bi bi-megaphone"></i></div>
                                            <div class="ms-3">
                                                <div class="fw-bold">${categoryDetail.place_text}
                                                </div>
                                            </div>
                                            <c:if test="${session.user_no eq 2 ||categoryDetail.user_no eq session.user_no}">
                                            	<div style="margin-left: auto; text-align: center;">
                                                <div class="badge bg-primary bg-gradient rounded-pill mb-2" style="cursor:pointer;" onclick="updateUserText(this);">수정</div>
                                                <div class="badge bg-primary bg-gradient rounded-pill mb-2" style="cursor:pointer;" onclick="deleteUserText(this);">삭제</div>
                                                </div>
                                            </c:if>
                                        </div>                                        
                                        </c:forEach>
										<!-- Comment form-->
                                        <form class="mb-4" id="form">
                                        <textarea id="userText" class="form-control" rows="3" placeholder="Join the discussion and leave a comment!" style="margin-top:15px"></textarea>
												<div style="margin-left: auto; text-align: center;">
                                                <div class="badge bg-primary bg-gradient rounded-pill mb-2" style="cursor:pointer;" onclick="addUserText();">추가</div>
                                                </div>
                                         </form>  
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- Footer-->
        <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2021</div></div>
                    <div class="col-auto">
                        <a class="link-light small" href="#!">Privacy</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Terms</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
        function addUserText(){
        	const text = $('#userText').val();
        	const place = $('#place').text();
        	console.log(place);
        	if(confirm("추가하시겠습니까 ?")==true){
        		$.post('../addUserText',{place,text},function(){
        			alert("추가하셨습니다.");
    				location.reload();
    			});        		
        	}else{
        		alert("취소하셨습니다.")
        	}
        }
        function updateUserText(){
        	const text = $('#userText').val();
        	const place = $('#place').text();
        	console.log(place);
			$.post('../updateUserText',{place,text},function(){
				console.log("asd");
			});
        }
        function deleteUserText(btn){
        	const text = btn.parentNode.previousElementSibling.childNodes[1].innerText;
        	const user_no = $('#user_no').val();
        	const place = $('#place').text();
        	if(confirm("삭제하시겠습니까 ?")==true){
        		$.post('../deleteUserText',{place,user_no,text},function(){
    				alert("삭제하셨습니다.");
    				location.reload();
    			});
        	}else{
        		alert("취소하셨습니다.");
        	}
        }
        </script>
    </body>
</html>
