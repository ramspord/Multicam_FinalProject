<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>

	<style>
		::-webkit-input-placeholder {
			text-align: center;
		}
	</style>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Talk Talk</title>

	<!-- Favicon-->
		<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
		<link href="css/styles.css" rel="stylesheet" />
	<script>
		function category(){
			var form = document.createElement("form");
			document.body.appendChild(form);
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "Post");  //Post 방식
			form.setAttribute("action", "category"); //요청 보낼 주소
			form.submit();
		}
		function notice(){
			var form = document.createElement("form");
			document.body.appendChild(form);
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "Post");  //Post 방식
			form.setAttribute("action", "notice"); //요청 보낼 주소
			form.submit();
		}
		function proposal(){
			var form = document.createElement("form");
			document.body.appendChild(form);
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "Post");  //Post 방식
			form.setAttribute("action", "proposal"); //요청 보낼 주소
			form.submit();
		}
		function logout(){
			var form = document.createElement("form");
			document.body.appendChild(form);
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "Post");  //Post 방식
			form.setAttribute("action", "logout"); //요청 보낼 주소
			form.submit();
		}
	</script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

</head>
<body>
	<!-- Responsive navbar-->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container px-5">
				<a class="navbar-brand" href="/">Talk Talk</a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="javascript:category();">카테고리</a></li>
                        <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="javascript:notice();">공지사항</a></li>
                                    <li><a class="dropdown-item" href="javascript:proposal();">건의사항</a></li>
                                </ul>
                            </li>
                            <c:choose>
                            <c:when test="${loginSign eq 'Y' }">
                        <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">${session}님</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="javascript:logout();">로그아웃</a></li>
                                </ul>
                            </li>
                            </c:when>
                            <c:otherwise>
								<li class="nav-item"><a class="nav-link" href="./login.html">로그인</a></li>                            
                            </c:otherwise>
                            </c:choose>
                    </ul>
                </div>
            </div>
        </nav>
	<!-- Page Content-->
        <div class="container px-4 px-lg-5">
	<!-- Heading Row-->
		<center>
            <div class="align-items-center my-4">
                <div class="col-lg-7">
					<h3 class="font-weight-light">상대방에게 노트하듯 다가가보세요</h3>
						<div class="input-div">
							<div>
								<textarea class="img-fluid rounded mb-4 mb-lg-0" autofocus="" placeholder="&#13;&#10; &#13;&#10; 내용을 입력하세요." id="text" maxlength="184" rows="1" cols="184" style="width: 100%;height: 8em; resize: none;" spellcheck="false"></textarea>
							</div>

						<button id="ttsBtn"><img src="../images/스피커.png" id="speaker" width="50"></button>
						<button id="translateBtn"><img src="../images/번역.png" id="translate" width="50"></button>
						<button id="noteBtn"><img src="../images/필기.png" id="note" width="50"></button>

						</div>
                </div>
            </div>
		</center>
	<!-- 자주 쓰는 말 -->
		<center>
			<div class="align-items-center my-4">
				<div class="col-lg-7">
					<div class="card text-white bg-secondary my-5 py-3 text-center">
						<div class="card-body"><p class="text-white m-0">자주 쓰는 말</p></div>
					</div>
				</div>
			</div>
		</center>
	<!-- 장소 선택 -->
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
			<div class="container px-4 px-lg-5"><p class="m-0 text-center text-white"> &copy; Talk Talk </p></div>
		</footer>
	<!-- Bootstrap core JS-->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
		<script src="js/scripts.js"></script>
</body>
</html>