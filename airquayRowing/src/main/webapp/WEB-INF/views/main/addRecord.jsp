<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Airquay rowing management system</title>
<link type="text/css" rel="stylesheet" href="http://localhost:8080/rowing/resources/css/rowingCommon.css?asdf">
<link type="text/css" rel="stylesheet" href="http://localhost:8080/rowing/resources/css/rowingAddrecord.css?asdf">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css?asdf">

<script src="http://localhost:8080/rowing/resources/js/rowingCommon.js?asdf"></script>
<script src="https://code.jquery.com/jquery-3.0.0.min.js?asdf"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?asdf"></script>
<script type="text/javascript">
var loginCheck;

$(document).ready(function() {
	loginCheck="${loginCheck}"
	common.Login(loginCheck);
	doResize();
	dispSignupPage();
});

function doResize(){
	var windowHeight = $(window).height();
	var headerAreaHeight = $("#headerArea").height();
	var bottomAreaHeight = $("#bottomArea").height();
	$("#bodyArea").css("height", windowHeight-headerAreaHeight-bottomAreaHeight);
}
function dispSignupPage(){
	$("#bodyArea").css("display", "flex");
}
function addData(){
	var json_data = "event_name="+($("#event_name").val());
		json_data += "&year="+($("#year").val());
		json_data += "&month="+($("#month").val());
		json_data += "&day="+($("#day").val());
		json_data += "&race_type="+($("#race_type").val());
		json_data += "&round_type="+($("#round_type").val());
		json_data += "&progression="+($("#progression").val());
		json_data += "&RankOneTeam="+($("#RankOneTeam").val());
		json_data += "&RankOneRacetime="+($("#RankOneRacetime").val());
		json_data += "&RankTwoTeam="+($("#RankTwoTeam").val());
		json_data += "&RankTwoRacetime="+($("#RankTwoRacetime").val());
		json_data += "&RankThreeTeam="+($("#RankThreeTeam").val());
		json_data += "&RankThreeRacetime="+($("#RankThreeRacetime").val());
		json_data += "&RankFourTeam="+($("#RankFourTeam").val());
		json_data += "&RankFourRacetime="+($("#RankFourRacetime").val());
		json_data += "&RankFiveTeam="+($("#RankFiveTeam").val());
		json_data += "&RankFiveRacetime="+($("#RankFiveRacetime").val());
		json_data += "&RankSixTeam="+($("#RankSixTeam").val());
		json_data += "&RankSixRacetime="+($("#RankSixRacetime").val());
	var url = 'http://localhost:8080/rowing/main/addData';
	$.ajax({
		url:url,
		type : 'GET',
		cache: false,
		contentType: false,
		processData: false,
		data : json_data,
		success : function(data){		
			resultAddData(true);
		},
		error : function(data){
			resultAddData(false);
		}
	});
}
function resultAddData(data){
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
	<div id="bodyArea" style="none">
		<div id="addrecordArea">
			<div style="float: left; width: 30%; height: 50px; font-size: 30px; text-indent: 30px; font-weight: bold;">Race info
				<table style="width:100%;">
					<tr style="height:50px;"></tr>
					<tr>
						<td class="raceLabel">Event name</td>	
						<td class="inputText"><input id="event_name" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>		
					<tr>
						<td class="raceLabel">Year</td>			
						<td class="inputText"><input id="year" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>	
					<tr>
						<td class="raceLabel">Month</td>
						<td class="inputText"><input id="month" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>
					<tr>
						<td class="raceLabel">Day</td>
						<td class="inputText"><input id="day" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>	
					<tr>
						<td class="raceLabel">Race type</td>
						<td class="inputText"><input id="race_type" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>
					<tr>
						<td class="raceLabel">Round type</td>
						<td class="inputText"><input id="round_type" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>
					<tr>
						<td class="raceLabel">Progression</td>
						<td class="inputText"><input id="progression" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>
				</table>
			</div>
			<div style="float: left; width: 25%;">
				<table style="width:100%;margin-top:20px;">
					<tr>
						<td class="rankLabel"colspan="2">-- Rank 1 --</td>
					</tr>
					<tr>
						<td class="raceLabel">Team</td>
						<td class="inputInfo"><input id="RankOneTeam" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>
					<tr>
						<td class="raceLabel">RaceTime</td>
						<td class="inputInfo"><input id="RankOneRacetime" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>	
					<tr>
						<td class="rankLabel"colspan="2">-- Rank 2 --</td>
					</tr>
					<tr>
						<td class="raceLabel">Team</td>
						<td class="inputInfo"><input id="RankTwoTeam" type="text" style="width: 100%; height: 100%;"/></td> 
					</tr>
					<tr>
						<td class="raceLabel">RaceTime</td>
						<td class="inputInfo"><input id="RankTwoRacetime" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>
					<tr>
						<td class="rankLabel"colspan="2">-- Rank 3 --</td>
					</tr>
					<tr>
						<td class="raceLabel">Team</td>
						<td class="inputInfo"><input id="RankThreeTeam" type="text" style="width: 100%; height: 100%;"/></td> 
					</tr>
					<tr>
						<td class="raceLabel">RaceTime</td>
						<td class="inputInfo"><input id="RankThreeRacetime" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>
				</table>
			</div>
			<div style="float: left; width: 25%;">
				<table style="width:100%;margin-top:20px;">
					<tr>
						<td class="rankLabel"colspan="2">-- Rank 4 --</td>
					</tr>
					<tr>
						<td class="raceLabel">Team</td>
						<td class="inputInfo"><input id="RankFourTeam" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>
					<tr>
						<td class="raceLabel">RaceTime</td>
						<td class="inputInfo"><input id="RankFourRacetime" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>
					<tr>
						<td class="rankLabel"colspan="2">-- Rank 5 --</td>
					</tr>
					<tr>
						<td class="raceLabel">Team</td>
						<td class="inputInfo"><input id="RankFiveTeam" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>
					<tr>
						<td class="raceLabel">RaceTime</td>
						<td class="inputInfo"><input id="RankFiveRacetime" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>
					<tr>
						<td class="rankLabel"colspan="2">-- Rank 6 --</td>
					</tr>
					<tr>
						<td class="raceLabel">Team</td>
						<td class="inputInfo"><input id="RankSixTeam" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>
					<tr>
						<td class="raceLabel">RaceTime</td>
						<td class="inputInfo"><input id="RankSixRacetime" type="text" style="width: 100%; height: 100%;"/></td>
					</tr>
				</table>
			</div>
			<div style="float: left; width:20%;margin-top:400px;"onclick="javascript:addData();">
					<div id="Button" style="width:70%;margin:auto;">Submit</div>
			</div>
		</div>
	</div>
	<div id="bottomArea"></div>
</body>
</html>
