var common={
		
	//팀 정보 가져옴
	getteamList : function(){
		var json_data = " ";
		var innerHtml = "<option value='' selected disabled hidden>team</option>";
		$.ajax({
			url:'http://localhost:8080/airquayRowing/main/getteamList',
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
			url:'http://localhost:8080/airquayRowing/main/teamData',
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
					innerHtml+= record.event_name+" "+
								record.roundtype+" "+
								record.racetype+" "+
								record.progression+" "+
								record.rank+" 위<br>"
				}
				innerHtml+="<br>우승 횟수 : "+teamData[1]+" 회<br>"
				innerHtml+="평균 순위 : "+teamData[2]+" 위<br>"
				innerHtml+="평균 기록 : "+teamData[3]+"<br>"
				innerHtml+="기권 "+teamData[4]+" 번<br>"
				innerHtml+="실격 "+teamData[5]+" 번<br>"
				
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
			url:'http://localhost:8080/airquayRowing/main/getRoundtypeList',
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
			url:'http://localhost:8080/airquayRowing/main/getStartYear',
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
			url:'http://localhost:8080/airquayRowing/main/getRecord',
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
						innerHtml+=	"<"+dataInfo.race_date+"><br>"+
									dataInfo.event_name+"<br>"+
									dataInfo.roundtype+" "+
									dataInfo.racetype+" "+
									dataInfo.progression+"<br>"+
									dataInfo.team_name+" "+
									dataInfo.race_time+" "+
									dataInfo.rank+"위<br><br>"
					}
					$("#records").empty().append(innerHtml);
				}else{
					$("#records").empty().append("기록이 없습니다.");
				}
			},
			error : function(data){
				console.log("displayRecord error")
			}
		});
	},
				
}