<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Rowing Airquay</title>
<link type="text/css" rel="stylesheet" href="http://localhost:8080/rowing/resources/css/rowingCommon.css?asdf">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css?asdf">
<script src="http://localhost:8080/rowing/resources/js/rowingCommon.js?asdf"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js?asdf"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?asdf"></script>
<script type="text/javascript">
var teamInfo;
var Records;

$(document).ready(function() {
	doResize();
	common.getteamList();
});
	
function doResize(){
	var windowWidth = $(window).width();
	if(windowWidth>1680){
		$("#bodyArea").css("margin-left", (windowWidth-1676)/2)
	}
}

</script>
</head>

<body id="bodyArea"style="margin: 0px; background-color: #3e6699; overflow: auto;">
	<div id="headerArea">
		<div id="titleArea">Rowing Management System</div>
	</div>
    <div class="container">
    	<div style="margin-left:50px;float: left; height: 35px; background-color: white; border: 1px solid;">
    		<select id="teams" style="font-size: 25px; background-color: white; color: black; margin-top: 3px; border: 0px;">
    			<option value="-">No data</option>
    		</select>
    	</div>
    	<input id="viewButton"type="button"value="조회" onclick="javascript:common.teamData();"/>
    </div>
    <div id="viewArea">
   		<div id="teamData"style="margin-left:30px;margin-bottom: 30px; margin-top:30px;">
    	</div>
    </div>
</body>
</html>