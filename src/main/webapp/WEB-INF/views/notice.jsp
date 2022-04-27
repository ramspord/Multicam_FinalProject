<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>공지사항 페이지</title>
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
		.fw-bolder{font-family: 'Dongle', sans-serif; font-size: 70px;}
		.lead{font-family: 'Dongle', sans-serif; font-size: 40px;}
		.h6{font-family: 'Dongle', sans-serif; font-size: 40px;}
		.btn{font-family: 'Dongle', sans-serif; font-size: 25px;}
		</style>
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <jsp:include page="nav.jsp" flush="true"/>

            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="text-center mb-5">
                        <h1 class="fw-bolder">공지사항</h1>
                        <p class="lead fw-normal text-muted mb-0">공지사항 게시판입니다</p>
                    </div>
                    <div class="row gx-5">
                        <div class="col-xl-8">
                            <!-- FAQ Accordion 1-->
                            <h2 class="fw-bolder mb-3">글 목록</h2>
                            <div class="accordion mb-5" id="accordionExample">
                            <c:forEach var="BoardList" items="${BoardList}" varStatus="status">
                            <c:if test="${status.count eq '1'}"><c:set var="headingOne" value="headingOne" /><c:set var="collapseOne" value="collapseOne" /></c:if>
                            <c:if test="${status.count eq '2'}"><c:set var="headingTwo" value="headingTwo" /><c:set var="collapseTwo" value="collapseTwo" /></c:if>
                            <c:if test="${status.count eq '3'}"><c:set var="headingThree" value="headingThree" /><c:set var="collapseThree" value="collapseThree" /></c:if>
                                <div class="accordion-item">
                                    <h3 class="accordion-header" id="headingTwo"><button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">${BoardList.title}</button></h3>
                                    <div class="accordion-collapse collapse" id="collapseTwo" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <strong>${BoardList.content}
                                            <c:if test="${memberVO.user_type eq 'A' }">
											<input id="idx" name="idx" type="hidden" value="${BoardList.idx}">
                                            <input id="NO" name="sign" type="hidden" value="update">
                                            <div id="updateBtn" class="badge bg-primary bg-gradient rounded-pill mb-2" style="cursor:pointer" onclick="update(this);">수정</div>
                                            <input id="NO" name="sign" type="hidden" value="delete">
                                            <div id="delBtn" class="badge bg-primary bg-gradient rounded-pill mb-2" style="cursor:pointer" onclick="del(this);">삭제</div>                                            
                                            </c:if>
                                            </strong>
                                        </div>
                                    </div>
                                </div>                           
                            </c:forEach>
                            </div>
                            <!-- FAQ Accordion 2-->
                        </div>
                        <div class="col-xl-4">
                            <div class="card border-0 bg-light mt-xl-5">
                                <div class="card-body p-4 py-lg-5">
                                    <div class="d-flex align-items-center justify-content-center">
                                        <div class="text-center">
                                            <div class="h6 fw-bolder">궁금한</div>
                                            <p class="text-muted mb-4">
                                                문의사항은
                                                <br />
                                                <a href="#!">talktalk@gmail.com</a>
                                            </p>
                                            <div class="h6 fw-bolder"></div>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-twitter"></i></a>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-facebook"></i></a>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-linkedin"></i></a>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-youtube"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${memberVO.user_type eq 'admin' }">
                                <a class="btn btn-primary" href="writeNotice">글쓰기</a>
                                </c:if>
                            </div>
                        </div>
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
                <script>
    	function del(btn){
            var form = document.createElement("form");
            document.body.appendChild(form);
            form.setAttribute("charset", "UTF-8");
            form.setAttribute("method", "Post");  //Post 방식
            form.setAttribute("action", "deleteNotice"); //요청 보낼 주소
            var idx = btn.parentNode.childNodes[2].previousElementSibling;
       		var hiddenField = document.createElement('input');
       		hiddenField.setAttribute('type','hidden');
       		hiddenField.setAttribute('name','idx');
       		hiddenField.setAttribute('value',idx.value);
       		form.appendChild(hiddenField);
       	    if(confirm("삭제하시겠습니까 ?") == true){
       	    	form.submit();
       	        alert("삭제되었습니다");
       	    }
       	    else{
       	    	alert("취소하셨습니다");
       	        return ;
       	    }
   		}
    	function update(btn){
            var form = document.createElement("form");
            document.body.appendChild(form);
            form.setAttribute("charset", "UTF-8");
            form.setAttribute("method", "Post");  //Post 방식
            form.setAttribute("action", "updateNotice"); //요청 보낼 주소
            var idx = btn.parentNode.childNodes[2].previousElementSibling;
       		var hiddenField = document.createElement('input');
       		hiddenField.setAttribute('type','hidden');
       		hiddenField.setAttribute('name','idx');
       		hiddenField.setAttribute('value',idx.value);
       		form.appendChild(hiddenField);
       	    if(confirm("수정하시겠습니까 ?") == true){
       	    	form.submit();
       	    }
       	    else{
       	    	alert("취소하셨습니다");
       	        return ;
       	    }
   		}
        </script>
    </body>
</html>
