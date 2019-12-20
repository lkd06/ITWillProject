/* 휴대폰 구매페이지 */
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

var form_total = document.myform.total.value();
var form_total2 = document.myform.total2.value();
var form_total3 = document.myform.total3.value();

function CheckChoice(whichbox){

	//input에서 id값
	//input에서 value값
	if (whichbox.checked == false) { //체크 해제시
		form_total = 0;
		form_total2 = 0;
	}
    else if(whichbox.checked == true) { //체크시
    	/*form_total = eval(whichbox.id);
    	form_total2 = eval(whichbox.value);*/
    	if(whichbox.id=="0"){
    		form_total2 = eval(whichbox.value);
    	}else if(whichbox.value=="0"){
    		form_total = eval(whichbox.id);
    	}else{
    		form_total = eval(whichbox.id);
        	form_total2 = eval(whichbox.value);
    	}
    }
	
    document.myform.total.value = Math.floor(''+eval(form_total));// 정상요금
    document.myform.total2.value = Math.floor(''+eval(form_total2)); //요금제
	document.myform.total3.value = Math.floor(''+eval(form_total + form_total2));// 정상가 - 요금제 = total3
}

function InitForm() {
    
	/*document.myform.total.value='0';
	document.myform.total2.value='0';
	document.myform.total3.value='0';*/

	for(xx=0; xx < document.myform.elements.length; xx++) {
		if(document.myform.elements[xx].type == 'radio') {
			document.myform.elements[xx].checked = false;
		}
	}
}

