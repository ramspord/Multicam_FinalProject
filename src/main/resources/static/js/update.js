$(document).ready(function(){

	    $("#adminPageMember_Update").click(function(){
    		const id = $("#id").val();
    		const pw = $("#pw").val();
    		const email = $("#email").val();
			const phone_no = $("#phone_no").val();
			const user_no = $("#user_no").val();
    		
    		$.post('../adminPageMember_Update',{id,pw,email,phone_no,user_no},function(data){
    			opener.parent.location.reload();
    			window.close();	
    			
    		});	
    		
    		//window.close();
		});
		

		$("#myInfo_Update").click(function(){

			
    		const id = $("#id").val();
			const pw = $("#pw").val();			
    		const name = $("#name").val();
    		const email = $("#email").val();
			const phone_no = $("#phone_no").val();
			const user_no = $("#user_no").val();
    		
    		$.post('../myInfo_Update',{id,pw,name,email,phone_no,user_no},function(data){
				alert("수정되었습니다");
    			opener.parent.location.reload();
    			window.close();	
    			
    		});	
    		
    		//window.close();
		});
		
		$("#myInfo_Delete").click(function(){
			
			if(confirm("삭제하시겠습니까?")==true){

				const user_no = $("#user_no").val();
    		
    			$.post('../myInfo_Delete',{user_no},function(data){

					$.post('../logout',{},function(data){
						alert("삭제되었습니다.");
    					opener.parent.location.reload();
    					window.close();	
					});

				
    			});	
			}else{
				return;
			}



			
    		
    		//window.close();
    	});


	
});