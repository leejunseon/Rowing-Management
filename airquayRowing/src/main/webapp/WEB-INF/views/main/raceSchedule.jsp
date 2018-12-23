<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Rowing Airquay</title>
<link type="text/css" rel="stylesheet" href="http://localhost:8080/rowing/resources/css/rowingCommon.css?vew">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css?vew">

<script src="http://localhost:8080/rowing/resources/js/rowingCommon.js?vew"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js?vew"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?vew"></script>
<script type="text/javascript">
var teamInfo;
var Records;
var loginCheck;

$(document).ready(function() {
	loginCheck="${loginCheck}"
	common.Login(loginCheck);
	doResize();
	common.deletelaterSchedule();
	common.raceSchedule();
});
	
function doResize(){
	var windowHeight = $(window,parent.Document).height();
	var headerAreaHeight = $("#headerArea").height();
	var bottomAreaHeight = $("#bottomArea").height();
	$("#bodyArea").css("height", windowHeight-headerAreaHeight-bottomAreaHeight);
}
function main(){
	location.href="main";
}


</script>
</head>

<body id="bodyArea"style="margin: 0px; background-color: #3e6699; overflow: auto;">
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
    <div class="container">
    	<div id="viewArea">
    		<h2 align="center">경기 일정</h2>
    		<hr>
	   		<div id="raceSchedule"style="margin-left:30px;margin-bottom: 30px; margin-top:30px;">
	    	</div>
    	</div>
    </div>
</body>
</html>