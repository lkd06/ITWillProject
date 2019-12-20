<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2조 통신사 프로젝트</title>
<link rel="shortcut icon" type="image x-icon" href="/project/resources/images/it.png">

<script type="text/javascript">

$(document).ready(function(){
	 /* 
	 inner : 안에 공간
	 radius : 전체 크기
	 */
	 
	var totalVisitors = ${totalData };
	var visitorsData = {
		"New vs Returning Visitors": [{
			click: visitorsChartDrilldownHandler,
			cursor: "pointer",
			explodeOnClick: false,
			innerRadius: "75%",
			legendMarkerType: "square",
			name: "New vs Returning Visitors",
			radius: "100%",
			showInLegend: true,
			startAngle: 90,
			type: "doughnut",
			dataPoints: ${newVsReturningVisitorsDataPoints }
		}],
		"New Visitors": [{
			color: "#E7823A",
			name: "New Visitors",
			type: "column",
			xValueType: "dateTime"
		}],
		"Returning Visitors": [{
			color: "#546BC1",
			name: "Returning Visitors",
			type: "column",
			xValueType: "dateTime"
		}]
	};
	 
	var newVSReturningVisitorsOptions = {
		animationEnabled: true,
		theme: "light2",
		title: {
			text: "데이터 사용량"
		},
		subtitles: [{
			text: "Click on Any Segment to Drilldown",
			backgroundColor: "#2eacd1",
			fontSize: 16,
			fontColor: "white",
			padding: 5
		}],
		legend: {
			fontFamily: "calibri",
			fontSize: 14,
			itemTextFormatter: function (e) {
				return e.dataPoint.name + ": " + Math.round(e.dataPoint.y / totalVisitors * 100) + "%";  
			}
		},
		data: []
	};
	 
	var visitorsDrilldownedChartOptions = {
		animationEnabled: true,
		theme: "light2",
		axisX: {
			labelFontColor: "#717171",
			lineColor: "#a2a2a2",
			tickColor: "#a2a2a2"
		},
		axisY: {
			gridThickness: 0,
			includeZero: false,
			labelFontColor: "#717171",
			lineColor: "#a2a2a2",
			tickColor: "#a2a2a2",
			lineThickness: 1
		},
		data: []
	};
	 
	var chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
	chart.options.data = visitorsData["New vs Returning Visitors"];
	chart.render();
	  
	function visitorsChartDrilldownHandler(e) {
		chart = new CanvasJS.Chart("chartContainer", visitorsDrilldownedChartOptions);
		chart.options.data = visitorsData[e.dataPoint.name];
		chart.options.title = { text: e.dataPoint.name }
		chart.render();
		$("#backButton").toggleClass("invisible");
	}
	  
	$("#backButton").click(function() { 
		$(this).toggleClass("invisible");
		chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
		chart.options.data = visitorsData["New vs Returning Visitors"];
		chart.render();
	});
	 
});

function changeGraph(){
	var doing = document.graph;
	doing.action="graph_test.action";
	doing.submit();
}

</script>
<style>
  #backButton {
	border-radius: 4px;
	padding: 8px;
	border: none;
	font-size: 16px;
	background-color: #2eacd1;
	color: white;
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
  }
  .invisible {
    display: none;
  }
</style>

</head>
<body>

	<c:if test="${!empty totalData }">
		<div id="chartContainer" style="height: 370px; width: 100%;"></div>
		<button class="btn invisible" id="backButton">&lt; Back</button>
		<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		<p>total: ${totalData }</p>
	</c:if>
	
	<c:if test="${empty totalData }"><br><br><h2>데이터가 존재하지 않습니다</h2></c:if>
	
</body>
</html>