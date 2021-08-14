<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 결제</title>
<jsp:include page="../../common/header.jsp" />
  <!-- import -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>

        #title1 {
	font-family: 'Pretendard-Regular';
	background: linear-gradient(to right top, #4160c8c0, #3eaee6d0);
	color: transparent;
	-webkit-background-clip: text;
}

        .text1 {
            font-weight: bold;
        }

        .text2 {
            font-size: 20px;
        }

        .text3 {
            color: white;
        }

        .text4 {
            font-size: 25px;
        }
        .text5{
           line-height: 50px;
        }
        
        .textcolor{
        	color : red;
        }

        .text3:hover {
            color: white;
            text-decoration: none;
        }

        .btn-color1 {
            background-color: #4161c8;
            color: white;
            font-weight: bold;
        }

        .btn-color2 {
            background-color: #354686;
            color: white;
            font-weight: bold;
        }

        .style1 {
            border-bottom: 1px solid gray;
            border-right: 1px solid gray;
            border-left: 1px solid gray;
            box-shadow: 3px 3px 3px 3px gray;
        }
                .nav-item a {
            color: black !important;
        }

        .nav-item .active {
            color: #4161c8 !important;
        }

        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        #point2{
            text-align: center;
            font-size: 25px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <br>
                    <h1 class="text1" id="title1">포인트 결제</h1> <br>
                </div>
            </div>
            <ul class="nav nav-tabs">
               <li class="nav-item col-md-4">
                    <a class="nav-link active text-center text1 text2" href="pointSell">포인트 결제</a>
                </li>
                <li class="nav-item col-md-4">
                    <a class="nav-link text-center text1 text2" href="usageHistory">이용 내역</a>
                </li>
                <li class="nav-item col-md-4">
                    <a class="nav-link  text-center text1 text2" href="sellHistory">결제 내역</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade show active ">
                
                   <form method="POST" action="pointSell"  name="pointSell"  onsubmit="return ss();" class="form-horizontal" role="form">
                        <div class="style1">
                        <br>
                        <div class="alert alert-dismissable text-center">
                            <button type="button" class="close " data-dismiss="alert" aria-hidden="true">
                                <h5>x</h5>
                            </button>
                             <strong class="text2 textcolor">충전 포인트는 1000원부터 가능합니다.</strong>
                        </div>
                            <br><br><br><br>
                            <div class="row">
                            
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-3 ">
                                    <h3 class=" text1 text4"> 보유 포인트</h3>
                                </div>
                                <div class="col-md-3">
                                    <h3 class="text-center text1 text4" id="pont1">${loginMember.memberPoint}</h3>
                                </div>
                                <div class="col-md-2">
                                    <h3 class="text-right text1 text4"> 원 </h3>
                                </div>
                                <div class="col-md-2">
                                </div>
                            </div>
                            <br><br>
                            <div class="row">
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-3">
                                    <h3 class=" text1 text4 text5"> 충전 포인트</h3>
                                </div>
                                <div class="col-md-3">
                                    <input type="number" class="form-control" id="point2" name="point2" required>
                                </div>
                                <div class="col-md-2">
                                    <h3 class="text-right text1 text4"> 원 </h3>
                                </div>
                                <div class="col-md-2">
                                </div>
                            </div>
                            <br><br><br><br>
                            <div class="row">
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-3">
                                    <h3 class=" text1 text4"> 충전 후 포인트</h3>
                                </div>
                                <div class="col-md-3">
                                    <h3 class="text-center text1 text4" id="result"></h3>
                                </div>
                                <div class="col-md-2">
                                    <h3 class="text-right text1 text4"> 원 </h3>
                                </div>
                                <div class="col-md-2">
                                </div>
                            </div>
                            <br><br><br>
                            <div class="row">
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-8">
                                    <button type="button" class="btn btn-block btn-color1 text4" id="check_module">
                                        충전하기
                                    </button>
                                </div>
                                <div class="col-md-2">
                                </div>
                            </div>
                            <br><br><br><br><br>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-10">
                                <a href="myPage">
                                    <button type="button" class="btn float-left btn-lg btn-color2">
                                        <label class="text3">
                                            < 목록으로</label>
                                    </button>
                                </a>
                            </div>
                            <div class="col-md-2">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        // 결제 총 금액 보이기
        $('#point2').focusout(function () {
        	console.log(${loginMember.memberPoint});
            const point1 = ${loginMember.memberPoint};
            const point2 = Number(document.getElementById("point2").value);
            const op = this.innerText;

            result = point1 + point2;
            document.getElementById("result").innerText = result;
            document.getElementById("result").value = result;
        });

        // 결제 금액 충전
        $("#check_module").click(function () {
            const point2 = Number(document.getElementById("point2").value);
            console.log("결제 금액"+point2);

            if(point2 >= 1000){
                IMP.init('imp24016346');
                IMP.request_pay({
                    pay_method: 'card',
                    // memberNo
                    merchant_uid: 'job_' +'${loginMember.memberNo}' + new Date().getTime(),
                    name: 'job아드림 포인트 결제',
                    amount: point2,
                    buyer_email: '${loginMember.memberEmail}',
                    buyer_name: '${loginMember.memberName}',
                    buyer_tel: '${loginMember.memberPhone}',
                    buyer_addr: '${loginMember.memberAddress}'
                   /*  buyer_postcode: '123-456', */
                }, function (rsp) {
                    console.log(rsp);
                    if (rsp.success) {
                        swal("결제 성공", "포인트가 충전되었습니다.", "success");
                    } else {
                       // swal("결제 실패", "실패가 지속될 경우 관리자에게 문의 바랍니다.", "error");
                    }
                });
            }else{
                swal("결제 실패", "1000원 이상부터 충전이 가능합니다.", "error");
            }
        });
    </script>
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>