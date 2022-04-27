<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        function admin(){
            var form = document.createElement("form");
            document.body.appendChild(form);
            form.setAttribute("charset", "UTF-8");
            form.setAttribute("method", "Post");  //Post 방식
            form.setAttribute("action", "adminpage_board"); //요청 보낼 주소            
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
</head>
<body>
		
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a class="navbar-brand" href="/">Talk Talk</a>
                <input type="hidden" value="${memberVO.user_no }" id="myInfoNo">
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
                                    <c:set var="admin" value="${memberVO.user_type }" />
                                    <c:if test="${admin eq 'admin' }">
                                    	<li><a class="dropdown-item" href="javascript:admin();">관리자페이지</a></li>
                                	</c:if>
                                </ul>
                            </li>
                            <c:choose>
                            <c:when test="${loginSign eq 'Y' }">
                        	<li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">${session.id}님 반갑습니다.</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                	
                                    <li><a class="dropdown-item" onclick="window.open('/myInfo?user_no=${memberVO.user_no }', '_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=500,width=500,height=750');"">내정보</a></li>
                                    <li><a class="dropdown-item" href="javascript:logout();">로그아웃</a></li>
                                </ul>
                            </li>
                            </c:when>
                            <c:otherwise>
								<li class="nav-item"><a class="nav-link" href="loginPage">로그인</a></li>                            
                            </c:otherwise>
                            </c:choose>
                    </ul>
                </div>
            </div>
        </nav>
        
</body>
</html>