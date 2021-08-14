function validate(){
     if ($("#request-content").val().trim().length == 0) {
        alert("내용을 입력해 주세요.");
        $("#request-content").focus();
        return false;
     }
     
	const address1 = $("#address1").val();
	const address2 = $("#address2").val();
	if(address1.trim() == ""  && address2.trim() == ""){
        alert("주소를 입력해 주세요.");
        return false;
	}
	
	 if ($("#boardTitle").val().trim().length == 0) {
	    alert("제목을 입력해 주세요.");
	    $("#boardTitle").focus();
	    return false;
	 }
	 
 	 if ($("#boardTime").val().trim().length == 0) {
	    alert("소요시간을 입력해 주세요.");
	    $("#boardTime").focus();
	    return false;
	 }
	 
  	 if ($("#boardPay").val().trim().length == 0) {
	    alert("페이를 입력해 주세요.");
	    $("#boardPay").focus();
	    return false;
	 }
	 
	 if ($("#boardPay").val().trim() < 1000){
		alert("최소 지급 페이는 1000원 입니다.");
		$("#boardPay").focus();
	    return false;
	}
	
	const address = $("[name='address']");
	console.log($(address[0]).val());
	const memberAddress = $(address[0]).val() + "," + $(address[1]).val() + "," + $(address[2]).val();
	console.log(memberAddress);
	const inputAddress = $("<input>", { type : "hidden", name : "boardPlace", value : memberAddress }  );
	$("form[name='boardForm']").append(inputAddress);
}
