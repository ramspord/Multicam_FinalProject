$(document).ready(function(){
	
	    $("#adminPage_Category_Insert_Btn").click(function(){
    		const place = $("#place").val();
    		const place_text = $("#place_text").val();
			const user_no = $("#user_no").val();
			
    		
    		$.post('../adminPage_Category_Insert',{place, place_text, user_no},function(data){
				alert("저장되었습니다");
    			opener.parent.location.reload();
    			window.close();	
    			
    		});	
    		
    		//window.close();
		});


		$("#adminPage_CategoryText_Insert_Btn").click(function(){
			
    		//alert('선택된 옵션 text 값=' + target.options[target.selectedIndex].text);     // 옵션 text 값
   		   // alert('선택된 옵션 value 값=' + target.options[target.selectedIndex].value);     // 옵션 value 값
			
	   		const place = $("select[name=selectbox] option:selected").text();
    		const place_text = $("#place_text").val();
			const user_no = $("#user_no").val();			
		
    		$.post('../adminPage_CategoryText_Insert',{place, place_text, user_no},function(data){
				alert("저장되었습니다");
    			opener.parent.location.reload();
    			window.close();	
    			
    		});	
    		
    		//window.close();
    	});
		
		$("select[name=selectbox1]").change(function(){
			alert($(this).val());
			
  			//console.log($(this).val()); //value값 가져오기
  			//console.log($("select[name=selectbox] option:selected").text()); //text값 가져오기
		});

	
});