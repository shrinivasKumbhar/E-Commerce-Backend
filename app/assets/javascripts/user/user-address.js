var selected_subcribtion_value="";
var login_user="";
var redirect_key=""
$(document).ready(function(){

	selected_subcribtion_value= localStorage.getItem("selected_subcribtion_value");
	console.log("selected_subcribtion_value :"+selected_subcribtion_value);
		
	$(".add-address").click(function(evt){
		//$('.deliveryAddressModal').modal('show');
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




