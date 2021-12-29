<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE</title>
<link rel="stylesheet" href="/resources/css/index.css">
<link rel="stylesheet" href="/resources/css/main-common.css">
</head>
<body>
	<div id="section">
		<div id="slide-banner">
			<a>큰이미지출력하는부분</a>
			<ul>
				<li><button class="active">1번 배너로 전환</button></li>
				<li><button>2번 배너로 전환</button></li>
				<li><button>3번 배너로 전환</button></li>
				<li><button>4번 배너로 전환</button></li>
			</ul>
		</div><!-- slide-banner end -->
		<div id="main-content">
			<div id="best" class="list">
				<h2>선호상품</h2>
				<ul class="item-list">
					
				</ul>
			</div><!-- best end -->
			<div id="new" class="list">
				<h2>신상품</h2>
				<ul class="item-list">
					
				</ul>
			</div><!-- new end -->
			<div id="highlight">
				<h2>강조</h2>
				<ul class="item-list">
					<li>
						<div class="item-photo">
							<a>
								사진
								<h3>이름</h3>
							</a>
						</div>
						<div class="item-desc">
							설명설명
						</div>
					</li>
					<li>
						<div class="item-photo">
							<a>
								사진
								<h3>이름</h3>
							</a>
						</div>
						<div class="item-desc">
							설명설명
						</div>
					</li>
				</ul>
			</div><!-- highlight -->
			<div id="discount" class="list">
				<h2>할인중</h2>
				<ul class="item-list">
					
				</ul>
			</div><!-- discount end -->
		</div>
	</div>
	<!-- <template id="item-template">
		<li class="item">
			<div class="item-photo">
				<a>사진</a>
			</div>
			<div class="item-discount-percent">할인율</div>
			<h3 class="item-title"><a>상품명</a></h3>
			<div class="item-original-value"><span>원래 가격</span></div>
			<div class="item-value"><strong>가격</strong></div>
		</li>
	</template> -->
	<script type="text/javascript">
		// 슬라이드 기능 구현 감 잡아보기용 임시 스크립트
		var slideBanner = document.getElementById("slide-banner");
		var buttons = Array.from(slideBanner.getElementsByTagName("button"));
		var colors = ["lightslategrey", "silver", "maroon", "thistle"];
		function slideEvent(level) {
			const length = buttons.length;
			const currentLevel = getCurrentLevel();
			let nextLevel;

			if (level !== undefined) {
				nextLevel = level;
			} else if (length - 1 <= currentLevel) {
				nextLevel = 0;
			} else {
				nextLevel = currentLevel + 1;
			}

			// 이미지 변경
			slideBanner.style.backgroundColor = colors[nextLevel];
			// active 변경
			buttons[currentLevel].classList.remove("active");
			buttons[nextLevel].classList.add("active");
		}
		function getCurrentLevel() {
			let currentLevel;
			buttons.forEach(function(e, idx) {
				if (e.classList.contains("active"))
					currentLevel = idx;
			});
			return currentLevel;
		}

		function setAutoEvent() {
			slide = setInterval(slideEvent, 5000);
		}

		function setButtonEvent() {
			buttons.forEach(function(e, idx) {
				e.addEventListener("click", function() {
					slideEvent(idx);
				});
			});
		}

		setAutoEvent();
		setButtonEvent();
		slideBanner.addEventListener("pointerover", function() {
			clearInterval(slide);
		}, false);
		slideBanner.addEventListener("pointerout", function() {
			setAutoEvent();
		}, false);
	</script>
</html>