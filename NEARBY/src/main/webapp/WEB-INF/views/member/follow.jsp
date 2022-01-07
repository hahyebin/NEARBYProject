<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/follow.css">


<script type="text/javascript">

	$(document).ready(function(){
		fnFollowSeeNo();
	});
	
	function fnFollowSeeNo(){
		$('#right_select_box').click(function (){
			$('#right_select_box').css('border-bottom', 'none').addClass('checked').removeClass('unchecked');
			$('#left_select_box').css('border-bottom','1px solid black').css('border-bottom-right-radius','10px').addClass('unchecked').removeClass('checked');//'border-bottom-right-radius':'10px');
			$('#right_follower_box').addClass('follow_see').removeClass('follow_no');
			$('#left_follower_box').addClass('follow_no').removeClass('follow_see');
		
			
		});
		
		$('#left_select_box').click(function (){
			$(this).css('border-bottom','none').css('border-bottom-right-radius','none').addClass('checked').removeClass('unchecked');// 'border-bottom-right-radius':'0' );
			$('#right_select_box').css('border-bottom', '1px solid black').css('border-bottom-left-radius','10px').addClass('unchecked').removeClass('checked');//'border-bottom-left-radius':'10px' );
			$('#right_follower_box').addClass('follow_no').removeClass('follow_see');
			$('#left_follower_box').addClass('follow_see').removeClass('follow_no');
		
			
		});   
	}
	
	

	
	
	
	
	
</script>
<style>




</style>
</head>
<body>
	<header class="header">
		<jsp:include page="/WEB-INF/views/layout/header.jsp" flush="true" />
	</header>
	
	
	<section class="board">

        <!-- 프로필 사진, 이름, 게시물, 팔로워, 팔로잉, 프로필 설정-->
        <div class="user_box">
            <div class="user_img_box">
            	<c:if test="${empty loginUser.profile.pSaved}">
            		<img id="user_img" src="${pageContext.request.contextPath}/resources/image/profile_default.png" class="pointer defaultImg">
            	</c:if>
            	<c:if test="${not empty loginUser.profile.pSaved}">
            		<img id="user_img" src="/nearby/${loginUser.profile.pPath}/${loginUser.profile.pSaved}">         	
            	</c:if>
            </div>
            
        	<div class="user_item_box">
                <span>${loginUser.id}</span>
                <span id="userNameText">${loginUser.name}</span>
                <div class="follower_box">
                    <input id="my_border" type="button" value="게시물">
                    <label for="my_border">${userBoardCount}</label>

                    <input id="my_follower" type="button" value="팔로워">
                    <label for="my_follower">${fn:length(followedList)}</label>

                    <input id="my_following" type="button" value="팔로잉">
                    <label for="my_following">${fn:length(followingList)}</label> 
        		</div>        
             </div>
         </div>
      <div class="follow_container">
         <div class="follow_select_box">
         	<div id="left_select_box">
         		<h3>팔로워(${fn:length(followedList)})</h3>
         	</div>
         	<div id="right_select_box">
         		<h3>팔로잉(${fn:length(followingList)})</h3>
         	</div>
      
         </div>
         <div class="follow_box">
             <div id="left_follower_box" class="left_follower_box follow_see">
	         	<c:if test="${not empty followedList}">
					<c:forEach items="${followedList}"  var="followedList">
						<div class="each_follow_box">
							<c:if test="${empty followedList.profile.pSaved}">
								<img id="user_img" src="${pageContext.request.contextPath}/resources/image/profile_default.png" class="defaultImg">
							</c:if>
							<c:if test="${not empty followedList.profile.pSaved}">
								<img id="user_img" src="${pageContext.request.contextPath}/${followedList.profile.pPath}/${followedList.profile.pSaved}">
							</c:if>
							<div class="profile_next_id">${followedList.followingId}</div><br>	
							<div class="profile_next_name"></div>
						</div>	
					</c:forEach>
				</c:if>
	         
	         
	         
	         
	         </div>
			 <div id="right_follower_box" class="right_follower_box follow_no">
	        	<c:if test="${not empty followingList}">
					<c:forEach items="${followingList}"  var="followingList">
						<div class="each_follow_box">
							<c:if test="${empty followingList.profile.pSaved}">
								<img id="user_img" src="${pageContext.request.contextPath}/resources/image/profile_default.png" class="defaultImg">
							</c:if>
							<c:if test="${not empty followingList.profile.pSaved}">
								<img id="user_img" src="${pageContext.request.contextPath}/${followingList.profile.pPath}/${followingList.profile.pSaved}">
							</c:if>
							<div class="profile_next_id">${followingList.followedId}</div><br>	
							<div class="profile_next_name"></div>
						</div>	
					</c:forEach>
				</c:if>			
	        
	        
	        
	         </div>			
         </div> 
	     
	
  </div>
</section>
	

</body>
</html>