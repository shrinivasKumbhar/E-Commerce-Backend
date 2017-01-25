function makeAjaxRequest(url,method_type,jParams){
	console.log('Base Url :'+url+' Method Type :'+method_type+' Json Param :'+jParams);
	// $.ajax({
		// url : url,
		// type : method_type,
		// dataType : 'Application/json',
		// data : {jParams},
		// success : function(data){
			// return data;
		// },
		// error : function(data){
		// //	alert(data);
		// }
	// });
}

function makeAjaxRequestGetMethod(url,method_type){
	console.log('Base Url :'+url+' Method Type :'+method_type);
	$.ajax({
		url : '/api/v1/packages/get-packages',
		type : 'GET',
		success : function(data){
			ajaxResponceData();
			alert(data[0].pack_id);
			return data;
		},
		error : function(data){
		//	alert(data);
		}
	});
}

function makeAjaxRequestForUserSignUp(url,method_type,jParams){
	console.log('User Sign Up Method :Base Url :'+url+' Method Type :'+method_type+" JParams :"+jParams);
	$.ajax({
		url : '/api/v1/users/signup',
		type : 'POST',
		data : jParams,
		success : function(data){
			console.log("Data :"+data);
			console.log("Otp :"+data.success);
			console.log("Data :"+JSON.stringify(data));
			if(data.success){
					
					$(".signUpDiv").hide();
					$(".otpDiv").show();
					$(".back-button").show();
					
					$('.user-sign-up-modal').modal('hide');
					// var result_type = data.success;
					// if(result_type){
						// $('.user-sign-up-modal').modal('hide');
					// }
					localStorage.setItem("user-email", data.data.email);
				localStorage.setItem("Access-Token", data.data.access_token);
				console.log("localStorage.setIAccess-Token :"+localStorage.getItem("Access-Token"));
				console.log("Email :"+localStorage.getItem("user-email"));
					
				}else{
					$(".signUpDiv").hide();
					$(".loginDiv").show();
					//$(".errorMessage").text(response.message);
					$(".errorMessage").text(data.message);
					$(".errorMessage").css("color","red");
				}
			return data;
		},
		error : function(data){
		//	alert(data);
		}
	});
}
function makeAjaxRequestForUserLogin(url,method_type, jParams){
	console.log('User Login Method :Base Url :'+url+' Method Type :'+method_type+" JParams :"+jParams);
	$.ajax({
		url : '/api/v1/users/login',
		type : 'POST',
		data : jParams,
		success : function(data){
			console.log(data);
			console.log("Data :"+JSON.stringify(data));
			console.log("Data :"+JSON.stringify(data.data));
			console.log("Dataaccesstok :"+JSON.stringify(data.data.access_token));
			if (data.success) {
				localStorage.setItem("user-email", data.data.email);
				localStorage.setItem("Access-Token", data.data.access_token);
				console.log("localStorage.setIAccess-Token :"+localStorage.getItem("Access-Token"));
				console.log("Email :"+localStorage.getItem("user-email"));
			} else {
				console.log("elseeeeeee");
			}
			
			return data;
		},
		error : function(data){
		//	alert(data);
		}
	});
}

function makeAjaxRequestForOTP(url,method_type,jParams){
	console.log('User Login Method :Base Url :'+url+' Method Type :'+method_type+" JParams :"+jParams);
	$.ajax({
		url : 'http://192.168.0.108:3005/api/v1/users/verify_otp',
		type : 'POST',
		data : jParams,
		success : function(data){
			
			if(data.success){
				$('.loginModal').modal('hide');
			}else{
				$(".errorMessage").text(data.message);
				$(".errorMessage").css("color","red");
			}
			
			console.log("Data :"+JSON.stringify(data));
			return data;
		},
		error : function(data){
		//	alert(data);
		}
	});
	
}

function getSocitiesFromArea(url, method_type, area_id) {
	$.ajax({
		url : '/api/v1/areas/get_societies?area_id='+area_id,
		type : 'GET',
		data : "",
		success : function(data){
			
			if(data.success){	
			}else{
				$(".errorMessage").text(data.message);
				$(".errorMessage").css("color","red");
			}	
			console.log("Data :"+JSON.stringify(data));
		},
		error : function(data){
		//	alert(data);
		}
	});	
}

function saveNewAddress(url, method_type, params) {
	$.ajax({
		url : '/api/v1/areas/save,
		type : 'POST',
		data : params,
		success : function(data){
			alert("data"+ data);
			if(data.success){	
			}else{
				$(".errorMessage").text(data.message);
				$(".errorMessage").css("color","red");
			}	
			console.log("Data :"+JSON.stringify(data));
		},
		error : function(data){
		//	alert(data);
		}
	});	
}

