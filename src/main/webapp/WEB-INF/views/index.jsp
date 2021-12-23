<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>TALK TALK 메인페이지</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <style>
		::-webkit-input-placeholder {
			text-align: center;
		}
	   </style>
        
    </head>
    <body>
        <!-- Responsive navbar-->
        <jsp:include page="nav.jsp" flush="true"/>
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
		<center>
			<div class="align-items-center my-4">
				<div class="col-lg-7">
					<h3 class="font-weight-light">상대방에게 노트하듯 다가가보세요.</h3>
						<div class="input-div">
						<form action="../insertBookmark" method="post" enctype="multipart/form-data">
							<div>
								<textarea class="img-fluid rounded mb-4 mb-lg-0" autofocus="" placeholder="내용을 입력하세요.(여성)" name="user_text" id="text" maxlength="184" rows="1" cols="184" style="width: 100%; height: 8em; resize: none;" spellcheck="false"></textarea>
							</div>
							<input type="submit" value="즐겨찾기 등록" class="btn btn-primary" id="insertBookmark" style="margin-bottom:15px;">
						</form>
						</div>

								<button id="ttsBtn"><img src="../images/스피커.png" id="speaker" width="50" onclick="tts();"></button>
								<button id="translateBtn"><img src="../images/번역.png" id="translate" width="50" onclick="clickTrans();"></button>
								<!-- <button id="noteBtn"><img src="../images/sex.png" id="note" width="50"></button> --> 
				</div>
			</div>
			</form>
		</center>

            <!-- Call to Action-->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body">
                 <form action="../bookmarkList" method="post" enctype="multipart/form-data">
               		 <input type="submit" class="btn btn-primary" id="bookmarkList" value="즐겨찾기 보기">
             	 </form>
                <c:forEach  var="article" items="${bookmarkList }" varStatus="articleNum" >
                  <div class="d-flex">
                      <div class="flex-shrink-0" style="cursor:pointer;"><i class="bi bi-megaphone"></i></div>
                      <div class="ms-3">
                          <div class="fw-bold">${article.user_text}   <input type="hidden" value="${article.user_text}" name=text id="text_test">
                          
                          </div>
                      </div>
                          <div style="margin-left: auto; text-align: center;">
                          <div id="ttsmgphone" class="badge bg-primary bg-gradient rounded-pill mb-2" style="cursor:pointer;" onclick="tts2(this);">소리</div>
                          <a href="${path}/deleteBookmark.do?user_text=${article.user_text}" class="badge bg-primary bg-gradient rounded-pill mb-2" style="cursor:pointer;">삭제</a>
                         </div>                                            
                  </div>                               
    </c:forEach>
                </div>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/my.js"></script>
            	<script type="text/javascript">
		$(document).ready(function(){
/* 			$("#ttsBtn").click(function(){
				const text=$("#text").val();
				$.post('../tts',{text},function(fileName){
					//alert(data);
					const audio=new Audio("../media/"+fileName+".mp3");
					audio.play();
				})
			}); */
		});
		function clickTrans(){
			const placeholder = $('#text').attr("placeholder");
			if(placeholder == "내용을 입력하세요.(여성)"){
				$('#text').attr("placeholder", "Please enter your details");					
			}else{
				$('#text').attr("placeholder", "내용을 입력하세요.(여성)");
			}
		}
		
		function tts(btn){
			const text=$("#text").val();
			const placeholder = $('#text').attr("placeholder");
			if(placeholder == "내용을 입력하세요.(여성)"){
				const language = "ko";
	 			$.post('../tts',{text,language},function(fileName){
					//alert(data);
					const audio=new Audio("../media/"+fileName+".mp3");
					audio.play();
					$("#text").val('');
				}); 			
			}else{
				const language = "en";
	 			$.post('../tts',{text,language},function(fileName){
					//alert(data);
					const audio=new Audio("../media/"+fileName+".mp3");
					audio.play();
					$("#text").val('');
				}); 
			}
		}
		function tts2(btn){
			const text = btn.parentNode.previousElementSibling.firstChild.nextSibling.innerText
			const language = "ko";
 			$.post('../tts',{text,language},function(fileName){
				//alert(data);
				const audio=new Audio("../media/"+fileName+".mp3");
				audio.play();
			}); 
		}
	</script>
        
    </body>
</html>
