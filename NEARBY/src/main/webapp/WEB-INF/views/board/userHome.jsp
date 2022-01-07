<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myHome.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/outputReplyOnly.css">
<script src="${pageContext.request.contextPath}/resources/js/myHome.js" ></script>
<style>



/* 폰트 size / spacing */
	.re_content_area {
		letter-spacing: 0.4px;
		font-size: 14px;
	}

  .board_icon{
  color: gray;
  cursor: pointer;
  }
   .like   { color: #fe4662; cursor: pointer;  }
   .unlike { color: gray; cursor: pointer;     }
/* ------------------- reply 구역 ----------------- */
	.replyCount {
      margin-left: 80px;
      line-height: 37px; 
	}
	/* 댓글 없을 때 */
	.reply_none {
	    padding: 15px 0 10px 30px;
	    color: #525252;
	    font-size: 12px;
	}

   
</style>
<script>
$(document).ready(function(){
	 fnCheckFollow();	 
	 fnSendBno();
	 fnReply();
	 
 });
//fnCheckFollow();
function fnCheckFollow() {
	let pId = '${user[0].profile.id}';
	let follow = JSON.stringify({
  	  profile : {id : pId} 
	  	});
	$.ajax({
		url: '/nearby/follow/checkFollow',
		type: 'post',
		data: follow,
  	  	contentType: 'application/json',
  	  	dataType: 'json',
	    success: function(map) {
	    	  console.log(map);
	    	  if(map.result == 1) { 
	    	  console.log('팔로잉중');
	    	  } else if (map.result == 0) {
	    	  console.log('팔로우하기');		  
	    	  }
	    	  
	      },
	     error: function(xhr) {
	    	  console.log(xhr.responseText);
	     }
	});
	
}


//fnFollowing();
function  fnFollowing() {
	console.log('Following() 실행');
	let id = '${user[0].profile.id}';
	console.log(id);
	$.ajax({
	      url: '/nearby/follow/following',
	      type: 'post',
	      data: JSON.stringify({
	    	  'followedId' : id
	    	  }),
	      contentType: 'application/json',
	      dataType: 'json',
	      success: function(map) {
	    	  console.log(map);
	    	  if(map.result == 1) { 
	    	  console.log('성공');
	    	  } else {
	    	  console.log('실패');		  
	    	  }
	    	  
	      },
	      error: function(xhr) {
	    	  console.log(xhr.responseText);
	      }
	   }) // End ajax	   
}

//fnUnfollowing();
function  fnUnfollowing() {
	console.log('unfollowing() 실행');
	let id = '${user[0].profile.id}';
	console.log(id);
	$.ajax({
	      url: '/nearby/follow/unfollowing',
	      type: 'post',
	      data: JSON.stringify({
	    	  'followedId' : id
	    	  }),
	      contentType: 'application/json',
	      dataType: 'json',
	      success: function(map) {
	    	  console.log(map);
	    	  if(map.result == 1) { 
	    	  console.log('성공');
	    	  } else {
	    	  console.log('실패');		  
	    	  }
	    	  
	      },
	      error: function(xhr) {
	    	  console.log(xhr.responseText);
	      }
	   }) // End ajax	   
}
 
 
 
 
function fnSendBno(){
	
	$.each($('.output_reply_table'), function(i, replyTable) {	
		let bNo = $(replyTable).parent().prev().val();
		$.ajax({
			  url: '/nearby/board/boardBnoList',
		      type: 'get',
		      data: "bNo=" + bNo,
		      dataType: 'json',
			      success: function(map) {
		    	    if( map.count == 1 ){
		    	     	$("#like"+bNo).addClass('like');
		    	    } else if (map.count == 0) {
		    	    	$("#like"+bNo).removeClass('like');
		    	    }
		      },
		      error: function(xhr) {
		    	  console.log(xhr.responseText);
			      }
			   }) // End ajax			
		}); // each
	} //  fnSendBno()


	function fnLike(i){
       let likeBtn = $('.like_btn');
       let bNo = likeBtn.attr('id');
          
          if( $("#"+i).find('i').hasClass('like') == false )  {
            	$("#"+i).find('i').addClass('like');
	            $.ajax({
	 				url : '/nearby/board/likes',
	 				type: 'post',
					data: "bNo="+i, 
					dataType: 'json',
	 				success: function(board){
	 					console.log(board);
	 					console.log("좋아요 누른 카운트"+ board.likes);
			  			   $( '#like_count'+bNo ).text(board.likes);
			  			   location.href="/nearby/board/myHome";  
	 				},
	 				error : function(xhr, error){
	 					console.log(xhr.status);
	 					console.log(error);
	 				}				
	 			 }); 
	            return
	   }
			
    if(  $("#"+i).find('i').hasClass('like') ) {
    	$("#"+i).find('i').removeClass('like');
    	
 		$.ajax({
  				url : '/nearby/board/likesCancel',
  				type: 'post',
  				data: "bNo="+i, 
 				dataType: 'json',
  				success: function(board){
  				   $( '#like_count'+ bNo ).text(board.likes);
  			   	 location.href="/nearby/board/myHome";
  				   
  				},
  				error : function(xhr, error){
  					console.log(xhr.status);
  					console.log(xhr.error)
  				}				
  			});  // ajax
  			return;
      } // if 
    }	 
			
 	
/* 댓글 */
	function fnReply(){

		
		$.each($('.output_reply_table'), function(i, replyTable) {
			let bNo = $(replyTable).parent().prev().val();
			var page = 1;
			$.ajax({
				      url: '/nearby/reply/replyList',
				      type: 'get',
				      data: "bNo=" + bNo + "&page=" + page,
				      dataType: 'json',
				      success: function(map) {
							fnPrintReplyList(map);
				      },
				      error: function(xhr) {
				         console.log(xhr.responseText);
				      }
				   }) // End ajax			
		
			function fnPrintReplyList(map){
	
						$(replyTable).empty();

										
				 var p = map.pageUtils;
				 let id = '${loginUser.id}';
			
				if (p.totalRecord == 0) {
				    $('<tr>')
				    .append( $('<td colspan="5" class="reply_none">').text('첫 번째 댓글의 주인공이 되어보세요!') )
				    .appendTo( replyTable );
				 } else {
				    
					$.each(map.replyList, function(i, reply){
					    if ( reply.profile.pSaved != null ) { 
							let pSaved = reply.profile.pSaved;
							let pPath = reply.profile.pPath;
							$(replyTable).append( $('<tr>').html( $('<td rowspan="2" class="reply_user_image_area"><img class="reply_user_img" src="/nearby/'+pPath+'/'+pSaved+'"></td>') ) );
					      } else if ( reply.profile.pPath == null ) { 
							$(replyTable).append( $('<tr>').html( $('<td rowspan="2" class="reply_user_image_area"><img class="reply_user_img" src="${pageContext.request.contextPath}/resources/image/profile_default.png"></td>') ) );
					      } // End if 프사 부분 
					
				         let strContent = reply.rContent;
				         let reply_content = ''; 
						if (strContent.length > 30) {
							reply_content = strContent.substring(0, 30) + '...';
						} else {
							reply_content = strContent;
						}
						$('<tr class="reply_show">')
						.append( $('<td class="reply_user_name_area">').html( $('<a  id="link_'+reply.rNo+'" class="user_page_link">'+reply.id+'</a>') ) )
						.append( $('<td class="like_icon_area">').html( $('<td colspan="4" class="pointer re_content_area" onclick="fnShowViewPage('+reply.bNo+')">'+reply_content+'</td><td></td>') ) )
						.appendTo( replyTable );
					
						// 유저 이름당 href 링크 만들기
						if (reply.id != id) {
							$('.user_page_link[id=link_'+reply.rNo+']').attr('href','/nearby/board/selectUserHome?id='+reply.id);
						} else if(reply.id == id) {
							$('.user_page_link[id=link_'+reply.rNo+']').attr('href','/nearby/board/myHome');
						}
						
						
					}) // End inner each
					
					// 게시글당 댓글 수 삽입부
					$(".reply_count_per_board[id=\""+bNo+"\"]").text(map.total);
					
					
					// 게시글당 댓글 수에 따른 아이콘 색상변경부
			 		if (map.total > 0 ) {
						$('.countIcon[id=icon_'+bNo+']').addClass('like').removeClass('unlike');
					} else if (map.total < 0 ) {
						$('.countIcon[id=icon_'+bNo+']').addClass('unlike').removeClass('like');
					}
					
				 } // End if 

			} // End fnPrintReplyList
		}); // End outer each
	} // End aa 
	
	
	function fnShowViewPage(bNo) {
		location.href='/nearby/board/selectBoard?bNo='+bNo;
	}
	
	 /* 게시물 수정 */
	function fnUpdateBtn(){
	      if(confirm('게시글을 수정하시겠습니까?') )
	         location.href= '/nearby/board/updateBoardPage?bNo='+ $('#selectBoardNo').val();
   }
	 
</script>
</head>
<body>

    <jsp:include page="/WEB-INF/views/layout/header.jsp" flush="true" />
     <section class="board">

        <!-- 프로필 사진, 이름, 게시물, 팔로워, 팔로잉, 프로필 설정-->
        <div class="user_box">
            <div class="user_img_box">
            	<c:if test="${empty user[0].profile.pSaved}">
            		<img id="user_img" src="${pageContext.request.contextPath}/resources/image/profile_default.png">
            	</c:if>
            	<c:if test="${not empty user[0].profile.pSaved}">
            		<img id="user_img" src="/nearby/${user[0].profile.pPath}/${user[0].profile.pSaved}">            	
            	</c:if>
            </div>

            <div class="user_item_box">
                <span>${user[0].profile.id}</span>

                <div class="follower_box">
                    <input id="my_border" type="button" value="게시물">
                    <label for="my_border">구현 안 됨</label>

                    <input id="my_follower" type="button" value="팔로워">
                    <label for="my_follower">${f:length(followedList)}</label>

                    <input id="my_following" type="button" value="팔로잉">
                    <label for="my_following">${f:length(followingList)}</label>
                </div>

                <div class="content_box">
                    <span>${user[0].profile.pContent}</span>
                </div>

            </div>

            <div class="profile_setup_box">
                <input id="profile_setup" type="button" value="팔로우" onclick="fnFollowing()">
                <input id="profile_setup" type="button" value="언팔하기" onclick="fnUnfollowing()">
                <input id="profile_setup" type="button" value="맞팔로하기" onclick="">
            </div>

        </div>

		<!-- 게시물이 있을 때 -->
		<c:if test="${not empty user[0]}">
			<c:forEach items="${user}" var="board">
			
	        <!-- 게시물 전체를 감싸고 있는 박스 -->
		        <div class="board_container">
		
		            <!-- 게시물을 내용을 감싸고 있는 박스 -->
		            <div class="board_wrap">
		
		                <!-- 유저 정보 -->
		                <div class="board_head">
		                    <div class="board_intro">
		                    <c:if test="${empty board.profile.pSaved}">
		                    	<img id="user_img" src="${pageContext.request.contextPath}/resources/image/profile_default.png">
		                    </c:if>
	    					<c:if test="${not empty board.profile.pSaved}">
		                    	<img id="user_img" id="user_img" src="/nearby/${board.profile.pPath}/${board.profile.pSaved}">    					
	    					</c:if>
		                        <input type="hidden" id="bNo" value="${board.bNo}">
		                        <input type="hidden" id="origin" value="${board.origin}">
		                        <input type="hidden" id="saved" value="${board.saved}">
		                        <input type="hidden" id="location" value="${board.location}">
		                    </div>
		
		                    <!-- 유저 아이디와 날짜 -->
		                    <div class="idAndDate">
			                    <div class="user_id">
			                        <a href="/nearby/board/selectBoard" id="board_writer">${board.id}</a>
			                    </div>
			                    <div class="date">
						    	    <fmt:formatDate value="${board.created}" pattern="MM월 dd일  a hh:mm" />
						    	    <i class="fas fa-globe-asia" ></i>
						    	</div>
							</div>
		                </div>
		
		                <div class="board_body">
		                    <!-- 내용만 작성 했을 경우 -->
		                    <c:if test="${ null == board.origin }">
		                        <div class="AddrAndContent" onclick="location.href='/nearby/board/selectBoard?bNo=${board.bNo}';">
		                            <!-- 지도 -->
		                            <div class="addrAndMap">
		                                <i class="fas fa-map-marker-alt"></i>
		                                <span class="address">${board.location}</span>
		                            </div>
		                            <!-- 내용 -->
		                            <div class="content">
		                            	<div class="textarea" style="display: flex;">
		                            		${board.content}
		                            	</div>
		                            </div>
		                        </div>
		                    </c:if>
		
		                    <!-- 이미지/ 비디오가 삽입 되어 있을 경우 -->
		                    <c:if test="${board.saved ne null}">
		
		                        <div class="addressAndImage"
		                            onclick="location.href='/nearby/board/selectBoard?bNo=${board.bNo}';">
		                            <div class="addrAndMap">
		                                <i class="fas fa-map-marker-alt"></i>
		                                <span class="address">${board.location}</span>
		                            </div>
		                        </div>
		
		                        <!-- 이미지 일때 -->
		                        <!-- video 변수 생성 -->
		                        <c:set value="${board.saved}" var="video"></c:set>
		
		                        <!-- video가 아닌 것을 가져와라 ! -->
		                        <c:if test="${not f:contains(video, 'video')}">
		                            <div class="imgSize">
		                                <img alt="${board.origin}" src="/nearby/${board.path}/${board.saved}" id="image">
		                            </div>
		                        </c:if>
		
		                        <!-- video인 것을 가져와라 ! -->
		                        <c:if test="${f:contains(video, 'video')}">
		                            <div class="imgSize">
		                                <video autoplay controls loop muted id="video">
		                                    <source src="/nearby/${board.path}/${board.saved}" type="video/mp4">
		                                </video>
		                            </div>
		                        </c:if>
		
		                        <input type="hidden" name="path" value="${board.path}">
		                        <div class="content">
	                            	<div class="textarea" style="display: flex;">
	                            		${board.content}
	                            	</div>
	                            </div>
		
		                    </c:if>
		                    <!-- 댓글 / 좋아요 버튼 -->
		                    <div class="like_reply_btn">
		                        <!-- 좋아요 -->
		                        <div class="like_box box">
		                          <span class="like_btn" id="${board.bNo}"  data-bno="${board.bNo}" onclick="fnLike(${board.bNo})">
	  			 	    		    <i class="fas board_icon fa-thumbs-up" id="like${board.bNo}" > </i>
		  				  			<span class="like_count"  id="like_count${board.bNo}">${board.likes}</span> 
	  					          </span>
		                        </div>
		                        <!-- 댓글 수 -->
	  				  		<div class="countIcon replyCount">
				  				<i class="fas board_icon fa-comments countIcon replyCount"  id="icon_${board.bNo}" onclick="location.href='/nearby/board/selectBoard?bNo=${board.bNo}';"></i>
				  				<span class="reply_count_per_board" id="${board.bNo}">0</span>
					  		</div>
		                </div>
		
		        </div> <!-- End board Body DIV tag -->
		                <!-- 댓글 -->
			  			<div class="input_reply_area">	  			
					  		<div class="reply_wrap">
					  			<!-- 댓글 뿌리기 -->
					  			<div class="output_reply_area">
						  			<form>
						  			            <input type="hidden" name="bNo" value="${board.bNo}">
							  			<table>
							  				<tbody class="output_reply_table"></tbody>
							  			</table>
						  			</form>
					  			</div>
					  		</div>
			  			</div> <!-- End class input_reply_area DIV tag -->
		            </div> <!-- board Wrap DIV tag -->
		            </div>
	        </c:forEach>
		</c:if>
    </section>

</body>

</html>