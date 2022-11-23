<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="mainPage.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function () {
		//자동 검색어 추천
		$("#keyword").keyup(function () {
			var keyword = $("#keyword").val();
			console.log("keyword:"+keyword);
			if(keyword == ""){
				$("#movietitle_list").empty();
			}else{
				$.ajax({
					url: "searchMovie.jsp",
					data: {keyword: keyword},
					success: function (result) {
						$.each(result, function () {
							var p = $("<p></p>").html(this.movietitle);
							$("#movietitle_list").append(p);
						});
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<%
		//임시 로그인
		session.setAttribute("userno", 1);
		int userno;
		if(session.getAttribute("userno") != null){
			userno = (Integer)(session.getAttribute("userno"));
			System.out.println("mainPage_userno:" + userno);
		}
	%>
	
	<div id="page_wrapper">
		<!-- headed -->
		<header>
			<nav>
				<ul id="menu_list">
					<!-- 메인 로고 -->
					<li class="navigation_menu" id="mainlogo_li">
						<a href="mainPage.do">
							<img src="./images/mainlogo.png" width="300" id="mainlogo">
						</a>
					</li>
					<li id="empty">&nbsp;</li>
					<!-- 자유게시판 아이콘 -->
					<li class="navigation_menu">
						<a href="#">
							<button class="menu_icon" id="board_icon">자유게시판</button>
						</a>
					</li>
					<!-- 회원가입 / 마이페이지 아이콘 -->
					<li class="navigation_menu">
						<a href="#">
							<c:if test="${userno != null }">
								<button class="menu_icon" id="mypage_icon">마이페이지</button>
							</c:if>
							<c:if test="${userno == null }">
								<button class="menu_icon" id="join_icon">회원가입</button>
							</c:if>
						</a>
					</li>
					<!-- 로그인 / 로그아웃 아이콘 -->
					<li class="navigation_menu">
						<a href="#">
							<input type="hidden" value="${userno }" id="userno">
							<c:if test="${userno != null }">
								<button class="menu_icon" id="logout_icon">로그아웃</button>
							</c:if>
							<c:if test="${userno == null }">
								<button class="menu_icon" id="login_icon">로그인</button>
							</c:if>
						</a>
					</li>
				</ul> <!-- end #menu_list -->
			</nav>
		</header>
		
		<!-- content -->
		<div id="content">
			<section>
				<!-- 메인이미지 -->
				<div id="mainimg_container">
					<a href="detailMovie.do?movieno=${mainimg_movieno }">
						<img alt="" src="./images/mainimg/${mainimg }" id="mainimg">
					</a>
				</div>
				<!-- 검색창 -->
				<div id="search_container">
					<input type="text" id="keyword" name="keyword">
					<a href="searchMovie.do">
						<button id="btnSearchMovie">
							<img alt="" src="./images/icon/searchMovie_icon.png" id="searchMovie_icon">
						</button>
					</a>
					<!-- 자동 추천 검색어 리스트 -->
					<div id="movietitle_list"></div>
				</div>
				<!-- 컬렉션 -->
				<div id="collection_container">
					<!-- 최신영화 컬렉션 -->
					<div id="latestMovie_list">
						<h2 class="collection_title">최신 영화</h2>
						<c:forEach var="latestMovie" items="${latestMovie_list }">
							<div class="latestMovie">
								<a href="detailMovie.do?movieno=${latestMovie.movieno }">
									<input type="hidden" value="${latestMovie.movieno }" id="movieno">
									<img alt="" src="./images/poster/${latestMovie.poster }" class="poster">
									<p><b>${latestMovie.movietitle }</b></p>
									<p>${latestMovie.releaseyear } | ${latestMovie.country }</p>
								</a>
							</div>
						</c:forEach>
					</div> <!-- end #latestMovie_list -->
					<!-- 좋아요 많이 받은 영화 top5 컬렉션 -->
					<div id="popularMovie_list">
						<h2 class="collection_title">좋아요 많이 받은 영화</h2>
						<c:forEach var="popularMovie" items="${popularMovie_list }">
							<div class="popularMovie">
								<a href="detailMovie.do?movieno=${popularMovie. movieno }">
									<input type="hidden" value="${popularMovie. movieno }" id="movieno">
									<div id="ranking"><b>${popularMovie.rownum }</b></div>
									<img alt="" src="./images/poster/${popularMovie. poster }" class="poster">
									<p><b>${popularMovie.movietitle }</b></p>
									<p>${popularMovie.releaseyear } | ${popularMovie.country }</p>
								</a>
							</div>
						</c:forEach>
					</div> <!-- end #popularMovie_list -->
					<!-- 영화제 수상작 컬렉션 -->
					<div id="awardWinningMovie_list">
						<h2 class="collection_title">영화제 수상작</h2>
						<c:forEach var="awardWinningMovie" items="${awardWinningMovie_list }">
							<div class="awardWinningMovie">
								<a href="detailMovie.do?movieno=${awardWinningMovie.movieno }">
									<input type="hidden" value="${awardWinningMovie.movieno }" id="movieno">
									<img alt="" src="./images/poster/${awardWinningMovie.poster }" class="poster">
									<p><b>${awardWinningMovie.movietitle }</b></p>
									<p>${awardWinningMovie.releaseyear } | ${awardWinningMovie.country }</p>
								</a>
							</div>
						</c:forEach>
					</div> <!-- end #awardWinningMovie_list -->
				</div> <!-- end #collection_container -->
			</section>
		</div> <!-- end #content -->
	</div> <!-- end #page_wrapper -->
</body>
</html>