<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Rowing Airquay</title>
<link type="text/css" rel="stylesheet" href="http://13.209.161.83:8080/airquayRowing/resources/css/rowingCommon.css?ver=8">
<link type="text/css" rel="stylesheet" href="http://13.209.161.83:8080/airquayRowing/resources/css/rowingRecordview.css?ver=8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css?ver=8">
<script src="http://13.209.161.83:8080/airquayRowing/resources/js/rowingCommon.js?ver=8"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js?ver=8"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?ver=8"></script>
<script type="text/javascript">
var teamInfo;
var Records;

$(document).ready(function() {
	doResize();
	common.getUserList();
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
    <div style="font-size:25px; color:white;float: left; border: 1px solid white; margin-top: 20px; width: 1675px;">
   		<div id="userList"style="margin-left:30px;margin-bottom: 30px; margin-top:30px;">
   			<!-- <div style="margin-left:67px; float: left; width: 380px; text-align: center;">-- Info --</div>
   			<div style="margin-left:43px; float: left; width: 200px; text-align: center;">-- 500m --</div>
   			<div style="margin-left:43px; float: left; width: 200px; text-align: center;">-- 1000m --</div>
   			<div style="margin-left:43px; float: left; width: 200px; text-align: center;">-- 1500m --</div>
   			<div style="margin-left:43px; float: left; width: 200px; text-align: center;">-- Finish --</div>
   		 	<div style="margin-left:43px; float: left; width: 150px; text-align: center;">-- Rank --</div>
   		
    		<div style="display: inline-block; margin-top: 20px; margin-left: 47px;">
    			<div id="recordinfo" style="padding:20px;float: left;text-align:center; width: 380px;border:white 1px solid">
    			</div>
	            <div id="record500" style="padding:20px;float: left;text-align:center; width: 200px;border:white 1px solid">
	     	    </div>
	    		<div id="record1000" style="padding:20px;float: left;text-align:center; width: 200px;border:white 1px solid">
	     	    </div>
	     	    <div id="record1500" style="padding:20px;float: left;text-align:center; width: 200px;border:white 1px solid">
	     	    </div>
	     	    <div id="finish" style="padding:20px;float: left;text-align:center; width: 200px;border:white 1px solid">
	     	    </div>
	     	     <div id="rank" style="padding:20px;float: left;text-align:center; width: 150px;border:white 1px solid">
	     	    </div>
	        </div> -->
    	</div>
    </div>
    <input type="button"value="확인"style="font-size:20px;float: right; margin-top:30px;margin-right:80px;width:100px;height: 50px;"onclick="javascript:common.setUserInfo();"/>
</body>
</html>