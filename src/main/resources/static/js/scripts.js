$(document).ready(function(){

	loginText();


	function loginText() {
		const id = document.getElementById("member").value;
		const user_type= document.getElementById("user_type").value;

		
		//로그인한 아이디 user_type이 admin이면 관리자페이지가 보이고 아니면 hide
		if(user_type=="user"){		
			$("#adminPage_hide").hide();
		}else if(user_type=="admin"){
			$("#adminPage_hide").show();
		}

		//loginDiv값을 변경 
		const element = document.getElementById('loginDiv');
		element.innerHTML = '<div id="loginDiv">'+id+'님 안녕하세요<div>';

		


	}
	


	
});