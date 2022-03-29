<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Gugi&display=swap');
</style>

<link rel="stylesheet" href="./resources/css/top_bottom.css?v=3">

<header>
	<div id="headerbar" onscroll="headerbarToggle()"></div>

	<a class="home" href='home'>개잘돌봄</a>
	<a class="m-icon"><ion-icon name="person-outline"></ion-icon></a>
	<div>
	<section class="log">
		<c:if test="${member ==null }">
			<a class="login-out-reg" href="login">로그인</a>
			<a class="login-out-reg" href="join?start=1">회원가입</a>
		</c:if>
		<c:if test="${sessionScope.member !=null }">
			<a class="member">${member.nick}님 </a>
			<a class="member" href="detail">나의 정보</a>
			<a class="member" href="updatepoint">포인트 : 
			<c:set var="price" value="${member.point }"/>
			<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원 </a>
			<a class="login-out-reg" href="logout">로그아웃</a>
		</c:if>
	</section>

<<<<<<< HEAD
	<nav class="navMenu">
		<div class="nav-links">
			<a href="join">펫시터 찾기</a> 
			<a href="rblist">후기 게시판</a> 
			<a href="q_list">이용 문의</a> 
			<a href="https://forms.gle/pXuxMHSjdb5edSr5A">펫시터 지원</a> 
			<a href="ps_boardWrite">펫시터 게시글 작성</a>
		</div>
	</nav>
		<div class="burger">
            <div class="line1"></div>
            <div class="line2"></div>
            <div class="line3"></div>
        </div>
</div>

</header>
<script>
	//HeaderToggle
	var prevScrollPos = window.pageYOffset;
	console.log("first Y offset: " + prevScrollPos) //first value : 0
	window.onscroll = headerbarToggle
	function headerbarToggle() {
		var header = document.getElementById("headerbar");

		var currentScrollPos = window.pageYOffset; // current Y offset
		if (prevScrollPos < currentScrollPos) {
			header.style.opacity = '0.8';
		} else {
			header.style.opacity = '0';
		}
	}
	
	const logSlide = () =>{
		const mIcon = document.querySelector('.m-icon');
		const log = document.querySelector('.log');
		const logAll = document.querySelectorAll('.log a');

		mIcon.addEventListener('click', () => {
			log.classList.toggle('log-active');
			
			logAll.forEach((link, index) =>{
				if(link.style.animation){
					link.style.animation = '';
				}else{
					link.style.animation = `logLinkFade 0.5s ease forwards ${index /7 + 0.3}s`;
				}
			});
		});
	}
	
	logSlide();
	
	const navSlide = () => {
		const burger = document.querySelector('.burger');
		const nav = document.querySelector('.nav-links');
		const navLinks = document.querySelectorAll('.nav-links a');

		
		burger.addEventListener('click', () => {
	        //Toggle Nav
			nav.classList.toggle('nav-active');
	        
	        //Animate Links
	        navLinks.forEach((link, index) => {
	            
	            if(link.style.animation){
	                
	                link.style.animation = '';
	                
	            } else {
	                
	                link.style.animation = `navLinkFade 0.5s ease forwards ${index / 7 + 0.3}s`;
	                
	            }
	        });
	        //Burger Animation
	        burger.classList.toggle('toggle');
	    });
	}

	navSlide();
</script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
=======
   <nav class="navMenu">
   	<div style="display: flex;">
        <a class="menu" href="join">펫시터 찾기</a>
        <a class="menu" href="rblist">후기 게시판</a>
        <a class="menu" href="q_list">이용 문의</a>
        <a class="menu" href="https://forms.gle/pXuxMHSjdb5edSr5A">펫시터 지원</a>
	   	<a class="menu" style="width: 150px;" href="ps_boardWrite">펫시터 게시글 작성</a>
       	<div class="dot"></div>
   	</div>
   </nav>
   
</header>
>>>>>>> refs/remotes/origin/master
