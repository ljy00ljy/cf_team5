<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- http://java.sun.com/jsp/jstl/cored 에 정의된 JSTL 기능을 "c"라는 이름으로 정의 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>

<!-- start_input jquery -->
<script type="text/javascript">
	$(function() {
		// click slide, focus
		$(".start_input > div > p").click(function() {
			$(".start_input > div > div").slideUp(0);
			$(this).next().slideToggle(0, function() {
				$('html, body').animate({
					scrollTop : $(this).prev().offset().top - 60
				}, 500);
			});
		});
		
		/** project 닫기 */
		$(".close_slide").click(function(e) {
			e.preventDefault();
			// 선물등록 창 닫기
			$(".start_input > div > div").slideUp(0);
			$('html, body').animate({
				scrollTop : $(this).parent().prev().offset().top - 60
			}, 500);
		});

		/** present 동적뷰 생성 */
		var preid = 0;// preid 세팅
		
		// 동적뷰 생성
		$("#present_new").click(function(e) {
			// e.preventDefault();
			// 클릭 시 preid 값 증가
			preid = preid + 1;
			
			// 뷰 추가
			$("#present_list").append(
				"<div id='pre_money_"+preid+"' class='col-sm-4'>"
				+"<input type='text' name='pre_money_"+preid+"' />"
				+"<p>원 이상 밀어주시는 분께</p>"
				+"</div>"
				
				+"<div id='pre_info_"+preid+"' class='col-sm-8'>"
				+"<textarea name='pre_info_"+preid+"'>"
				+"</textarea>"
				+"</div>"
			);
			
			// 카운트 증가
			$("#precount").val(preid);
			
			// present 동적뷰 5개 제한
			if (preid > 3) {
				$("#present_new").hide();
			} else {
				$("#present_new").show();
			}
		});
		
		
		
		
		// present 동적뷰 삭제
		$("#present_del").click(function(e) {
			// e.preventDefault();
			
			if (preid == 0) {
				alert("선물은 최소 1개 이상 입력해야 합니다.");
			} else if (preid != 0) {
				// 뷰 삭제
				$("#pre_money_"+preid).remove();
				$("#pre_info_"+preid).remove();
				preid = preid - 1;
				
				// present 동적뷰 5개 제한
				if (preid > 3) {
					$("#present_new").hide();
				} else {
					$("#present_new").show();
				}
				
				// 카운트 감소
				$("#precount").val(preid);
			}
		});
		
		/** 값 입력 색변경 */
		
	});
</script>
<!-- // start_input jquery -->

</head>
<body>
	<%@ include file="/WEB-INF/views/inc/topnav.jsp"%>

	<!-- container -->
	<div class="container">
		<!-- start_input (use jquery) -->
		<form class="start_input" method="post" enctype="multipart/form-data"
			action="${pageContext.request.contextPath }/project/start_project_ok.do">
			<!-- 상태유지 -->
			<input type="hidden" name="member_id" value="${loginInfo.id }" />
			<input type="hidden" name="precount" id="precount" value="0" />

			<!-- 프로젝트 개요 -->
			<h5>프로젝트 개요</h5>
			<div>
				<p>프로젝트 제목</p>
				<div>
					<p>프로젝트에 멋진 제목을 붙여주세요. 감정에 호소하는 제목보다는 무엇을 만드는지 쉽게 알 수 있는 제목이
						좋습니다. 공간이 부족한 곳에 쓰일 7자 이내의 짧은 제목도 정해주세요.</p>
					<div>
						<h6>프로젝트 제목은 어디에 쓰이나요?</h6>
						<img
							src="${pageContext.request.contextPath }/assets/img/start_input_project_title_01.png" />
						<label for="title">프로젝트 제목</label> <input type="text" name="title">
					</div>
					<div>
						<h6>프로젝트 짧은 제목은 어디에 쓰이나요?</h6>
						<img
							src="${pageContext.request.contextPath }/assets/img/start_input_project_title_02.png" />
						<label for="title_s">프로젝트 짧은 제목</label> <input type="text"
							name="title_s">
					</div>
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>
				
			</div>
			<div>
				<p>프로젝트 대표 이미지</p>
				<div>
					<p>프로젝트를 대표할 이미지입니다. 후원자들이 한번에 무슨 프로젝트인지 알 수 있도록 프로젝트의 특징을 잘
						잡아내는 이미지를 등록해 주시는 것이 좋습니다.</p>
					<h6>대표 이미지는 어디에 쓰이나요?</h6>
					<P>대표 이미지는 웹페이지에서 두루 쓰이는 썸네일의 이미지로 사용됩니다.</P>
					<input type="file" name="title_image">
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>
				
			</div>
			<div>
				<p>프로젝트 요약</p>
				<div>
					<p>후원자 분들에게 본 페이지를 간략하게 소개해 보세요.</p>
					<textarea name="title_text"></textarea>
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>
			</div>
			<div>
				<p>프로젝트 카테고리</p>
				<div>
					<p>프로젝트의 성격에 맞는 카테고리를 선택해 주세요</p>
					<select name="category">
						<option>카테고리 선택</option>
						<option value="1">미술</option>
						<option value="2">만화</option>
						<option value="3">디자인</option>
						<option value="4">패션</option>
						<option value="5">영화</option>
						<option value="6">요리</option>
						<option value="7">게임</option>
						<option value="8">출판</option>
						<option value="9">공연</option>
						<option value="10">기술</option>
						<option value="11">과학</option>

					</select>
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>
			</div>
			<div>
				<p>프로젝트 페이지 주소</p>
				<div>
					<p>프로젝트 페이지로 들어올 수 있는 주소(url)을 정해주세요</p>
					<label for="url">http://우리웹사이트 주소/</label> <input type="text"
						name="url" />
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>
			</div>
			<!-- //프로젝트 개요 -->
			<!-- 진행자 정보 -->
			<h5>진행자 정보</h5>
			<div>
				<p>프로필 이미지</p>
				<div>
					<p>진행자님 개인이나 팀의 사진을 올려주세요. 얼굴이 나온 사진을 넣으면 프로젝트의 신뢰성 향상에 도움이
						됩니다.</p>
					<input type="file" name="producer_image" />
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>
			</div>
			<div>
				<p>진행자 이름</p>
				<div>
					<p>진행자님을 대표할 수 있는 이름을 써 주세요. 팀으로 진행하신다면 팀 이름을 쓰셔도 됩니다.</p>
					<label for="producer_name">진행자 이름</label> <input type="text"
						name="producer_name" value="${loginInfo.name }"/>
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>
			</div>
			<div>
				<p>진행자 소개</p>
				<div>
					<P>진행자의 이력과 간단한 소개를 써 주세요</P>
					<h6>진행자 소개는 어디에 쓰이나요?</h6>
					<p>프로젝트 페이지를 방문하는 후원자들이 '크리에이터 자세히 보기'를 클릭하면, 진행자님의 과거 텀블벅
						프로젝트들과 함께 진행자 소개 문구가 표시됩니다. 2~3문장으로 간략하게 어떤 작업을 위주로 활동해 온 창작자인지
						알려주세요</p>
					<textarea name="producer_info"></textarea>
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>
			</div>
			<div>
				<p>진행자 활동지역</p>
				<div>
					<p>진행자님은 주로 어느 지역에서 활동하시나요? 활동 지역을 구체적으로 기입해주시면 프로젝트의 신뢰를 높이는 데
						도움이 됩니다.</p>
					<input type="text" name="producer_area" />
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>
			</div>
			<!-- // 진행자 정보 -->
			<!-- 펀딩 목표 설정 -->
			<h5>펀딩 목표 설정</h5>
			<div>
				<p>목표 금액</p>
				<div>
					<p>이번 프로젝트를 통해 모으고자 하는 펀딩 목표 금액이 얼마인가요?</p>
					<input type="number" name="project_money" />
					<div>
						<h6>수수료를 제외하면 얼마를 받을 수 있나요?</h6>
						<p>총 모금액에서 아래와 같이 공제됩니다.</p>
						<table>
							<tr>
								<td>항목</td>
								<td>금액</td>
							</tr>
							<tr>
								<td>결제처리 수수료</td>
								<td>3~4% + VAT</td>
							</tr>
							<tr>
								<td>플랫폼 수수료</td>
								<td>5% + VAT</td>
							</tr>
						</table>
					</div>
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>

			</div>
			<div>
				<p>프로젝트 마감일</p>
				<div>
					<p>펀딩이 끝나는 마감일을 정해주세요.</p>
					<h6>마감일을 정할 때 주의할 점</h6>
					<p>펀딩 마감일은 시작일로부터 60일 이내의 날짜 중에 고르실 수 있습니다. 이미 선물을 만드셨다면, 선물
						실행일 중에 마감일보다 이른 날짜가 있지는 않은지 꼭 확인해 주세요.</p>

					<input type="date" name="start_date" />
					<h6>일 부터</h6>
					<input type="date" name="end_date" />
					<h6>에 펀딩을 마감합니다.</h6>
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>
			</div>
			<!-- //펀딩 목표 설정 -->
			<!-- 선물 구성 -->
			<h5>선물 구성</h5>
			<div>
				<p>선물 추가하기</p>
				<div>
					<p>후원자 분들에게 드릴 선물 내용을 입력해주세요.</p>
					<div>
						<h6>최소 후원 금액</h6>
						<p>인기 금액대인 1만원대 선물부터 특별한 의미를 담은 10만원 이상 선물까지, 다양한 금액대로 구성하면
							성공률이 더욱 높아집니다. 배송이 필요한 선물의 경우, 배송비를 고려하여 후원금액을 산정하는 것이 좋습니다.</p>

					</div>
					<div>
						<h6>선물 설명</h6>
						<p>다른 선물 카드와 중복되는 부분이 있어도 생략하지 말고 기입해주세요. 예를 들어, 20,000원 후원
							선물이라면 '10,000원 선물 + 선물C' 이 아닌 '선물A + 선물B + 선물C'라고 적어주시는 것이 좋습니다.</p>
					</div>
					<div id="present_list"
						style="width: 100%; padding:10px 0;background: #fff; border-radius: 10px;">

						<div class='col-sm-4'>
							<input type='text' name='pre_money_0'>
							<p>원 이상 밀어주시는 분께</p>
						</div>
						<div class='col-sm-8'>
							<textarea name='pre_info_0'></textarea>
						</div>

					</div>
					
						<p id="present_new"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: skyblue;">
							선물 추가</p>
						
						<p id="present_del"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: red;">
							선물 삭제</p>
					
						<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
					
					<!-- <div>
						<h6>예상 전달일</h6>
						<p>
							이 선물을 선택한 후원자들에게 선물을 배송 또는 공개하기로 약속하는 날입니다. <strong>펀딩
								마감일 이후의 날짜</strong>인지 확인해서 정해주세요.
						</p>
					</div> -->
				</div>
			</div>
			<!-- //선물 구성 -->
			<!-- 정책 설정 -->
			<h5>정책 설정</h5>
			<div>
				<p>환불 및 교환 정책</p>
				<div>
					<p>마감일 다음날 결제가 일괄 진행되며 결제된 금액은 자동으로 진행자에게 전달되므로, 그 후의 환불 및 교환
						요청은 전적으로 진행자가 약속하는 정책을 따릅니다. 이 프로젝트에 꼭 맞는 환불 및 교환 정책을 신중하게 작성해주세요.</p>
					<div>
						<h6>환불 정책에는 어떤 내용을 써야 하나요?</h6>
						<p>환불정책은 후원자의 단순 변심, 선물 실행 지연, 프로젝트 무산 등 다양한 상황을 고려해야 합니다. 마감
							직후 곧바로 제작에 착수하는 프로젝트의 경우에는 환불이 불가능하다고 명시하는 것이 적절합니다.</p>
						<p>환불을 약속할 수 있는 여건이라면, 환불 조건 (예: 선물 실행 3개월 이상 지연 또는 무산시에만) 및
							수수료 제외 여부 (예: 플랫폼 수수료 5.5%와 결제 수수료(카드는 3.08%, 이체는 715원)를 제외하고 환불)
							등을 밝히는 것이 좋습니다.</p>
					</div>
					<div>
						<h6>교환 정책에는 어떤 내용을 써야 하나요?</h6>
						<p>파손이나 불량품을 받은 후원자들에게는 정해진 기간 (예: 배송일로부터 30일) 내 새 제품 무료 교환을
							약속하면 신뢰를 높이는 데 도움이 됩니다.</p>
					</div>
					<textarea name="legal"></textarea>
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>
			</div>
			<!-- //정책 설정 -->
			<!-- 스토리텔링 -->
			<h5>스토리텔링</h5>
			<div>
				<p>프로젝트 소개 영상</p>
				<div>
					<p>프로젝트를 소개하는 영상을 만들면 내용을 더 효과적으로 알릴 수 있습니다. 2~3분 이내의 짧은 영상이 가장
						반응이 좋답니다. 배경음악을 쓰신다면 저작권 문제에 유념해주세요.</p>
					<input type="text" name="video" />
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>
			</div>
			<div>
				<p>프로젝트 스토리</p>
				<div>
					<p>스토리는 프로젝트가 후원자를 만나는 가장 중요한 공간입니다. 창작자 소개, 창작 과정과 계기, 펀딩 목적
						등의 내용을 편하게 작성해주시면 됩니다. 적절한 이미지 활용도 잊지 마세요.</p>
					<textarea name="story"></textarea>
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>
			</div>
			<!-- //스토리텔링 -->
			<!-- 계좌 설정 -->
			<h5>계좌 설정</h5>
			<div>
				<p>이메일 주소</p>
				<div>
					<p>진행자님이 연락받으실 수 있는 이메일을 입력해 주세요. 프로젝트 관련 중요 안내사항이 모두 이메일로
						전달되므로 평소 자주 확인하는 이메일을 입력하시는 것이 좋습니다.</p>
					<input type="email" name="email" value="${loginInfo.userId }"/>
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>
			</div>
			<div>
				<p>휴대폰 번호</p>
				<div>
					<p>진행자님이 연락 받으실 수 있는 휴대폰 연락처를 입력해 주세요. 프로젝트 진행과 관련된 긴급한 사항 전달에만
						사용됩니다.</p>
					<input type="tel" name="tel" value="${loginInfo.tel }" />
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>
			</div>
			<div>
				<p>입금 계좌</p>
				<div>
					<div>
						<h6>거래은행</h6>
						<input type="text" name="bank_brand" value="${loginInfo.bankBrand }"/>
						<p>후원금을 수령할 계좌가 어느 은행 계좌인가요? 신한은행 계좌 등록시 최대 200원, 타 은행 등록시 최대
							1000원의 송금수수료가 발생합니다.</p>
					</div>

					<div>
						<h6>계좌번호</h6>
						<input type="text" name="bank_num" value="${loginInfo.bankNum }"/>
						<p>숫자로만 입력하세요.</p>
					</div>
					<div>
						<h6>예금주명</h6>
						<input type="text" name="bank_user" value="${loginInfo.bankUser }"/>
						<p>계좌에 등록된 예금주명과 일치해야 합니다.</p>
					</div>
					<!-- <div>
						<h6>계좌종류</h6>
						<input type="radio" name="p_bank_num" value="1" checked>개인
						<input type="radio" name="p_bank_num" value="2">사업자(개인사업자
						포함)
					</div> -->
					<!-- <div>
						<h6>예금주 주민등록번호</h6>
						<p>입력하신 주민등록번호는 입금 계좌를 인증하고, 텀블벅 수수료에 대한 세금계산서(영수증)을 발행하기 위해서만
							사용됩니다.</p>
						<input type="text" />
						<p>숫자로만 입력해주세요.</p>
					</div> -->
					<p class="close_slide"
							style="display: block; width: 100%; padding: 10px; margin-top: 10px; border-radius: 10px; text-align: center; font-size: 1.2em; font-weight: bold; color: #fff; background: orange;">
							닫기</p>
				</div>
			</div>
			<!-- // 계좌 설정 -->
			<!-- submit -->
			<p>프로젝트 등록은 회원들과의 계약과 같은 의미이기 때문에 한번 등록되면 수정이 불가능합니다.</p>
			<p>단, 연락처, 입금계좌와 같은 프로젝트의 의도와 관계가 없고 진행 중 변경될 수 있는 내용은 진행자의 회원정보 수정에서 변경이 가능합니다.</p>
			<button type="submit">검토 요청하기</button>
			<!-- <button type="reset">다시 입력하기</button> -->
			<!-- //submit -->
		</form>
		<!-- //start_input -->
	</div>
	<!-- //container -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>