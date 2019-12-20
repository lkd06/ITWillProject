<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String phone = (String)request.getAttribute("phone");
	String name = (String)request.getAttribute("name");
	String email = (String)request.getAttribute("email");
	int price = (Integer)request.getAttribute("price");
	String pro_type = (String)request.getAttribute("pro_type");
	
	if(pro_type=="pshop" || pro_type.equals("pshop")){
		price = price/1000;
	}else if(pro_type=="acshop" || pro_type.equals("acshop")){
		price = price/100;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>2조 통신사 프로젝트</title>
    <link rel="shortcut icon" type="image x-icon" href="/project/resources/images/it.png">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp06032452'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : 'IT Telecom',
	    amount : <%=price %>,
	    buyer_email : '<%=email %>',
	    buyer_name : '<%=name %>',
	    buyer_tel : '<%=phone %>',
	    //buyer_addr : '',
	    buyer_postcode : '123-456',
	    //m_redirect_url : 'https://192.168.16.13:8080/project/pay.action'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        
	       	location.href="<%=cp %>/pay2.action";
	        
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
		    
		    location.href="<%=cp %>";
	    }
	});
	
</script>
	
</head>
<body>



</body>
</html>