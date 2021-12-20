$(document).ready(function(){

	$("#loginBtn").click(function(){
		const id=$("#id").val();
		const pw=$("#pw").val();
		
		//alert(id+":"+pw);
		
		$.post('../../login', {id,pw}, function(data){
			data=JSON.parse(data);
			if(data.id){
				$("#login").html(data.id+" login ok <button id='logoutBtn'>로그아웃</button>");
				$.cookie("id",data.id);
			}else{
				alert("회원가입이 되어있지 않습니다.")
			}

		});
	}); 
		
		$(document).on("click", "#logoutBtn", function(){
			alert("로그아웃됩니다.");
		$.post('../logout',{},function(data){
			data=JSON.parse(data);
			if(data.msg=="ok"){
				$.removeCookie("id");
				location.reload();
			}else{
				alert(data.msg);
			}
		});
	});

         //아래부터 회원가입 정규식  
		
		/*$("#id").blur(function(){
			if(idJ.test($(this).val())) {
				console.log(idJ.test($(this).val()));
				$("#id_check").text('');
			}else {
				$('#id_check').text('아이디는 4~20자리로 첫 글자 숫자가 불가합니다.');
				$('#id_check').css('color','blue');
			}
		});*/



		
		$("#pw").blur(function(){
			if(pwJ.test($(this).val())) {
				console.log(pwJ.test($(this).val()));
				$("#pw_check").text('');
			}else {
				$('#pw_check').text('최소 8자리에 대문자1, 소문자1, 숫자1, 특수문자1를 포함해야 합니다. ');
				$('#pw_check').css('color','blue');
			}
		});
		
		$("#pwd").blur(function(){
			if($('#pw').val() != $(this).val()){
				$('#pwd_check').text('비밀번호가 일치하지 않습니다');
				$('#pwd_check').css('color','blue');
			}else{
				$('#pwd_check').text('');
			}
		});
		
		
		$("#name").blur(function(){
			if(nameJ.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#name_check").text('');
			}else {
				$('#name_check').text('한글만 입력 가능 합니다');
				$('#name_check').css('color','blue');
			}
		});
		
		$("#email").blur(function(){
			if(emailJ.test($(this).val())) {
				console.log(emailJ.test($(this).val()));
				$("#email_check").text('');
			}else {
				$('#email_check').text('이메일 형식으로 입력해주세요 ex. TalkTalk@gmail.com');
				$('#email_check').css('color','blue');
			}
		});
		
		$("#phone_no").blur(function(){
			if(phonenoJ.test($(this).val())) {
				console.log(phonenoJ.test($(this).val()));
				$("#phoneno_check").text('');
			}else {
				$('#phoneno_check').text('전화번호 형식으로 입력해주세요 ex. 010-1234-5678');
				$('#phoneno_check').css('color','blue');
			}
		});
		
		// 가입하기 실행 버튼 유효성 검사!
		
		var inval_Arr = new Array(4).fill(false);
			$('#submitButton').click(function(){
				
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		if (($('#pw').val() == ($('#pwd').val()))
				&& pwJ.test($('#pw').val())) {	
			inval_Arr[0] = true;
		} else {
			inval_Arr[0] = false;
		}
		
		// 이름 정규식
		if (nameJ.test($('#name').val())) {
			inval_Arr[1] = true;	
		} else {
			inval_Arr[1] = false;
		}
		
		// 이메일 정규식
		if (emailJ.test($('#email').val())){
			console.log(emailJ.test($('#email').val()));
			inval_Arr[2] = true;
		} else {
			inval_Arr[2] = false;
		}
		
		// 휴대폰번호 정규식
		if (phonenoJ.test($('#phone_no').val())) {
			console.log(phoneJ.test($('#phone_no').val()));
			inval_Arr[3] = true;
		} else {
			inval_Arr[3] = false;
		}

		
		var validAll = true;
		for(var i = 0; i < inval_Arr.length; i++){
			
			if(inval_Arr[i] == false){
				validAll = false;
			}
		}
		
		if(validAll){ // 유효성 모두 통과
			alert('회원가입이 정상적으로 처리되었습니다');
			
		} else{
			alert('입력 정보를 확인해주세요')
			
		}
	});

		
});

function logout(){
	var form = document.createElement("form");
	document.body.appendChild(form);
	form.setAttribute("charset","UTF-8");
	form.setAttribute("method","Post");
	form.setAttribute("action","logout");
	alert("로그아웃됩니다.");
	form.submit();
}

	
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
