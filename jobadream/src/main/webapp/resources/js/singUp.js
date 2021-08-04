// 회원 가입 유효성 검사

// 각 유효성 검사 결과를 저장할 객체
const checkObj = {
	"id": false,
	"pwd1": false,
	"pwd2": false,
	"name": false,
	"phone2": false,
	"email": false,
	
	"address" : false
};

// 아이디 유효성 검사  
$("#id").on("input", function(){

    const regExp = /^[a-zA-Z0-9]{6,12}$/;

    const inputId = $("#id").val().trim();

    if(regExp.test(inputId)) { 

        $.ajax({
            url : "idDupCheck",  
            data : {"id" : inputId},     
            type : "post",  

            success : function(result){

                console.log(result);

                if( result > 0){ 
                    $("#checkId").text("이미 사용중인 아이디 입니다.").css("color","red");
                    checkObj.id = false;
                    
                } else{ 
                    $("#checkId").text("사용 가능한 아이디 입니다.").css("color","green");
                    checkObj.id = true;
                }
            }, 
            error : function(e){
                console.log("ajax 통신 실패");
                console.log(e);
            } 
        });
    } else{
        $("#checkId").text("영어, 숫자 6~12글자").css("color","red");
        checkObj.id = false;
    }
});


// 이름 유효성 검사
$("#name").on("input", function(){
    const regExp = /^[가-힣]{2,5}$/;

    const inputName = $(this).val().trim();

    if(regExp.test(inputName)){
       $("#checkName").html("&nbsp;"); 
        checkObj.name = true;
    }else{
        $("#checkName").text("한글 2~5글자").css("color", "red");
        checkObj.name = false;
    }
});

// 이메일 유효성 검사
$("#email").on("input", function(){
    const regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;

    const inputEmail = $(this).val().trim();

    if(regExp.test(inputEmail)){
        $("#checkEmail").html("&nbsp;"); 
        checkObj.email = true;
    }else{
        $("#checkEmail").text("이메일 형식이 올바르지 않습니다.").css("color", "red");
        checkObj.email = false;
    }
});

// 비밀번호 유효성 검사
$("#pwd1").on("input", function () {
    const regExp = /^[a-zA-Z0-9\#\-\_]{6,20}$/;
    const inputPwd1 = $(this).val().trim();

    if(regExp.test(inputPwd1)){
        $("#checkPwd1").html("&nbsp;"); 
        checkObj.pwd1 = true;
    }else{
        $("#checkPwd1").text("비밀번호가 올바르지 않습니다.").css("color", "red");
        checkObj.pwd1 = false;
    }
});

// 비밀번호, 비밀번호 확인 일치 여부 판단
$("#pwd1,  #pwd2").on("input", function(){

    const pwd1 = $("#pwd1").val();
    const pwd2 = $("#pwd2").val();

    if( pwd1.trim() == ""  && pwd2.trim() == ""  ){ 
        $("#checkPwd1").html("&nbsp;"); 
        $("#checkPwd2").html("&nbsp;");

        checkObj.pwd2 = false;

    } else if(  pwd1 == pwd2   ){
        $("#checkPwd2").text("비밀번호 일치").css("color", "green");
        checkObj.pwd2 = true;
    } else{
        $("#checkPwd2").text("비밀번호 불일치").css("color", "red");
        checkObj.pwd2 = false;
    }
});

// 전화번호 유효성 검사
$(".phone").on("input", function(){

	if ($(this).val().length > 4) {
		$(this).val( $(this).val().slice(0, 4));
	}

    const regExp1 = /^[0-9]{4}$/; 
    const regExp2 = /^[0-9]{4}$/; 

    const ph2 = $("#phone2").val();
    const ph3 = $("#phone3").val();

    if( regExp1.test(ph2)  && regExp2.test(ph3)  ){
        $("#checkPhone").html("&nbsp;");
        checkObj.phone2 = true;
    }else{
        $("#checkPhone").text("전화번호가 올바르지 않습니다.").css("color", "red");
        checkObj.phone2 = false;
    }
});

// 주소 공백 확인
$("#address1,  #address2").on("input", function(){

    const address1 = $("#address1").val();
    const address2 = $("#address2").val();

    if( address1.trim() == ""  && address2.trim() == ""){ 
		checkObj.address = false;
    }else{
		checkObj.address = true;
	}
});



// 회원 가입 버튼 클릭 시 전체 유효성 검사 여부 확인
function validate(){

    for(const key in checkObj ){

        if( !checkObj[key] ){ 
            let msg;
			switch (key) {
			case "id":
				msg = "아이디가 올바르지 않습니다.";
				break;
			case "pwd1":
				msg = "비밀번호가 올바르지 않습니다.";
				break;
			case "pwd2":
				msg = "비밀번호가 일치하지 않습니다. ";
				break;
			case "name":
				msg = "이름이 올바르지 않습니다.";
				break;
			case "phone2":
				msg = "전화번호가 올바르지 않습니다. ";
				break;
			case "email":
				msg = "이메일이 올바르지 않습니다.";
				break;
					
			case "address" :
				msg="주소를 입력해수세요";	
				break;	
		} 

            // msg에 담긴 내용 출력
            swal(msg).then(function(){ 

                const selector = "#" + key;

                $(selector).focus();
            });

            return false; 

        }
    } // for end
    
    const phone = $("[name='phone']"); // name 속성 값이 phone인 요소를 모두 얻어와 배열로 저장
    const address = $("[name='address']"); // name 속성 값이 address인 요소를 모두 얻어와 배열로 저장
    
    // 요소에 저장된 value만 얻어와 합치기
    const memberPhone = $(phone[0]).val() + "-" + $(phone[1]).val() + "-" + $(phone[2]).val();
    const memberAddress = $(address[0]).val() + "," + $(address[1]).val() + "," + $(address[2]).val();
    
    
    // form 태그에 type="hidden"으로 추가
    const inputPhone = $("<input>", { type : "hidden", name : "memberPhone", value : memberPhone }  );
    const inputAddress = $("<input>", { type : "hidden", name : "memberAddress", value : memberAddress }  );
    
    // append() : 선택된 요소의 마지막 자식으로 추가
    $("form[name='signUpForm']").append(inputPhone).append(inputAddress);
}





