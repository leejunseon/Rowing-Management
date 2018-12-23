<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Airquay rowing management system</title>
<link type="text/css" rel="stylesheet" href="http://localhost:8080/rowing/resources/css/rowingCommon.css?vew">
<link type="text/css" rel="stylesheet" href="http://localhost:8080/rowing/resources/css/rowingSelect.css?vew">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css?vew">

<script src="http://localhost:8080/rowing/resources/js/rowingCommon.js?vew"></script>
<script src="https://code.jquery.com/jquery-3.0.0.min.js?vew"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?vew"></script>
<script type="text/javascript">
var loginCheck;
var userAdmin;

$(document).ready(function() {
	loginCheck="${loginCheck}"
	userAdmin="${userAdmin}"
	common.Login(loginCheck);
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
	var innerHtml
	$("#bodyArea").css("display", "block");
	if(userAdmin==2){
		innerHtml=	"<div style='float: left;' onclick='javascript:memberManagement();'>"+
					"<div id='Select'>Member Management</div></div>"
		$("#memberManagement").empty().append(innerHtml);
	}
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
function main(){
	location.href="main";
}

</script>
</head>

<body style="margin: 0px; background-color: #3e6699; overflow: auto;">
	<div id="headerArea">
		<div id="titleArea">
			<table style="width:100%;height:100%;">
				<tr>
					<td style="cursor: pointer;"onclick="javascript:main();">Rowing Management System</td>
					<td><input type="button"value="Logout"onclick="common.Logout();"style="width:40%;height:70%;font-size:20px;"></td>
				</tr>
			</table>
		</div>
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
				<span id="memberManagement"></span>
				<div style="float: left;" onclick="javascript:userMenu();">
					<div id="Select">User Menu</div>
				</div>
			</div>
		</div>
	</div>
	<div id="bottomArea"></div>
</body>
</html>
