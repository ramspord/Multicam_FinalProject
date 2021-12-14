$(document).ready(function(){
	
	const id=$.cookie("id");
	if(id){
		$("#login").html(id+" login ok <button id='logoutBtn'>로그아웃</button>");
	}
		
	
	
	
	$("#loginBtn").click(function(){
		const id=$("#id").val();
		const pw=$("#pw").val();
		
		//alert(id+":"+pw);
		
		$.post('../login', {id,pw}, function(data){
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

		
});

	

