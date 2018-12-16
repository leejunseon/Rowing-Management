<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Airquay rowing management system</title>
<<<<<<< Updated upstream
<link type="text/css" rel="stylesheet" href="http://13.209.161.83:8080/rowing/resources/css/rowingCommon.css?asdf">
<link type="text/css" rel="stylesheet" href="http://13.209.161.83:8080/rowing/resources/css/rowingSelect.css?asdf">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css?asdf">

<script src="http://13.209.161.83:8080/rowing/resources/js/rowingCommon.js?asdf"></script>
<script src="https://code.jquery.com/jquery-3.0.0.min.js?asdf"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?asdf"></script>
=======
<link type="text/css" rel="stylesheet" href="http://localhost:8080/rowing/resources/css/rowingCommon.css?xcvwef">
<link type="text/css" rel="stylesheet" href="http://localhost:8080/rowing/resources/css/rowingSelect.css?xcvwef">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css?xcvwef">

<script src="http://localhost:8080/rowing/resources/js/rowingCommon.js?xcvwef"></script>
<script src="https://code.jquery.com/jquery-3.0.0.min.js?xcvwef"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?xcvwef"></script>
>>>>>>> Stashed changes
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
	var innerHtml;
	$("#bodyArea").css("display", "block");
	if(userAdmin==1||userAdmin==2){
		innerHtml=	"<div style='float: left;' onclick='javascript:selectAdmin();'> "+
					"<div id='Select'>Admin</div></div>"
		$("#selectAdmin").empty().append(innerHtml);
	}
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
		<img alt="" id="LoginImage" src="http://13.209.161.83:8080/rowing/resources/img/main_visual_01.jpg" style="width:100%;">
		<div id="SelectArea">
			<div id="MenuTitle">User menu</div>
			<div style="float: left; width: 100%;">
				<div style="float: left;" onclick="javascript:recordView();">
					<div id="Select">Record</div>
				</div>
				<div style="float: left;" onclick="javascript:teamInfo();">
					<div id="Select">Team Info</div>
				</div>
				<div style="float: left;" onclick="javascript:raceSchedule();">
					<div id="Select">Race Schedule</div>
				</div>
				<span id="selectAdmin"></span>
			</div>
		</div>
	</div>
	<div id="bottomArea"></div>
</body>
</html>
