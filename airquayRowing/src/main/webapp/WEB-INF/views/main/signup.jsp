<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Airquay rowing management system</title>
<link type="text/css" rel="stylesheet" href="http://localhost:8080/rowing/resources/css/rowingCommon.css?asdf">
<link type="text/css" rel="stylesheet" href="http://localhost:8080/rowing/resources/css/rowingSignup.css?asdf">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css?asdf">

<script src="http://localhost:8080/rowing/resources/js/rowingCommon.js?asdf"></script>
<script src="https://code.jquery.com/jquery-3.0.0.min.js?asdf"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?asdf"></script>
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
function adduser(){
	var json_data = "user_id="+($("#user_id").val());
		json_data += "&user_pw="+($("#user_pw").val());
		json_data += "&user_name="+($("#user_name").val());
	var url = 'http://localhost:8080/rowing/main/addUser';
	$.ajax({
		url:url,
		type : 'GET',
		cache: false,
		contentType: false,
		processData: false,
		data : json_data,
		success : function(data){	
			alert("회원가입이 완료되었습니다.")
			resultSignup(true);
		},
		error : function(data){
			alert("Fill in all the contents");
		}
	});
}

function checkId(){
	var json_data = "user_id="+($("#user_id").val());
	var url = 'http://localhost:8080/rowing/main/checkId';
	$.ajax({
		url:url,
		type : 'GET',
		cache: false,
		contentType: false,
		processData: false,
		data : json_data,
		success : function(data){		
			if(data==true){
				adduser();
			}else{
				alert("중복되는 아이디가 있습니다. 다른 아이디를 입력하세요.")
			}
		},
		error : function(data){
			alert("Fill in all the contents");
		}
	});
}

function resultSignup(data){
	location.href="main";
}
function main(){
	location.href="main";
}

</script>
</head>

<body style="margin: 0px; background-color: #3e6699; overflow: hidden;">
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
		<div id="SignupArea">
			<div style="float: left; width: 100%; height: 50px; font-size: 30px; text-indent: 30px; font-weight: bold; margin-top: 20px;">Sign Up</div>
			<div style="float: left; width: 100%;">
				<div style="float: left; width: 65%;">
					<div style="float: left; width: 100%; height: 50px;">
						<div class="loginLabel">ID</div>
						<div class="inputText"><input id="user_id" type="text" style="width: 100%; height: 100%;" onKeyDown="if(event.keyCode==13) {adduser();}"/></div>
					</div>
					<div style="float: left; width: 100%; height: 50px;">
						<div class="loginLabel">PW</div>
						<div class="inputText"><input id="user_pw" type="password" style="width: 100%; height: 100%;" onKeyDown="if(event.keyCode==13) {adduser();}"/></div>
					</div>
					<div style="float: left; width: 100%; height: 50px;">
						<div class="loginLabel">Name</div>
						<div class="inputText"><input id="user_name" type="text" style="width: 100%; height: 100%;" onKeyDown="if(event.keyCode==13) {adduser();}"/></div>
					</div>
				</div>
				<div style="float:left;width: 35%;margin-top:50px;" onclick="javascript:checkId();">
					<div id="Button">Sign up</div>
				</div>
			</div>
		</div>
	</div>
	<div id="bottomArea"></div>
</body>
</html>
