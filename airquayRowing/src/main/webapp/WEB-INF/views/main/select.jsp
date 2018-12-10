<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Airquay rowing management system</title>
<link type="text/css" rel="stylesheet" href="http://13.209.161.83:8080/airquayRowing/resources/css/rowingCommon.css?ver=8">
<link type="text/css" rel="stylesheet" href="http://13.209.161.83:8080/airquayRowing/resources/css/rowingSelect.css?ver=8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css?ver=8">

<script src="http://13.209.161.83:8080/airquayRowing/resources/js/rowingCommon.js?ver=8"></script>
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=8"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?ver=8"></script>
<script type="text/javascript">

$(document).ready(function() {
	doResize();
	dispSelectPage();
});

function doResize(){
	var windowHeight = $(window).height();
	var headerAreaHeight = $("#headerArea").height();
	var bottomAreaHeight = $("#bottomArea").height();
	$("#bodyArea").css("height", windowHeight-headerAreaHeight-bottomAreaHeight);
}
function dispSelectPage(){
	$("#bodyArea").css("display", "block");
}
function recordView(){
	location.href="recordview";
}
function selectAdmin(){
	location.href="selectAdmin";
}
function teamInfo(){
	location.href="teamInfo";
}
function raceSchedule(){
	location.href="raceSchedule";
}
</script>
</head>

<body style="margin: 0px; background-color: #3e6699; overflow: auto;">
	<div id="headerArea">
		<div id="titleArea">Rowing Management System</div>
	</div>
	<div id="bodyArea" style="display: none;">
		<img alt="" id="LoginImage" src="http://13.209.161.83:8080/airquayRowing/resources/img/main_visual_01.jpg" style="width:100%;">
		<div id="SelectArea">
			<div style="float: left; width: 100%; height: 50px; font-size: 30px; text-indent: 30px; font-weight: bold; margin-top: 20px;">Rowing Management System</div>
			<div style="float: left; width: 100%;">
				<div style="float: left;" onclick="javascript:recordView();">
					<div id="SelectBtn">Record</div>
				</div>
				<div style="float: left;" onclick="javascript:teamInfo();">
					<div id="SelectBtn">Team Info</div>
				</div>
				<div style="float: left;" onclick="javascript:raceSchedule();">
					<div id="SelectBtn">Race Schedule</div>
				</div>
				<div style="float: left;" onclick="javascript:selectAdmin();">
					<div id="SelectBtn">Admin</div>
				</div>
			</div>
		</div>
	</div>
	<div id="bottomArea"></div>
</body>
</html>
