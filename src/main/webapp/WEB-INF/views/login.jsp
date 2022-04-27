<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <meta name = "google-signin-client_id"content = "463425482277-faanimt3ihh4f0e1parmgcdv9tqm8bd7.apps.googleusercontent.com">
        <title>로그인 jsp</title>
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
		.lead{font-family: 'Dongle', sans-serif; font-size: 40px;}
		.btn{font-family: 'Dongle', sans-serif; font-size: 25px;}
		</style>
        

    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a class="navbar-brand" href="/">Talk Talk</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="/">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="javascript:category();">카테고리</a></li>
                        <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="javascript:notice();">공지사항</a></li>
                                    <li><a class="dropdown-item" href="javascript:proposal();">건의사항</a></li>
                                </ul>
                        </li>
                        
                        <li class="nav-item"><a class="nav-link active" href="loginPage">로그인</a></li>
                    </ul>
                </div>
                </div>
            </nav>
            <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <h1 class="fw-bolder">TALK TALK</h1>
                            <p class="lead fw-normal text-muted mb-0">세상을 바꾸는 힘!</p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                
                                <form id="login" method="post" action="../login">
                                    <!-- ID input-->
                                    <div id="loginform">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="id" name="id" type="text" placeholder="아이디를 입력해주세요" />
                                        <label>아이디</label>
                                       
                                        
                                        
                                    </div>
                                    <!-- Password input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="pw" name="pw" type="password" placeholder="비밀번호를 입력해주세요"/>
                                        <label>비밀번호</label>
                                    </div>
                                   
                                        
                                   
                              
                                    <!-- Submit Button-->
                                    
                                    <a class="d-grid"><button type="submit" class="btn btn-primary btn-lg">로그인</button></a><br>
                                	
									

                                    </form>  
                                    <div class="text-center mb-5">
                                            <a class="nav-link" href="./contact.html">회원가입</a>
                                            <a class="nav-link" href="#!">비밀번호 찾기</a>
                                    </div>
                                     <div class="text-center mb-5">
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-twitter"></i></a>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-facebook"></i></a>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-linkedin"></i></a>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-youtube"></i></a>
                                    </div>
                              
                            </div>
                        </div>
                    </div>
                    <!-- Contact cards-->
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="../js/my.js"></script>
	    <script src="https://apis.google.com/js/platform.js" async defer></script>
        
    </body>
</html>
