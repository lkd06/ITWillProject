//XMLHttpRequest

var xmlHttp;

function createXMLHttpRequest(){
	
	var xmlReq = false;
	
	if(window.XMLHttpRequest) {
		//Non-Microsoft Browser
		//오페라나 사파리 같은게 밑에처럼 객체 생성
		xmlReq = new XMLHttpRequest();
		
	}else if(window.ActiveXObject) {
		//Microsoft Browser 5.0 일때
		try {
			
			xmlReq = new ActiveXObject("Msxml2.XMLHTTP");
			
		} catch (e) {
			xmlReq = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	return xmlReq;
}