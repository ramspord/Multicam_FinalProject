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


	
});