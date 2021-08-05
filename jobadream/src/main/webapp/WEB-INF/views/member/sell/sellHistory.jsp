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

        .style2 {
            background-color: #D9EDF7;
            text-align: center;
        }

        .td {
            text-align: center;
        }

        .nav-item a {
            color: black !important;
        }

        .nav-item .active {
            color: #4161c8 !important;
        }

        .pg {
            justify-content: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <br>
                    <h1 class="text1" id="title1">결제 내역</h1> <br>
                </div>
            </div>
            <ul class="nav nav-tabs">
                <li class="nav-item col-md-4">
                    <a class="nav-link  text-center text1 text2" href="pointSell">포인트 결제</a>
                </li>
                <li class="nav-item col-md-4">
                    <a class="nav-link text-center text1 text2" href="usageHistory">이용 내역</a>
                </li>
                <li class="nav-item col-md-4">
                    <a class="nav-link active text-center text1 text2" href="sellHistory">결제 내역</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade show active ">
                   <form method="POST" action="sellHistory"  name="sellHistory"  onsubmit="return ss();" class="form-horizontal" role="form">
                        <div class="style1">
                            <br><br><br>
                                    <div class="row">
                                        <div class="col-md-2">
                                        </div>
                                        <div class="col-md-8">
                                            <table class="table table-hover">
                                                <thead class="style2">
                                                    <tr class="td ">
                                                        <th class="col-md-10">포인트</th>
                                                        <th class="col-md-2">날짜</th>
                                                        <th></th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:choose>
												<%-- 조회된 게시글 목록이 없는 경우 --%>
												<c:when test="${empty pointList}">
													<tr>
														<td colspan="6">게시글이 존재하지 않습니다.</td>
													</tr>
												</c:when>
													<c:otherwise>
														<c:forEach items="${pointList}" var="import">
															<tr class="td">
			                                                        <td>
			                                                            1000
			                                                        </td>
			                                                        <td>
			                                                            21-07-23
			                                                        </td>
			                                                 </tr>
			                                            </c:forEach>
													</c:otherwise>
												</c:choose>
                                                    
                                                </tbody>
                                            </table>
                                            <nav>
                                                <ul class="pagination pg">
                                                    <li class="page-item">
                                                        <a class="page-link" href="#">&lt;&lt;</a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a class="page-link" href="#">1</a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a class="page-link" href="#">2</a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a class="page-link" href="#">3</a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a class="page-link" href="#">4</a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a class="page-link" href="#">5</a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a class="page-link" href="#">&gt;&gt;</a>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>
                                        <div class="col-md-2">
                                        </div>
                                    </div>
                            <br><br><br>
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
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>