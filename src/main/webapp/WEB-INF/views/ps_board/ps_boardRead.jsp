<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>펫시터 게시글</title>
<link rel= "stylesheet" href="./resources/css/ps_board.css?v=3">
</head>
	<%@ include file = "../top.jsp" %>
<body>
	<div class = "img_container">
		<%-- <c:set var = "fileArr" value = "${fn:split(ps_board.g_fname, ',')}"/>
		<c:forEach var = "img" items = "${fileArr}">
			<img alt="gallery" src="/img/${img}" style="width: 800px; height: 400px;">
		</c:forEach> --%>
		<img alt="gallery" src="/upload/${ps_board.g_fname}" style="width: 800px; height: 400px;">
		<hr>
	</div>
	<div class = "ps_boardMain">
		<div class = "main_left">
			<div class = title>
				<div> <h4>${ps_board.m_addr} 펫시터 : ${petSitter.nick} 님</h4> </div>
				<div> <h1>${ps_board.title}</h1> </div>
				<div> <h5>${ps_board.comment}</h5> </div>
				<div> <h4>${petSitter.nick} 펫시터님을 소개합니다.</h4> </div>
				<div class = "content"> ${ps_board.content} </div>
			</div>
			<br>
			
			<div class = "petInfo">
				<div> <h4>함께사는 반려동물</h4> </div>
				<div class = "pet1">
					<c:forEach var="pet" items="${pet}">
					<div class="pet2">
						<div> &nbsp&nbsp&nbsp&nbsp${pet.p_name} </div>
						<div class="pet3">
							<c:if test="${pet.p_weight < 7}"> &nbsp소형 </c:if>
							<c:if test="${pet.p_weight >= 7 && pet.p_weight < 15}"> &nbsp중형 </c:if>
							<c:if test="${pet.p_weight >= 15}"> &nbsp대형 </c:if>
							 / ${pet.p_gender} / ${pet.p_birth} 년생
						</div><br>
					</div>
				</c:forEach>
				</div>
			</div>
			<br><br>
			
			<div class = "licenseInfo">
				<div> <h4>자격증 및 교육수료</h4> </div>
				<div class = "license1">
					<c:set var = "licenseArr" value = "${fn:split(petSitter.license, ',')}"/>
					<c:forEach var = "license" items = "${licenseArr}">
						<div class = "license2"> ${license} </div>
					</c:forEach>
				</div>
			</div>
			<br><br>
			
			<div class = "reviewInfo">
				<div class = "review1">
					<h4>
					펫시터 후기&nbsp&nbsp
					<c:if test="${rateCnt == null}"> 없음 </c:if> 
					<c:if test="${rateCnt != null}"> ${rateCnt}개 </c:if>
					<c:if test="${rateCnt != null}"> ${rate}점 </c:if>
					</h4>
				</div>
					<c:forEach var = "review" items = "${review}">
						<div class = "review2">
							<div class = "review3">
								<div class = "review4"> <h4>${review.nick} 님</h4> </div>
								<div class = "review5">
									<c:forEach var="i" begin="1" end="${review.rate}"> ★ </c:forEach>
								</div>
							</div>
							<div class = "review6"> <h5>${review.r_date}</h5> </div>
							<div class = "review7"> ${review.content} </div>
						</div>
					</c:forEach>
			</div>
		</div>
		<div class = "main_right">
			<div class = "reserveInfo">
				<form method="post" name="reserve" action="ps_reserve">
					<%-- <c:if test="${user != null}">
						<input type="hidden" name="idx" value="${user.idx}">
					</c:if> --%>
					<input type="hidden" name="ps_idx" value="${ps_board.idx}">
					<input type="hidden" name="psb_idx" value="${ps_board.psb_idx}">
					
					<h4>기간</h4>
					<div class="reserve1">
						<div class="reserve2">
							<c:if test="${s_date == ''}">
								<input type="date" class="dateBox" name="s_date" min="${ps_board.ps_sdate}" max="${ps_board.ps_fdate}" onchange="sdate()" id="sdate">
							</c:if>
							<c:if test="${s_date != ''}">
								<input type="hidden" name="s_date" value="${s_date}">
								${s_date}
							</c:if>
						</div>
						<div class="reserve3"> ~ </div>
						<div class="reserve2">
							<c:if test="${f_date == ''}">
								<input type="date" class="dateBox" name="f_date" min="${ps_board.ps_sdate}" max="${ps_board.ps_fdate}">
							</c:if>
							<c:if test="${f_date != ''}">
								<input type="hidden" name="f_date" value="${f_date}">
								${f_date}
							</c:if>
						</div>
					</div>
					
					<h4>맡기시는 반려동물</h4>
					<div class="reserve4">
						<div class="reserve5">
							<div class="reserve6"> 소형견(7kg 미만) : </div>
							<div class="reserve6">
								<c:if test="${p_size.contains('소형견')}">
									<input type="text" onchange="money()" id="small" name="small" placeholder="마릿수입력(숫자만)"> <br>
								</c:if>
								<c:if test="${!p_size.contains('소형견')}">
									<input type="text" onchange="money()" id="small" name="small" placeholder="선택불가" readonly> <br>
								</c:if>
							</div>
						</div>
						<div class="reserve5">
							<div class="reserve6"> 중형견(7kg 이상 15kg 미만) : </div>
							<div class="reserve6">
								<c:if test="${p_size.contains('중형견')}">
									<input type="text" onchange="money()" id="middle" name="middle" placeholder="마릿수입력(숫자만)"> <br>
								</c:if>
								<c:if test="${!p_size.contains('중형견')}">
									<input type="text" onchange="money()" id="middle" name="middle" placeholder="선택불가" readonly> <br>
								</c:if>
							</div>
						</div>
						<div class="reserve5">
							<div class="reserve6"> 대형견(15kg 이상) : </div>
							<div class="reserve6">
								<c:if test="${p_size.contains('대형견')}">
									<input type="text" onchange="money()" id="big" name="big" placeholder="마릿수입력(숫자만)"> <br>
								</c:if>
								<c:if test="${!p_size.contains('대형견')}">
									<input type="text" onchange="money()" id="big" name="big" placeholder="선택불가" readonly> <br>
								</c:if>
							</div>
						</div>
					</div>
					<br>
					
					<div style="text-align: center;">
						<div id="result" style="font-size: 15px; font-weight: bold;"></div><hr>
						<div id="result2" style="font-size: 13px;"></div>
						<div id="result3" style="font-size: 13px;"></div>
					</div><br>
					
					<div style="text-align: center;">
						<c:if test="${member.idx != petSitter.idx}">
							<input type="button" value="예약요청" class="rsvBtn" onclick="check()">
						</c:if>
					</div>
				</form>
			</div>
			<br><br>
			
			<div class="payInfo">
				<div class="pay1">
					<div style="width: 50%;"> <h4>이용요금</h4> </div>
					<div class="pay2"> <h4>1박기준</h4></div>
				</div>
				<div class="payInfo">
					<div class="pay3">
						<div class="size1">소형견</div>
						<div class="size2">(7kg 미만)</div>
						<div class="size3">50,000원</div>
					</div>
					<div class="pay3">
						<div class="size1">중형견</div>
						<div class="size2">(7kg 이상 15kg 미만)</div>
						<div class="size3">65,000원</div>
					</div>
					<div class="pay3">
						<div class="size1">대형견</div>
						<div class="size2">(15kg 이상)</div>
						<div class="size3">80,000원</div>
					</div>
				</div>
			</div>
			<br><br>
			
			<div class="mapInfo">
				<div class="map1">
					<div class="map2"><h4>${petSitter.nick} 님의 위치 :</h4></div>
					<div class="map3"><h5>${ps_board.m_addr}</h5></div>
					<input type="hidden" id="addr" value="${ps_board.m_addr}">
				</div>
				<div>
					<div id="map" class="map4"></div>
					<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1c1a7001aebc4f7972b7c7ba479ce8ac&libraries=services"></script> -->
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	86c0773d8189ca233acd039192c7bcd1&libraries=services"></script>
					<script>
						var addr = document.getElementById("addr").value;
						console.log(addr);
						
						var infowindow = new kakao.maps.InfoWindow({zIndex:1});
						
						var mapContainer = document.getElementById('map'),
						    mapOption = {
						        center: new kakao.maps.LatLng(37.566826, 126.9786567),
						        level: 3
						    };  
						
						var map = new kakao.maps.Map(mapContainer, mapOption); 
						
						var ps = new kakao.maps.services.Places(); 
						
						ps.keywordSearch(addr, placesSearchCB); 
						
						function placesSearchCB (data, status, pagination) {
						    if (status === kakao.maps.services.Status.OK) {
						
						        var bounds = new kakao.maps.LatLngBounds();
						
						        for (var i=0; i<data.length; i++) {
						            displayMarker(data[i]);    
						            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
						        }       
						
						        map.setBounds(bounds);
						    } 
						}
						
						function displayMarker(place) {
						}
					</script>
				</div>
	
			</div>
			<br>
				
				
			<div class="btnInfo">
				<c:if test="${member.nick == petSitter.nick || member.admin == '1'}">
					<a class="btn" href="psb_update?psb_idx=${ps_board.psb_idx}&nick=${petSitter.nick}">수정</a>
					<a class="btn" href="psb_delete?psb_idx=${ps_board.psb_idx}" onclick="delCheck()">삭제</a>
				</c:if>
			</div>
		</div>
			
	</div>		

	 <script type="text/javascript">
		function delCheck(){
			const yn = confirm('게시글을 삭제하시겠습니까?');
			if(yn) {
				document.reserve.submit();
			}
			else {
				modal.style.display = "none";
				return false;
			}
		}
		
		function check() {
			const yn = confirm('예약하시겠습니까? 해당금액만큼 포인트가 차감됩니다.');
			if (yn) {
				document.reserve.submit();
			}
			else {
				modal.style.display = "none";
				return false;
			}
		}
		
		/* 이용요금, 수수료, 결제금액 산정 */
		function money() {
			var small = 0;
		    var middle = 0;
		    var big = 0;
	
			if(document.getElementById("small").value != null) {
		    	small = document.getElementById("small").value;
		    }
		    if(document.getElementById("middle").value != null) {
		    	middle = document.getElementById("middle").value;
		    }
		    if(document.getElementById("big").value != null) {
		    	big = document.getElementById("big").value;
		    }
		   
		    small = Number(small);
		    middle = Number(middle);
		    big = Number(big);
		    
		    var money = 0;
		    var vat = 0;
		    var pay = 0;
		    money = Number(money);
		    vat = Number(vat);
		    pay = Number(pay);
		    
		    money = (small * 50000) + (middle * 65000) + (big * 80000);
		    vat = money / 10;
		    pay = money + vat;
		    
		    console.log(pay);
		    
		    document.getElementById("result").innerHTML = "합계금액 : " + pay + "원 (1박기준)";
		    document.getElementById("result2").innerHTML = "비용 : " + money + "원";
		    document.getElementById("result3").innerHTML = "부가세(10%) : " + vat + "원";
		}
		
		function sdate() {
			var sdate = 0;
			sdate = document.getElementById("sdate").value;
			document.getElementById("startDate").innerHTML = sdate;
		}
	</script>
	
</body>
<%@ include file="../footer.jsp" %>
</html>