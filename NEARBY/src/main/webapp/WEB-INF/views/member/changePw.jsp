<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="${pageContext.request.contextPath}/resources/js/fnLoginCheck.js"></script>

<style>


	/* 초기화 */
	*{ margin: 0; padding: 0; box-sizing: border-box; font-size: 14px; font-weight: 600; }
	
	html{ background-color: rgb(240, 242, 245); }
	
	a{ text-decoration: 0; color: black; }
	ul, ol{ list-style-type: none; }
	
	label{
	    display: block;
	    text-align: left;
	    padding-bottom: 5px;
	    font-size: 18px;
	}
	
	input{
		background-color: aliceblue;
	    border: 2px solid rgb(0, 0, 0, 0);
	}
	
	input:focus{
	    outline: none;
	}
	
	.container{
	    width: 600px;
	    padding-top: 70px;
	    margin: 100px auto;
	    background-color: white;
	    border-radius: 30px;
	}

	.head{
	    width: 100%;
	}
		
	.pw_change_box{
	    width: 600px;
	    margin: 0 auto;
	}
	
	/* 비밀번호 : 현재 비밀번호 / 새 비밀번호 / 새 비밀번호 확인 */
	.input_box{
	    width: 450px;
	    height: 80px;
	    margin: 35px auto 20px; 	
	}
	
	.input_box input{
	    width: 100%; height: 45px;
	    border-radius: 10px;
	}
	
	/* 이메일 */
	.email_box{
	    width: 450px;
	    margin: 35px auto;
	}
	
	.email_box input[type=text]{
	    width: 75%; height: 45px;
	    border-radius: 10px;
	    margin-bottom: 5px;
	}
	
	.email_box input[type=button]{
	    width: 23%; height: 45px;
	    background-color: pink;
	    border-radius: 10px;
	    font-size: 12px;
	}

	/* input tag 공백 */
	.space input[type=text] {
		padding-left:15px;
	}
	
	/* 정규식 메세지 */
	.error_msg {
	    font-size:13px;
	    color:red;
	}
	.pass_msg {
	    font-size:13px;
	    color:grey;
	}
	
	
	/* btn */
	.btn_wrap{
	    width: 450px;
	    margin: 35px auto;
	}
	.btn_wrap button{
		color:white;
	    width: 450px; height: 45px;
	    background: #fe585c;
	    border-radius: 10px;
	    margin-bottom: 40px;
		border: none; 
	}
	
	/* 포인터 */
	.pointer:hover {
		cursor: pointer;
	}
	
	/* 안내메세지 박스 */
	.msg_box {
		padding: 5px;
	} 
	
	/* 현재 비밀번호 */
	#password_check_btn {
	    width: 102.5px;
	    height: 45px;
	    background-color: pink;
	    border-radius: 10px;
	    font-size: 12px;
	    margin-left: 5px;
	}
	#pw {
		width: 337.5px;
	}
	#current_pw_box {
		display: flex;
		width:220px;
	}
	
	
		/* header 관련 */
  #myhome_icon { color :  #fe4662; }
  #myhome_btn { border-bottom: 8px solid #fe4662}
   .header_wrap {
      z-index: 8;
      position: fixed;
      top: 0;
      width:100%;
      height: 100px;
      background-color: white;
      display: flex;
   }
   #header_logo {
   	 display: inline-block;
   	 margin-left: 40px;
   	 margin-right: 100px;
   }
   	.header_right_box {
		display: inline-flex;
	}
	
    .header_left_box > a{
        display: block;
		margin: 10px 0 10px 70px;
		width: 230px;
		height: 85px;
		background-size: 219px 85px;
		background-repeat: no-repeat;
		background-image: url(../image/logo_color.png);
		font-size: 0;
    }
    
	#logo_img {
		width:  200px;
		margin-top: 12px;
		margin-left: 50px;
	}
	.header_mid_box {
      display: inline-flex;
	  margin: 0 auto;
	}
    .btn_box{
        display: flex;
        text-align: center;
        margin: 0 0 0 150px;
        width: 750px;
    }
	.btn_box .boxes {
       	display: inline-block;
		margin: 0 auto;
		width: 187px;
		height: 100%;
	}
	 .boxes > a{
	 	width: 100%;
	 	height: 100%;
	 	margin: 0 auto;
	 	flex-direction: row;
	}
	li  a  i {
		color: #6f7070;
		text-align: center;
		margin: 30px auto;
		font-size: 40px;
	}


	.search_box {
		display: flex;
		border-radius: 10px;
		margin-left: 40px;
		margin-bottom: 30px;
		margin-top: 26px;
		margin-left: 40px;
		border: none;
		width: 280px;
		height: 46px;
		line-height: 20px;
		background-color: #e8f0fe;
	}
	
	.search_box>input {
		border: none;
		outline: none;
		width: 220px;
		height: 30px;
		line-height: 30px;
		margin-top: 8px;
		margin-left: 18px;
		background-color: #e8f0fe;
	}
	
	#search_icon {
		width: 40px;
		height: 40px;
		text-align: center;
		margin-top: 4px;
		margin-right: 16px;
		border: none;
		background-color: #e8f0fe;
	}
	
	#search_icon>i {
		color: #6f7070;
		width: 38px;
		height: 38px;
		margin-top: 10px;
		cursor: pointer;
	}
	
	#header_profile_box {
		width: 60px;
		height: 60px;
		margin: 18px;
		border-radius: 100%;
	}
	
	#header_profile_img {
		width: 60px;
		height: 60px;
		top: 20px;
		border-radius: 100%;
	}

	#header_profile_menu {
		z-index: 6000;
	    margin-top: 84px;
	    margin-left: -140px;
		width: 140px;
		height: 138px;
		border: 1px solid rgb(240, 242, 245);
		border-radius: 3px;
		background-color: white;
		box-shadow: 5px 5px 8px rgba(160, 160, 160, 0.3);
	}
	
	#header_profile_menu li {
		margin-top: 4px;
		margin-left: 4px;
		font-size: 14px;
		font-weight: lighter;
		border-bottom: 1px solid rgb(240, 242, 245);
	}
	
	#header_profile_menu p {
		font-size: 12px;
		color: rgb(50, 50, 50);
	}
	
	.header_profile_no {
		display: none;
	}
	
	.header_profile_see {
		display: block;
	}
	
	#profile_menu_list1, #profile_menu_list2, #profile_menu_list3 {
		font-size: 14px;
		font-weight: normal;
		color: black;
	}
	
	#profile_menu_list1 {
		font-weight: bold;
		font-size: 15px;
	}
	
	.pointer:hover {
		cursor: pointer;
	}
	
	/*  footer */
   .footer_wrap {
	   padding-bottom: 40px;
	   text-align: center;
	   color: #6e6e6e;
   }
  .footer_wrap  h2 { margin-top:  40px;}
	
	
</style>

<script type="text/javascript">

//이름/비밀번호/핸드폰/생일/성별 --> 이메일은X

	$(document).ready(function(){
		fnCheckSubmit();             // 모든 함수 확인 후 서브밋넘기기
		fnCurrentPwCheck();
		fnNewPwCheck(); // 새 비밀번호 정규식
		fnPwDoubleCheck();
		fnCurrentEmailCheck();
		fnProfileBtn();
		fnCheckLogin();
	}); 
	
	// 서브밋
	 function fnCheckSubmit(){
	  /*   $('#pw_change_form').on('submit', function(event){ */
	    $('#modify_btn').on('click', function(event){
	      if( confirm('변경하시겠습니까?') == false){
				event.preventDefault(); 
	          return false;
			} else if ( pw_result == false ) {
                event.preventDefault(); 
					Swal.fire({
						text: '현재 비밀번호를 확인해주세요'
					})
                console.log('submit result : ' + pw_result);
                return false;  
            } else if ( new_pw_result == false ) {
                event.preventDefault();  
					Swal.fire({
						text: '새 비밀번호를 확인해주세요'
					})
                console.log('submit new_pw_result : ' + new_pw_result);
                return false;  
            } else if ( pw_double_result == false ) {
                event.preventDefault(); 
					Swal.fire({
						text: '새 비밀번호를 확인해주세요'
					})
                console.log('submit pw_double_result : ' + pw_double_result);
                return false;  
            } else if ( email_result == false ) {
				event.preventDefault();
	    		  Swal.fire({
						text: '이메일을 확인해주세요'
					})
                console.log('submit email_result : ' + email_result);
                return false;  
            } else if ( authCodePass == false ) { 
				event.preventDefault();
	    		  Swal.fire({
						text: '이메일 인증을 진행해주세요'
					})
                console.log('submit authCodePass : ' + authCodePass);
            	return false;
            } else{
            	return true;
            }
	        });
	    } //   function fnCheckSubmit()
	    
	
    // 아이디
	let regId = /^[a-zA-Z0-9_-]{4,}$/;
    // 비밀번호
	let regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
    // 이름
	let regName = /^[a-zA-Z가-힣]{1,30}$/;
    // 이메일
	let regEmail = /^[0-9a-zA-Z-_]+@[a-zA-Z0-9]+([.][a-zA-Z]{2,}){1,2}/;
    // 핸드폰 번호
	let pw_result = false;
	let new_pw_result = false;
	let pw_double_result = false;
	let email_result = false;
	let authCodePass = false;
      


/* -------------------------------------------------------------- fnNewPwCheck() ------------------------------------------------ */
      // 새 비밀번호 정규식 
      function fnNewPwCheck(){
         
         $('#newPw').on('blur keyup', function(){
            if( regPwd.test( $("#newPw").val())){    
                $("#new_pw_check").text("사용가능한 비밀번호입니다.").addClass("pass_msg").removeClass('error_msg');
                new_pw_result = true;
            } else if (    $('#newPw').val() == '' ){
                $("#new_pw_check").text('입력은 필수입니다.').addClass('error_msg').removeClass('pass_msg');
                new_pw_result = false;
            }    else {
                $("#new_pw_check").text("비밀번호는 8~20자의 영문 대/소문자, 숫자, 특수문자 등 3종류 이상으로 조합해주세요.").addClass('error_msg').removeClass('pass_msg');
                new_pw_result = false;
            }
         console.log("newPw: "+pw_result);
            return new_pw_result;
         }); 
      
      } // fnPwCheck
      
/* -------------------------------------------------------------- fnPwDoubleCheck() ------------------------------------------------ */
   // 비밀번호 재확인 일치 
         function fnPwDoubleCheck(){
          
          $('#pwCheck').on('blur keyup', function(){     
                if($('#newPw').val() !=  $("#pwCheck").val() ){
                    $("#pw_doubleCheck").text( '비밀번호가 일치하지 않습니다.').addClass('error_msg').removeClass('pass_msg');
                    pw_double_result = false;
                } else{
                    $("#pw_doubleCheck").text('').removeClass('error_msg').removeClass('pass_msg');
                    pw_double_result = true;
                }  
          console.log("pw2 : "+pw_double_result);
          return pw_double_result;
            });
      }

/* -------------------------------------------------------------- fnSendAuthCode() ------------------------------------------------ */
         function fnSendAuthCode(){
         	
         	$('#authCode_btn').click(function(){
         		$.ajax({
         			url : '/nearby/member/sendAuthCode',
         			type: 'post',
         			data: 'email='+ $('#email').val(),
         			dataType: 'json',
         			success : function(map) {
    					Swal.fire({
    						text: '인증코드가 전송되었습니다.'
    					})
         				fnVerifyAuthcode(map.authCode); // 12/13추가
         			},
         			error: function() {
    					Swal.fire({
    						text: '인증코드 전송 실패'
    					})
     				}
         		});	 // ajax
         	});
         	return;
         } 
/* ------------------------------------------ fnVerifyAuthcode() ------------------------------------ */
      	// 인증코드 검증 변수와 함수
      	function fnVerifyAuthcode(authCode){
      		$('#verify_btn').click(function(){
      			if ( $('#authCode').val() == '' ) {
					Swal.fire({
						text: '인증번호를 입력하세요'
					});
      				authCodePass = false;
      			}else if ( $('#authCode').val() == authCode ) {
					Swal.fire({
						text: '인증되었습니다.'
					});
      				authCodePass = true;
      			} else {
					Swal.fire({
						text: '인증에 실패했습니다.'
					});
      				authCodePass = false;
      			}
      		}); // end click
      	}         
 /* ************************************************************************************ */
         
</script>

<script>

/* ------------------------------------------------------------- fnCurrentPwCheck() ------------------------------------------------- */	
	// 현재 비밀번호 확인 함수
	function fnCurrentPwCheck() {  // checkPassword
	    $('#password_check_btn').on('click',function(){ // TODO ajax로 select 결과 받아서 처리하기해야함.

			$.ajax({
				url : '/nearby/member/checkPassword',
				type : 'post',
				data : 'pw=' + $('#pw').val(),
				dataType: 'json',               // 받아올 데이터 타입
				success : function(map){
					console.log(map);
					let name = '${loginUser.name}';
					 if( map.selectResult > 0){
						Swal.fire({
							icon: 'success',
							title: '비밀번호 확인완료',
							text: name + '님의 비밀번호가 확인되었습니다.',
						})
						 pw_result = true;
		             } else if(map.selectResult == 0) {
						Swal.fire({
							icon: 'error',
							title: '비밀번호 재확인필요',
							text: name + '님의 비밀번호가 일치하지 않습니다.',
						})
						 pw_result = false;
					 }
					 console.log(pw_result);
				}, // End Seuccess function
				error : function(xhr, ajaxOptions, thrownError) {
			       console.log(xhr.responseText);
				} // End Error function
				
			}) // End ajax
		}); // click event
	} // End fnCurrentPwCheck
	
	
	
	
/* ------------------------------------------------------------- fnCurrentEmailCheck() ------------------------------------------------- */	
	// 현재 이메일 확인 함수
	function fnCurrentEmailCheck() {  // checkPassword
	    $('#authCode_btn').on('click',function(){ 

			$.ajax({
				url : '/nearby/member/selectByEmail',
				type : 'post',
				data : 'email=' + $('#email').val(),
				dataType: 'json',               // 받아올 데이터 타입
				success : function(map){
					console.log(map);
					let name = '${loginUser.name}';
					 if( map.result != null){
						Swal.fire({
							icon: 'success',
							title: '이메일 확인완료',
							text: name + '님의 이메일로 인증번호가 발송되었습니다.',
						})
						fnSendAuthCode(map.result.id);
						 email_result = true;
		             } else if(map.result == null) {
						Swal.fire({
							icon: 'error',
							title: '이메일 재확인필요',
							text: name + '님의 이메일이 일치하지 않습니다.',
						})
						 email_result = false;
					 }
					 console.log(email_result);
				}, // End Seuccess function
				error : function(xhr, ajaxOptions, thrownError) {
			       alert(xhr.responseText);
				} // End Error function
				
			}) // End ajax
		}); // click event
	} // End fnCurrentPwCheck
/* ------------------------------------------------------------- fnCurrentEmailCheck() ------------------------------------------------- */	
    function fnSendAuthCode(id){
    	
   /*  	$('#authCode_btn').click(function(){ */
    		$.ajax({
    			url : '/nearby/member/sendAuthCode',
    			type: 'post',
    			data: 'email='+ $('#email').val(),
    			dataType: 'json',
    			success : function(map) {
    				fnVerifyAuthcode(map.authCode, id); // 12/13추가
    			},
    			error: function() {
					Swal.fire({
						text: '인증코드 전송실패'
					})
				}
    		});	 // ajax
/*     	}); */
    	return;
    }

/* ------------------------------------------------------------- fnCurrentEmailCheck() ------------------------------------------------- */	

   	// 인증코드 검증 변수와 함수
   	function fnVerifyAuthcode(authCode){
   		$('#verify_btn').click(function(){
   			if ( $('#authCode').val() == authCode ) {
				Swal.fire({
					text: '인증되었습니다.'
				})
   				authCodePass = true;
   			} else if ( $('#authCode').val() == '' ) { // 12/14 추가
				Swal.fire({
					text: '인증번호를 입력하세요'
				})
   				authCodePass = false;
   			} else {
				Swal.fire({
					text: '인증에 실패했습니다.'
				})
   				authCodePass = false;
   			}
   			
   		}); // end click
   	}         


	// fnProfileBtn();
	function fnProfileBtn() {
		$('#header_profile_box').click(function (){
			$('#header_profile_menu').toggleClass('header_profile_see');
		});
	};


	
	/* ----------------------------------------- fnCheckLogin() --------------------------------  */
 	function fnCheckLogin(){
		let loginInfo = '${loginUser.id}';
		if (loginInfo == '') {
			
		 Swal.fire({
				text: '세션이 만료되었습니다. 로그인 화면으로 이동하시겠습니까?',
		        icon: 'warning',
		        showCancelButton: true,
		        confirmButtonColor: '#D4D4D4',  // confirm
		        cancelButtonColor: '#D4D4D4',   // cancel
		        confirmButtonText: '이동',
		        cancelButtonText: '취소'	
		     }).then((result) => {
				if(result.isConfirmed) { // confirm이 false이면 return
					location.href='/nearby/';
				}
		     })
		}
	}	 	
	
</script>	

</head>
<body>
	<header class="header_wrap">
	    <div class="header_left_box">
			  <a href="/nearby/board/boardList"><img id="header_logo" src="${pageContext.request.contextPath}/resources/image/logo_color.png" width="200px"></a>
		</div>
	     <div class="header_mid_box">
			<ul class="btn_box">
				<li id="home_btn" ><a class="boxes" href="/nearby/board/boardList"><i id="home_icon" class="fas fa-home"></i></a></li>
				<li id="follow_btn"><a class="boxes" href="/nearby/follow/followList"><i id="follow_icon" class="far fa-address-book"></i></a></li>
				<li id="myhome_btn"><a class="boxes" href="/nearby/board/myHome"><i id="myhome_icon" class="fas fa-user-alt"></i></a></li>
				<li id="header_insert_btn" ><a class="boxes" href="/nearby/board/insertPage"><i id="insert_icon" class="far fa-plus-square"></i></a></li>
			</ul>
		</div>
	     <div class="header_right_box">
			<form class="main_search" action="/nearby/board/searchBoardList">
				<div class="search_box pointer">
					<input type=text id="query" name="query">
					<button id="search_icon">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</form>
			<div id="header_profile_box">
	   	   	 	<c:if test="${empty loginUser.profile.pSaved}">
						<img id="header_profile_img" src="${pageContext.request.contextPath}/resources/image/profile_default.png" class="pointer defaultImg">
				</c:if>
				<c:if test="${not empty loginUser.profile.pSaved}">
						<img id="header_profile_img" src="/nearby/${loginUser.profile.pPath}/${loginUser.profile.pSaved}" class="pointer">
				</c:if>
            </div>
		    <div id="header_profile_menu" class="header_profile_no">
				<ul>
					<li>
						<a id="profile_menu_list1" href="#">${loginUser.id}</a>
						<p>${loginUser.name}님<p>
						<p>${loginUser.email}</p>	
					</li>
	   	   			<li><a id="profile_menu_list2" href="/nearby/member/mypage">계정 관리</a></li>
	   	   			<li><a id="profile_menu_list2" href="/nearby/member/changePasswordPage">비밀번호 변경</a></li>
	   	   			<li><a id="profile_menu_list3" href="/nearby/member/logout">로그아웃</a></li>
				</ul>
		    </div>
		</div>
     
     </header>
    <div class="container" style="margin-top: 160px;">
        <div class="pw_change_box">
    
            <form action="/nearby/member/changePassword" method="post" id="pw_change_form">

                <!-- 비밀번호 -->
                <div class="input_box">
                    <label for="pw">현재 비밀번호</label>
                    <div id="current_pw_box">
	                    <span class="space">
	                  	  <input type="text" id="pw" name="pw">
	                    </span>
	                    <span>
		                    <input type="button" value="확인하기" id="password_check_btn" class="pointer">
	                    </span>
                    </div>
                </div>
                
                <div class="input_box">
                    <label for="newPw">새 비밀번호</label>
                    <span class="space">
                  	  <input type="text" id="newPw" name="newPw">
                    </span>
                    <p id="new_pw_check" class="msg_box"></p>
                </div>

                <!-- 비밀번호 확인 -->
                <div class="input_box">
                    <label for="pwCheck">새 비밀번호 확인</label>
                    <span class="space">
	                    <input type="text" id="pwCheck" >
                    </span>
                    <p id="pw_doubleCheck" class="msg_box"></p>
                </div>

                <!-- 이메일 -->
                <div class="email_box">

                    <!-- 이메일 -->
                    <label for="email">이메일</label>
                    <span class="space">
	                    <input type="text" id="email" name="email">
                    </span>

                    <!-- 인증코드 발송 -->
                    <span class="space">
	                    <input type="button" value="인증번호받기" id="authCode_btn" class="pointer">
                    </span>
                    <span id="email_check"></span>

                    <!-- 인증코드 입력 칸 -->
                    <span class="space">
	                    <input type="text" name="authCode" id="authCode">
                    </span>
                    <input type="button" value="인증하기" id="verify_btn" class="pointer">
                </div>

               <div class="btn_wrap">
                   <button id="modify_btn" class="btn btn-primary pointer">수정완료</button>             
               </div>                    
            </form>
            
        </div>
   
    </div>
      <footer class="footer_wrap">
           <h2>About NearBy</h2><br>
           <p>로고     히스토리     개인정보처리방침     도움말      제휴      광고      문의/피드백      채용</p>
           <p>© NearBy Corp. All rights reserved.</p>
    </footer>
</body>
</html>