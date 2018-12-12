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
	setDateOption();
	common.getteamList();
	common.getRoundtypeList();
	common.getStartYear();

});
	
function doResize(){
	var windowWidth = $(window).width();
	if(windowWidth>1680){
		$("#bodyArea").css("margin-left", (windowWidth-1676)/2)
	}
}

function setDateOption(){
	var innerHtml="<option value='' selected disabled hidden>month</option>";
	for(var i=1; i<=12; i++){
		innerHtml += "<option value='"+i+"''>"+i+"</option>"
	}
	$("#startMonth").empty().append(innerHtml);
	
	innerHtml="<option value='' selected disabled hidden>date</option>";
	for(var i=1; i<=31; i++){
		innerHtml += "<option value='"+i+"''>"+i+"</option>"
	}
	$("#startDay").empty().append(innerHtml);
	
	innerHtml="<option value='' selected disabled hidden>month</option>";
	for(var i=1; i<=12; i++){
		innerHtml += "<option value='"+i+"''>"+i+"</option>"
	}
	$("#endMonth").empty().append(innerHtml);
	
	innerHtml="<option value='' selected disabled hidden>date</option>";
	for(var i=1; i<=31; i++){
		innerHtml += "<option value='"+i+"''>"+i+"</option>"
	}
	$("#endDay").empty().append(innerHtml);
}

</script>
</head>

<body id="bodyArea"style="margin: 0px; background-color: #3e6699; overflow: auto;">
	<div id="headerArea">
		<div id="titleArea">Rowing Management System</div>
	</div>
    <div class="container">
    	<table style="margin-left:50px;border-spacing:10px">
    		<tr style="text-align:center;color:white;">
    			<td>조회 시작 날짜</td>
    			<td>조회 마지막 날짜</td>
    			<td>조회 팀</td>
    			<td>조회 라운드타입</td>
    			<td></td>
    		</tr>
    		<tr style="float:center">
    			<td>
			    	<div style="float: left; height: 35px; background-color: white; border: 1px solid;">
			    		<select id="startYear" style="font-size: 25px; background-color: white; color: black; margin-top: 3px; border: 0px;">
			    			<option value="-">No data</option>
			    		</select>
			    		<select id="startMonth" style="font-size: 25px; background-color: white; color: black; margin-top: 3px; border: 0px;">
			    			<option value="-">No data</option>
			    		</select>
			    		<select id="startDay" style="font-size: 25px; background-color: white; color: black; margin-top: 3px; border: 0px;">
			    			<option value="-">No data</option>
			    		</select>
			    	</div>
		    	</td>
		    	<td>
			    	<div style="margin-left:20px;float: left; height: 35px; background-color: white; border: 1px solid;">
			    		<select id="endYear" style="font-size: 25px; background-color: white; color: black; margin-top: 3px; border: 0px;">
			    			<option value="-">No data</option>
			    		</select>
			    		<select id="endMonth" style="font-size: 25px; background-color: white; color: black; margin-top: 3px; border: 0px;">
			    			<option value="-">No data</option>
			    		</select>
			    		<select id="endDay" style="font-size: 25px; background-color: white; color: black; margin-top: 3px; border: 0px;">
			    			<option value="-">No data</option>
			    		</select>
			    	</div>
		    	</td>
		    	<td>
			    	<div style="margin-left:20px;float: left; height: 35px; background-color: white; border: 1px solid;">
			    		<select id="teams" style="font-size: 25px; background-color: white; color: black; margin-top: 3px; border: 0px;">
			    			<option value="-">No data</option>
			    		</select>
			    	</div>
			    </td>
			    <td>
			    	<div style="margin-left:20px;float: left; height: 35px; background-color: white; border: 1px solid;">
			    		<select id="roundtypes" style="font-size: 25px; background-color: white; color: black; margin-top: 3px; border: 0px;">
			    			<option value="-">No data</option>
			    		</select>
			    	</div>
		    	</td>
		    	<td>
		    		<input id="viewButton" style="margin-left:50px;"type="button"value="조회"onclick="javascript:common.displayRecord();"/>
				</td>	    
		    </tr>
    	</table>
    </div>
    <hr style="width:90%;align:center;">
    <div id="viewArea">
   		<div id="records"style="margin-left:30px;margin-bottom: 30px; margin-top:30px;float:center;">
    	</div>
    </div>
</body>
</html>