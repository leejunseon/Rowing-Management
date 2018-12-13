<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Rowing Airquay</title>
<link type="text/css" rel="stylesheet" href="http://localhost:8080/rowing/resources/css/rowingCommon.css?vesv">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css?vesv">
<script src="http://localhost:8080/rowing/resources/js/rowingCommon.js?vesv"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js?vesv"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?vesv"></script>
<script type="text/javascript">
var teamInfo;
var Records;
var loginCheck;

$(document).ready(function() {
	loginCheck="${loginCheck}"
	common.Login(loginCheck);
	doResize();
	common.getteamList();
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
    	<div style="color:white;height:50px;width:85%;margin:auto;">
			<span style="margin-left:50px;">팀 선택</span>
		    <select id="teams" style="font-size: 25px; background-color: white; color: black;  border: 0px;height:80%;margin-top:10px;margin-left:50px;">
	  			<option value="-">No data</option>
	  		</select>
	  		 <input id="viewButton"type="button"value="조회" style="margin-left:80px;height:90%;width:150px;"onclick="javascript:common.teamData();"/>
  		</div>
    	<hr>
    </div>
    <div id="viewArea">
   		<div id="teamData"style="margin-left:30px;margin-bottom: 30px; margin-top:30px;">
    	</div>
    </div>
</body>
</html>