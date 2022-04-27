<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		.card-title{font-family: 'Dongle', sans-serif; font-size: 40px;}
		.fw-bolder{font-family: 'Dongle', sans-serif; font-size: 60px;}
		.card-body{font-family: 'Dongle', sans-serif; font-size: 40px;}
		</style>
    </head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<script type="text/javascript">
 		$(document).ready(function(){
/* 			$("#ttsmgphone").click(function(){
				const text=$("#ttsmgphone").parent().next().children().first().text();
				//alert(text);
				$.post('../tts',{text},function(fileName){
					//alert(data);
					const audio=new Audio("../media/"+fileName+".mp3");
					audio.play();
				})
			}); */
		}); 
		
		function tts(btn){
			const text = btn.parentNode.nextSibling.nextSibling.firstChild.nextSibling.innerText;
			const language = "ko";
 			$.post('../tts',{text,language},function(fileName){
				//alert(data);
				const audio=new Audio("../media/"+fileName+".mp3");
				audio.play();
			}); 
		}
	</script>
    
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <jsp:include page="views/nav.jsp" flush="true"/>
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
                                    <div class="text-muted">카테고리 - 공항</div>
                            	</c:when>
                            	<c:when test="${placeDetail eq '병원'}">
								<div class="fw-bold" id="place">병원</div>
                                    <div class="text-muted">카테고리 - 병원</div>
                            	</c:when>
                            	<c:when test="${placeDetail eq '식당'}">
								<div class="fw-bold" id="place">식당</div>
                                    <div class="text-muted">카테고리 - 식당</div>
                            	</c:when>
                            	<c:otherwise>
                            	<div class="fw-bold" id="place">영화관</div>
                                    <div class="text-muted">카테고리 - 영화관</div>
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
                                    <h1 class="fw-bolder mb-1">카테고리 설정</h1>
                                    <!-- Post meta content-->
                                    <div class="text-muted fst-italic mb-2">카테고리 설정 페이지 입니다</div>
                                    
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
                                            <div class="flex-shrink-0" style="cursor:pointer;"><i class="bi bi-megaphone" id="ttsmgphone" onclick="tts(this);"></i></div>
                                            <div class="ms-3">
                                                <div class="fw-bold">${categoryDetail.place_text}
                                                <input type="hidden" value="${categoryDetail.place_text}" id="text_test">
                                                </div>
                                            </div>
                                            <c:if test="${session.user_no eq 2 ||categoryDetail.user_no eq session.user_no}">
                                            	<div style="margin-left: auto; text-align: center;">
                                                <!-- <div class="badge bg-primary bg-gradient rounded-pill mb-2" style="cursor:pointer;" onclick="updateUserText(this);">수정</div> -->
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
                    <div class="col-auto"><div class="small m-0 text-white">TALK TALK  2021</div></div>
                    
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
