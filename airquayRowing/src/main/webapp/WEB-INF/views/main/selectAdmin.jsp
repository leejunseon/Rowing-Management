<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Airquay rowing management system</title>
<link type="text/css" rel="stylesheet" href="http://localhost:8080/rowing/resources/css/rowingCommon.css?asdfasdf">
<link type="text/css" rel="stylesheet" href="http://localhost:8080/rowing/resources/css/rowingSelect.css?asdfasdf">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css?asdfasdf">

<script src="http://localhost:8080/rowing/resources/js/rowingCommon.js?asdfasdf"></script>
<script src="https://code.jquery.com/jquery-3.0.0.min.js?asdfasdf"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?asdfasdf"></script>
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
function addRecord(){
	location.href="addRecord";
}
function addRace(){
	location.href="addRaceSchedule";
}
function memberManagement(){
	location.href="memberManagement";
}function userMenu(){
	location.href="select";
}
</script>
</head>

<body style="margin: 0px; background-color: #3e6699; overflow: auto;">
	<div id="headerArea">
		<div id="titleArea">Rowing Management System</div>
	</div>
	<div id="bodyArea" style="display: none;">
		<img alt="" id="LoginImage" src="http://localhost:8080/rowing/resources/img/main_visual_01.jpg" style="width:100%;">
		<div id="SelectArea">
			<div id="MenuTitle">Adminstrator Menu</div>
			<div style="float: left; width: 100%;">
				<div style="float: left;" onclick="javascript:addRecord();">
					<div id="Select">Add Records</div>
				</div>
				<div style="float: left;" onclick="javascript:addRace();">
					<div id="Select">Add Race</div>
				</div>
				<div style="float: left;" onclick="javascript:memberManagement();">
					<div id="Select">Member Management</div>
				</div>
				<div style="float: left;" onclick="javascript:userMenu();">
					<div id="Select">User Menu</div>
				</div>
			</div>
		</div>
	</div>
	<div id="bottomArea"></div>
</body>
</html>
