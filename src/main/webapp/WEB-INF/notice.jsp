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
                        <h1 class="fw-bolder">공지사항</h1>
                        <p class="lead fw-normal text-muted mb-0">How can we help you?</p>
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
                                            <div class="h6 fw-bolder">Have more questions?</div>
                                            <p class="text-muted mb-4">
                                                Contact us at
                                                <br />
                                                <a href="#!">support@domain.com</a>
                                            </p>
                                            <div class="h6 fw-bolder">Follow us</div>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-twitter"></i></a>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-facebook"></i></a>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-linkedin"></i></a>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-youtube"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${memberVO.user_type eq 'A' }">
                                <a class="btn btn-primary" href="./writeNotice.html">글쓰기</a>
                                </c:if>
                            </div>
                        </div>
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
