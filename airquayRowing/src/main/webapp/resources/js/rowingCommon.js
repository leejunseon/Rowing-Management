var common={
		
	//팀 정보 가져옴
	getteamList : function(){
		var json_data = " ";
		var innerHtml = "<option value='' selected disabled hidden>team</option>";
		$.ajax({
			url:'http://localhost:8080/rowing/main/getteamList',
			type : 'GET',
			cache: false,
			contentType: false,
			processData: false,
			data : json_data,
			dataType : 'json',
			success : function(data){
				if(data.length>0){
					teamInfo = data;
					for(var i=0; i<teamInfo.length; i++){
						innerHtml += "<option value="+(teamInfo[i].team_num)+">"+teamInfo[i].team_name+"</option>"
					}
					$("#teams").empty().append(innerHtml);
				}
			},
			error : function(data){
			}
		});
	},

	teamData : function(){
		var json_data = "team_num="+($("#teams").val());
		var innerHtml ="";
		$.ajax({
			url:'http://localhost:8080/rowing/main/teamData',
			type : 'GET',
			cache: false,
			contentType: false,
			processData: false,
			data : json_data,
			dataType : 'json',
			success : function(data){
				teamData=data;
				recordLength=teamData[0].length;
				for(var i=0;i<recordLength;i++){
					record=teamData[0].pop();
					innerHtml+= "<div style='border: 1px solid white;width:70%;margin:auto;padding:15px;'>"+
								record.event_name+" "+
								record.roundtype+" "+
								record.racetype+" "+
								record.progression+" "
								if(record.rank==0)
									innerHtml+=record.race_time+"<br></div>"
								else
									innerHtml+=record.rank+" 위<br></div>"
				}
				innerHtml+="<div style='border: 1px solid white;width:70%;margin:auto;padding:15px;'>";
				innerHtml+="우승 횟수 : "+teamData[1]+" 회<br>"
				innerHtml+="평균 순위 : "
					if(teamData[2]==null)
						innerHtml+="기록 없음<br>"
					else
						innerHtml+=teamData[2]+" 위<br>"
					innerHtml+="평균 기록 : "
					if(teamData[3]==null)
						innerHtml+="기록 없음<br>"
					else
						innerHtml+=teamData[3]+"<br>"
				innerHtml+="기권 "+teamData[4]+" 번<br>"
				innerHtml+="실격 "+teamData[5]+" 번<br></div>"
				
				$("#teamData").empty().append(innerHtml);
			},
			error : function(data){
			}
		});
	},
	
	//경기 종류 가져옴
	getRoundtypeList : function(){
		var json_data = " ";
		var innerHtml = "<option value='' selected disabled hidden>roundtype</option>";
		$.ajax({
			url:'http://localhost:8080/rowing/main/getRoundtypeList',
			type : 'GET',
			cache: false,
			contentType: false,
			processData: false,
			data : json_data,
			dataType : 'json',
			success : function(data){
				if(data.length>0){
					roundtypeInfo = data;
					for(var i=0; i<roundtypeInfo.length; i++){
						innerHtml += "<option value="+(roundtypeInfo[i].roundtype_key)+">"+roundtypeInfo[i].roundtype+"</option>"
					}
					$("#roundtypes").empty().append(innerHtml);
				}
			},
			error : function(data){
			}
		});
	},
	
	//시작 년도 가져옴
	getStartYear : function(){
		var json_data = " ";
		var innerHtml = "<option value='' selected disabled hidden>year</option>";
		$.ajax({
			url:'http://localhost:8080/rowing/main/getStartYear',
			type : 'GET',
			cache: false,
			contentType: false,
			processData: false,
			data : json_data,
			dataType : 'json',
			success : function(data){
				if(data.length>0){
					startYear = data;
					for(var i=0; i<startYear.length; i++){
						innerHtml += "<option value="+(startYear[i])+">"+startYear[i]+"</option>"
					}
					$("#startYear").empty().append(innerHtml);
					
					innerHtml="<option value='' selected disabled hidden>year</option>";
					for(var i=startYear[startYear.length-1]; i<=startYear[startYear.length-1]+5; i++){
						innerHtml += "<option value='"+i+"''>"+i+"</option>"
					}
					$("#endYear").empty().append(innerHtml);
				}
			},
			error : function(data){
			}
		});
	},
	
	displayRecord : function(){
		var innerHtml="";
		var json_data = "startDate="+($("#startYear").val())+"-"+($("#startMonth").val())+"-"+($("#startDay").val())+
						"&endDate="+($("#endYear").val())+"-"+($("#endMonth").val())+"-"+($("#endDay").val())+
						"&team_num="+($("#teams").val())+
						"&roundtype_key="+($("#roundtypes").val());
		$.ajax({
			url:'http://localhost:8080/rowing/main/getRecord',
			type : 'GET',
			cache: false,
			contentType: false,
			processData: false,
			data : json_data,
			dataType : 'json',
			success : function(data){
				if(data.length>0){
					records=data;
					for(var i=0;i<data.length;i++){
						dataInfo=records[i].pop();
						innerHtml+=	"<div style='border: 1px solid white;width:70%;margin:auto;padding:15px;'><table><tr><td>경기날짜 : </td><td>"+
									dataInfo.race_date+"</td></tr><tr><td>경기명 : </td><td>"+
									dataInfo.event_name+"</td></tr><tr><td>경기내용 : </td><td>"+
									dataInfo.roundtype+" "+
									dataInfo.racetype+" "+
									dataInfo.progression+"</td></tr><tr><td></td><td>"+
									dataInfo.race_time+" "
									if(dataInfo.rank!=0)
										innerHtml+=dataInfo.rank+"위</td></tr></table></div>"
									innerHtml+="</td></tr></table></div>"
					}
					$("#records").empty().append(innerHtml);
				}else{
					$("#records").empty().append("<div style='text-align:center;width:70%;margin:auto;padding:15px;'>기록이 없습니다.</div>");
				}
			},
			error : function(data){
				console.log("displayRecord error")
			}
		});
	},
	
	getUserList : function(){
		var innerHtml="";
		var json_data = "";
		var select="";
		$.ajax({
			url:'http://localhost:8080/rowing/main/getUserList',
			type : 'GET',
			cache: false,
			contentType: false,
			processData: false,
			data : json_data,
			dataType : 'json',
			success : function(data){
				userList=data;
				for(var i=0;i<userList.length;i++){
					if(userList[i].adminLevel==1){
						select="Admin <input type='checkbox' id='user' name='"+userList[i].user_no+"'value='' checked='checked'style='width:20px;height:20px;'>"
					}else{
						select="Admin <input type='checkbox' id='user' name='"+userList[i].user_no+"'value='' style='width:20px;height:20px;'>"
					}
					innerHtml += "<div style='border: 1px solid white;width:75%;margin:auto;padding:15px;'>"
					innerHtml += "<table style='width:60%;margin:auto;text-align:center;'><tr><td>userID: "+userList[i].user_id
								+"</td><td>userName: "+userList[i].user_name+"</td><td>"
								+select+"</td></tr></table></div>"
				}
				$("#userList").empty().append(innerHtml);
			},
			error : function(data){
				console.log("getUserList error")
			}
		});
	},
	
	setUserInfo : function(){
		var innerHtml="";
		var user_num = [];
		var length=$('input[id=user]:checked').length;
		for(var i=0;i<length;i++){
			user_num[i]=($('input[id=user]:checked')[i].name)
		}
		jQuery.ajaxSettings.traditional = true;
		$.ajax({
			url:'http://localhost:8080/rowing/main/setUserInfo',
			type : 'GET',
			data :{'user_num' : user_num},
			dataType : 'json',
			success : function(){
			
			},
			error : function(){
				console.log("setUserInfo error")
			}
		});
		location.href="selectAdmin";
	},
	
	deletelaterSchedule:function(){
		$.ajax({
			url:'http://localhost:8080/rowing/main/deletelaterSchedule',
			type : 'GET',
			success : function(){
				
			},
			error : function(){
				console.log("getUserList error")
			}
		});
	},
	
	raceSchedule : function(){
		var innerHtml="";
		$.ajax({
			url:'http://localhost:8080/rowing/main/raceSchedule',
			type : 'GET',
			cache: false,
			contentType: false,
			processData: false,
			dataType : 'json',
			success : function(data){
				raceSchedule=data;
				innerHtml=	"<div style='width:100%;margin:auto;padding:15px;text-align:center;'>"+
							"<table style='width:100%;'><tr><td style='width:18%;'>경기 날짜</td><td style='width:47%;'>경기 이름</td><td style='width:35%;'>경기 장소</td></tr></table></div>"
				for(var i=0;i<raceSchedule.length;i++){
					innerHtml+= "<div style='border: 1px solid white;width:100%;margin:auto;padding:15px;text-align:center;'>" +
								"<table style='width:100%;'><tr><td style='width:18%;'><"
								+raceSchedule[i].race_calendar+"></td><td style='width:47%;'>"
								+raceSchedule[i].race_name+"</td><td style='width:35%;'>"
								+raceSchedule[i].race_location+"</td></tr></table></div>"
				}
				$("#raceSchedule").empty().append(innerHtml);
			},
			error : function(data){
				console.log("getUserList error")
			}
		});
	},
	
	Login:function(loginCheck){
		if(loginCheck=="false"){
			alert("로그인이 필요합니다.")
			location.href="main";
		}
	},
	
	Logout:function(){
		$.ajax({
			url:'http://localhost:8080/rowing/logout',
			type : 'GET',
			cache: false,
			contentType: false,
			processData: false,
			dataType : 'json',
			success : function(data){
				if(data==true){
					alert("로그아웃 되었습니다.")
					location.href="main";
				}else{
					alert("로그인 상태가 아닙니다.")
				}
			},
			error : function(data){
			}
		});
	}
	
					
}