$(document).ready(function(){
	$("#address_area").change(function(){
		alert($("#address_area").val());
		area_id = $("#address_area").val();
		getSocitiesFromArea("", "GET", area_id);
	});
	
	$("#delivery_address_button").click(function(){
		alert("dfsdsdsddsfsdf");
		var full_name = $("#address_full_name").val();
		var area = $("#address_area").val();
		var society = $("#address_society").val();
		var address1 = $("#delivery_address1").val();
		var address2 = $("#delivery_address2").val();
		var pincode = $("#delivery_pincode").val();
		var mobile_no = $("#address_mobile_number").val();
		var jsonData = {
			"full_name": full_name,
			"area": area,
			"society": society,
			"address1": address1,
			"address2": address2,
			"pincode": pincode,
			"mobile_no": mobile_no
		};
		alert(jsonData);
		saveNewAddress("/api/v1/areas/save", "POST", jsonData);
		// alert(full_name + area + society + address1 + address2 + pincode + mobile_no);
	});

});