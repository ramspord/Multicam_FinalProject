$(document).ready(function(){
	$("#ttsMgphone1").click(function(){
		const text=$("#text").val();
		$.post('../tts',{text},function(fileName){
			alert(data);
			const audio=new Audio("../media/"+fileName+".mp3");
			audio.play();
		})
	});
});