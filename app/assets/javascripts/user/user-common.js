var selected_subcribtion_value="";
var login_user="";
var redirect_key=""
$(document).ready(function(){

//var method_url = base_url+""+get_packages_url;
//var response = makeAjaxRequestGetMethod(method_url,"GET");
// $.ajax({
		// url : 'http://192.168.0.107:3005/api/v1/packages/get-packages',
		// type : 'GET',
		// success : function(data){
			// for(var i=0;i<data.length;i++){
				// var mainPackageData = [];
				// mainPackageData = data[i].packages;
				// console.log("pack_id :"+data[i].pack_id)
				// var options="";
				// for(var j=0;j<mainPackageData.length;j++){
					// console.log("package_id :"+mainPackageData[j].package_id);
					// options +="<option value='"+mainPackageData[j].package_id+"'>"+mainPackageData[j].days+" days Rs."+mainPackageData[j].price+"/>";
				// }
// 				
// 				
				// $(".subscribtion"+i).append(options);
			// }
// 			
			// return data;
		// },
		// error : function(data){
		// //	alert(data);
		// }
	// });
	


	//alert();
	localStorage.setItem("username","");
	 login_user = localStorage.getItem("username");
	//alert("User Name :"+login_user);
	if(login_user=='null' || login_user==null || login_user==""){
		$(".user-setting-list").addClass("hidden");
		$(".user-setting-list").hide();
	}else{
		$(".user-setting-list").removeClass("hidden");
		$(".user-setting-list").show();
	}
	
		$(".combo-subscribe").click(function(event){
			if(login_user=='null' || login_user==null || login_user==""){
				var id = $(this).attr("class");
				var panel_div_class = $(this).parents("div").parents("div").attr("class");
				
				 selected_subcribtion_value =$("."+panel_div_class).find(".subscribtion").val();
				//	alert("selected_subcribtion" +selected_subcribtion_value);
					userLoginIntoSystemOption("subscribe");
					loginDiv();
			}
			
		});
		$(".user-login-menu").click(function(event){
			loginDiv();
		});
		
		$(".user-sign-up-menu").click(function(evt){
			signUpDiv();
		});
		//for get user login way
		$(".login-signup").click(function(event){
			userLoginIntoSystemOption("login");
		});
		
		
		
		$(".user-signup").click(function(event){
			var flag=true;
			var user_mobile_number = $(".sign-up-mobile-number").val();
			var user_email_id = $(".sign-up-email").val();
			var user_password = $(".sign-up-password").val();
			
			if(user_password==null || user_password==""){
				$(".errorMessage").text("Please Enter password.");
				$(".errorMessage").css("color","red");
				flag=false;
			}
			
					
			if(validateEmailId("sign-up-email")==false){
				$(".errorMessage").text("Invalid email address.");
				$(".errorMessage").css("color","red");
				flag=false;
			}
			
			if(user_mobile_number==null || user_mobile_number=="" || user_mobile_number.length<10){
				$(".errorMessage").text("Invalid mobile number.");
				$(".errorMessage").css("color","red");
				flag=false;
			}
			
			if(flag) {
				$(".errorMessage").text("");
				redirect_key=localStorage.getItem("redirect_key");
				var userSignUpData = {"redirect_key":redirect_key,"mobile_no":user_mobile_number,"email":user_email_id,"password":user_password};
			
				var method_url = base_url+""+user_login_url;
				makeAjaxRequestForUserSignUp(method_url,"POST",userSignUpData);
								
			}
			
					
		});
		
		$(".user-otp-continue").click(function(event){
			redirect_key=localStorage.getItem("redirect_key");
			console.log("redirect_key :"+redirect_key)
			var sign_up_otp = $("#sign-up-otp").val();
			var otp = document.getElementById("sign-up-otp").value;
			console.log(sign_up_otp+"sign-up-otp : "+otp);
			var otpData = {"otp": otp};
			var method_url = base_url+""+user_login_url;
			makeAjaxRequestForOTP(method_url,"PUT",otpData);
			
		});
		
		$(".back-button").click(function(event){
			$(".signUpDiv").show();
			$(".otpDiv").hide();
			$(".back-button").hide();
		});
		
		//user-login validation
		$(".user-login").click(function(event){
			var flag=true;
			var user_mobile_number_or_username = $("#username").val();
			var user_password = $("#password").val();
						
			if(user_password==null || user_password==""){
				$(".errorMessage").text("Enter Correct Password.");
				$(".errorMessage").css("color","red");
				flag=false;
			}
			
			if(user_mobile_number_or_username==null || user_mobile_number_or_username==""){
				$(".errorMessage").text("Please Enter Username or mob.Number.");
				$(".errorMessage").css("color","red");
				flag=false;
			}
			
			
			if(flag) {
				
				redirect_key=localStorage.getItem("redirect_key");
				var userSignUpData = {"redirect_key":redirect_key,"username":user_mobile_number_or_username,"password":user_password};
				console.log(userSignUpData)
				var jsonString = JSON.stringify(userSignUpData);
				var method_url = base_url+""+user_login_url;
				var response = makeAjaxRequestForUserLogin(method_url,"POST",userSignUpData);
				
				$('.user-sign-up-modal').modal('hide');
				var result_type = response.success;
				if(result_type){
					$('.user-sign-up-modal').modal('hide');
				}
			}
			
					
		});
		
		$(".sign-up-mobile-number").keyup(function(evt){
			var result = checkMobileNumber(evt);
			if (result!=true) {
		    	$(".sign-up-mobile-number").val('');
		     }
		});
});

function  loginValidation(ths){
	//var id = $(ths)[0].id;
	//alert(selected_subcribtion_value+" "+login_user);
	
	var username=$("#username").val();
	var password=$("#password").val();
	var userLoginData = {"username":username,"password":password};
	var jsonString = JSON.stringify(userLoginData);
	var method_url = base_url+""+user_login_url;
	var response = makeAjaxRequest(method_url,"POST",jsonString);
	localStorage.setItem("selected_subcribtion_value",selected_subcribtion_value);
	
}

function loginDiv(){
	$('.loginModal').modal('show');
			$(".otpDiv").hide();
			$(".loginDiv").show();
			$(".signUpDiv").hide();
}
function signUpDiv(){
	$('.loginModal').modal('show');
			$(".otpDiv").hide();
			$(".errorMessage").text("");
			$("login-div-show").css("")
			$(".loginDiv").hide();
			$(".signUpDiv").show();
}

function userLoginIntoSystemOption(value){
	localStorage.setItem("redirect_key",value);
	console.log(localStorage.getItem("redirect_key"));
}




