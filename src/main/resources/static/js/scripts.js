$(document).ready(function(){
	$("#insertBookmark").click(function(){

	const user_text=$("textarea").val();
	$.post('insertBookmark',{user_text},function(data){
		
			$("#msg").html(data);
		});
	
	})
})