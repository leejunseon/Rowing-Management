<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Airquay rowing management system</title>
<link type="text/css" rel="stylesheet" href="http://13.209.161.83:8080/airquayRowing/resources/css/rowingCommon.css?ver=8">
<link type="text/css" rel="stylesheet" href="http://13.209.161.83:8080/airquayRowing/resources/css/rowingAddRaceSchedule.css?ver=8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css?ver=8">

<script src="http://13.209.161.83:8080/airquayRowing/resources/js/rowingCommon.js?ver=8"></script>
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=8"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?ver=8"></script>
<script type="text/javascript">

$(document).ready(function() {
	doResize();
	dispSignupPage();
});

function doResize(){
	var windowHeight = $(window,parent.Document).height();
	var headerAreaHeight = $("#headerArea").height();
	var bottomAreaHeight = $("#bottomArea").height();
	$("#bodyArea").css("height", windowHeight-headerAreaHeight-bottomAreaHeight);
}
function dispSignupPage(){
	$("#bodyArea").css("display", "block");
}
function addrace(){
	var json_data = "race_name="+($("#race_name").val());
		json_data += "&location="+($("#location").val());
		json_data += "&year="+($("#year").val());
		json_data += "&month="+($("#month").val());
		json_data += "&day="+($("#day").val());
	var url = 'http://13.209.161.83:8080/airquayRowing/main/addRace';
	console.log("addUser")
	$.ajax({
		url:url,
		type : 'GET',
		cache: false,
		contentType: false,
		processData: false,
		data : json_data,
		success : function(data){		
			resultAdd(true);
		},
		error : function(data){
			alert("Fill in all the contents");
		}
	});
}
function resultAdd(data){	
	location.href="selectAdmin";
}
</script>
</head>

<body style="margin: 0px; background-color: #3e6699; overflow: hidden;">
	<div id="headerArea">
		<div id="titleArea">Rowing Management System</div>
	</div>
	<div id="bodyArea" style="display: none;">
	<img alt="" id="LoginImage" src="http://13.209.161.83:8080/airquayRowing/resources/img/main_visual_01.jpg" style="width:100%;">
		<div id="SignupArea">
			<div style="float: left; width: 100%; height: 50px; font-size: 30px; text-indent: 30px; font-weight: bold; margin-top: 20px;">Add race</div>
			<div style="float: left; width: 100%;">
				<div style="float: left; width: 65%;">
					<div style="float: left; width: 100%; height: 50px;">
						<div class="loginLabel">Race name</div>
						<div class="inputText"><input id="race_name" type="text" style="width: 100%; height: 100%;" onKeyDown="if(event.keyCode==13) {login();}"/></div>
					</div>
					<div style="float: left; width: 100%; height: 50px;">
						<div class="loginLabel">Location</div>
						<div class="inputText"><input id="location" type="text" style="width: 100%; height: 100%;" onKeyDown="if(event.keyCode==13) {login();}"/></div>
					</div>
					<div style="float: left; width: 100%; height: 50px;">
						<div class="loginLabel">Year</div>
						<div class="inputText"><input id="year" type="text" style="width: 100%; height: 100%;" onKeyDown="if(event.keyCode==13) {login();}"/></div>
					</div>
					<div style="float: left; width: 100%; height: 50px;">
						<div class="loginLabel">Month</div>
						<div class="inputText"><input id="month" type="text" style="width: 100%; height: 100%;" onKeyDown="if(event.keyCode==13) {login();}"/></div>
					</div>
					<div style="float: left; width: 100%; height: 50px;">
						<div class="loginLabel">Day</div>
						<div class="inputText"><input id="day" type="text" style="width: 100%; height: 100%;" onKeyDown="if(event.keyCode==13) {login();}"/></div>
					</div>
				</div>
				<div style="float: left;" onclick="javascript:addrace();">
					<div id="SignupBtn">Add</div>
				</div>
			</div>
		</div>
	</div>
	<div id="bottomArea"></div>
</body>
</html>
