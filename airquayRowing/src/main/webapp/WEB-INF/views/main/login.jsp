<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Airquay rowing management system</title>
<link type="text/css" rel="stylesheet" href="http://localhost:8080/rowing/resources/css/rowingCommon.css?vesv">
<link type="text/css" rel="stylesheet" href="http://localhost:8080/rowing/resources/css/rowingLogin.css?vesv">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css?vesv">

<script src="http://localhost:8080/rowing/resources/js/rowingCommon.js?vesv"></script>
<script src="https://code.jquery.com/jquery-3.0.0.min.js?vesv"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?vesv"></script>
<script type="text/javascript">
var loginCheck;
var userName;
var Height;

$(document).ready(function() {
	loginCheck = "${loginCheck}"
	userName="${userName}"
	doResize();
	dispLoginPage();
});

function doResize(){
	var windowHeight = $(window).height();
	var headerAreaHeight = $("#headerArea").height();
	var bottomAreaHeight = $("#bottomArea").height();
	$("#bodyArea").css("height",windowHeight-headerAreaHeight-bottomAreaHeight);
}

function dispLoginPage(){
	if(loginCheck=="true"){
		resultLogin(true);
	}else{
		$("#bodyArea").css("display", "block");
	}
}

function login(){
	var json_data = "user_id="+($("#user_id").val());
		json_data += "&user_pw="+($("#user_pw").val());
	var url = 'http://localhost:8080/rowing/login';
	console.log("login")
	$.ajax({
		url:url,
		type : 'GET',
		cache: false,
		contentType: false,
		processData: false,
		data : json_data,
		dataType : 'json',
		success : function(data){
			resultLogin(data);		
		},
		error : function(data){
		}
	});
}

function signup(){
	location.href="signup";
}
function findID(){
	location.href="findID";
}
function findPWD(){
	location.href="findPWD";
}
function main(){
	location.href="main";
}

function resultLogin(data){
	if(data[0]==true){
		alert(data[1]+"님 환영합니다.")
		location.href="select";
	}else if(data==true){
		location.href="select";
	}else{
		alert("Please check ID or Password");
	} 
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
		<div id="loginArea">
			<div style="float: left; width: 100%; height: 50px; font-size: 30px; text-indent: 30px; font-weight: bold; margin-top: 20px;">Login</div>
			<div style="float: left; width: 100%;">
				<div style="float: left; width: 60%;">
					<div style="float: left; width: 100%; height: 50px;">
						<div class="loginLabel">ID</div>
						<div class="inputText"><input id="user_id" type="text" style="width: 100%; height: 100%;" onKeyDown="if(event.keyCode==13) {login();}"/></div>
					</div>
					<div style="float: left; width: 100%; height: 50px;">
						<div class="loginLabel">PW</div>
						<div class="inputText"><input id="user_pw" type="password" style="width: 100%; height: 100%;" onKeyDown="if(event.keyCode==13) {login();}"/></div>
					</div>
				</div>
				<div style="float:left;width:40%;" onclick="javascript:login();">
					<div id="Button">Login</div>
				</div>
			</div>
			<div style="float: left; width: 100%;">
				<div style="float: left; color: #5b87bd; font-size: 13px; margin-left: 100px; cursor: pointer;"onclick="javascript:signup();">Sign Up</div>
				<div style="float: left; color: #5b87bd; font-size: 13px; margin-left: 15px;">/</div>
				<div style="float: left; color: #5b87bd; font-size: 13px; margin-left: 15px; cursor: pointer;"onclick="javascript:findID();">Find ID</div>
				<div style="float: left; color: #5b87bd; font-size: 13px; margin-left: 15px;">/</div>
				<div style="float: left; color: #5b87bd; font-size: 13px; margin-left: 15px; cursor: pointer;"onclick="javascript:findPWD();">Find PW</div>
			</div>
		</div>
	</div>
	<div id="bottomArea"></div>
</body>
</html>
