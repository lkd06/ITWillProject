var win_set = function(){
	document_height = $(document).height();
	document_scrollTop = $(document).scrollTop(); 
	window_height = $(window).height();
	foots_height = $("#foots").height();
	gap = document_height - foots_height - window_height; 
	bottom = document_scrollTop - gap ; 

	if(document_scrollTop > gap){
		$(".menu").css("bottom", bottom+"px");
	}else{
		$(".menu").css("bottom","0");
	}
}
  
$(document).ready(function(){
	win_set();
});
$(window).resize(function(){
	win_set();
});
$(window).scroll(function (){
	win_set();
});


var form_total=0;
var form_total2=0;
var form_total3=0;
function CheckChoice(whichbox){
    
	//input에서 id값
	//input에서 value값
	if (whichbox.checked == false) { //체크 해제시
		form_total -= eval(whichbox.id); 
		form_total2 -= eval(whichbox.value); 
	}
    else { //체크시
    	form_total += eval(whichbox.id);
    	form_total2 += eval(whichbox.value);
    }
	
    document.myform.total.value = ''+eval(4400 + form_total);// 필수선택 4400원 추가
    document.myform.total2.value = ''+eval(form_total2); //할인가
    document.myform.total3.value = ''+eval(4400 + form_total - form_total2);// 필수선택 4400원 + 정상가 - 할인가 = total3
}

function InitForm() {
    
	document.myform.total.value='0';
	document.myform.total2.value='0';

	for (xx=0; xx < document.myform.elements.length; xx++) {
      
		if (document.myform.elements[xx].type == 'checkbox') {
			
        document.myform.elements[xx].checked = false;
		}
	}
}