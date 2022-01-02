<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminHeader.css">
<script type="text/javascript">
	$(document).ready(function() {
		fnProfileBtn();			// 우측 상단 프로필 클릭했을 때 토글, 로그아웃, 프로필수정 메뉴 나타나기
		fnMemberSearch();
	});
	
	// fnProfileBtn();
	function fnProfileBtn() {
		$('#profile_box').click(function (){
			$('#profile_menu').toggleClass('profile_see');
		});
	};


	// 검색 클릭하면 
	function fnMemberSearch(){
		$('#search_btn').click(function(){
			// 검색하는 것에 따라 이동경로 다르게 설정함
			if ( $('#column').val() == 'ID' || $('#column').val() == 'NAME' || $('#column').val() == 'M_NO'  ||  $('#column').val() == 'EMAIL'  || $('#column').val() == 'BIRTHDAY' || $('#column').val() == 'GENDER' ) {
				location.href='/nearby/admin/findMember?column=' + $('#column').val() + '&query=' + $('#query').val();				
			}
			else {
				alert('잘못입력!!');
			}
		})
	}
	
	
	
	
	
</script>
<div class="container">
   <div class="left_box">
		<a href="/nearby/admin/admin">logo_img</a>
	</div>
   <div class="mid_box">
		<ul class="btn_box">
			<li id="admin_btn" class="boxes"><a href="/nearby/admin/admin"><i id="admin_icon" class="fas fa-user-shield"></i></a></li>
			<li id="home_btn" class="boxes"><a href="/nearby/board/boardList"><i id="home_icon" class="fas fa-home"></i></a></li>
			<li id="memberList_btn" class="boxes"><a href="/nearby/admin/findMember"><i id="memberList_icon"  class="fas fa-users"></i></a></li>
		</ul>
	</div>
   

   	  <div class="right_box">
		<form class="main_search" action="/nearby/board/searchBoardList">
			<div class="search_box">
				<input type=text id="query" name="query" placeholder="조회할 게시판 정보 입력">
				<button id="search_icon">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		
	
		<form id="f" method="get" class="main_search">
			<div class="search_box m_search_box" >	
				<select name="column" id="column" class="search_input" >
					<option value="ID" data-column-name="id">아이디</option>
					<option value="NAME" data-column-name="name">이름</option>
					<option value="EMAIL" data-column-name="email">이메일</option>
					<option value="BIRTHDAY" data-column-name="birthday">생년월일</option>
					<option value="GENDER" data-column-name="gender">성별</option>
				</select>
					<input  type="text" name="query" id="query"  class="search_input"  placeholder="조회할 회원 정보 입력" >
					<div id="search_icon"><i class="fas fa-search" id="search_btn" class="search_btn"></i></div>   	
			</div>	
		</form>

		
		<a href="/nearby/member/logout" style="font-size: 12px; color:gray;" >로그아웃</a>
	
	</div>
</div>


   	   		
   	   	 
