<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Insert title here</title>
<style>
	*{
	    margin: 0;  padding: 0;
	    box-sizing: border-box;
	}
	a {	text-decoration: none;	}
	ul li {	list-style-type: none;   }
	.container {
		z-index: 4000;
		position: fixed;
		width: 100%;
		height: 106px;
		display: flex;
		background-color: white;
		border-bottom: 0.5px solid rgba(160, 160, 160, 0.5);
		box-shadow: 5px 5px 8px rgba(160, 160, 160, 0.3);
	}
	.left_box {
		width: 25%;
		height: 100%;
	}
	.header {
		width: 100%;
		height: 106px;
		background-color: white;
	}
	#admin_icon{  color: #fe4662;  }
	.mid_box {
		width: 50%;
		height: 100%;
		display: flex;
	}
	.right_box {
		position: relative;
		width: 25%;
		height: 100%;
		display: flex;
	}
	#logo_img {
		width:  200px;
		margin-top: 12px;
		margin-left: 50px;
	}
	.btn_box li {
	    float: left;
		width: 25%;
		height: 100%;
	}
	.boxes {
	    margin: 4px auto;
		width: 110px;
		height: 89px;
	}
	li  a  i {
		color: #6f7070;
		text-align: center;
		margin-top: 20px;
		font-size: 40px;
	}
	a:link { color:black; text-decoration:none}
	a:visited { color:black; text-decoration: none;}
    li > a:hover {	color: #fe4662;  }
    .boxes:hover {
    	background-color: rgba(240,242,245,0.7);
    	border-radius: 4px;
    }
	.search_box {
	    display: flex;
	    border-radius: 10px;
        margin-lfet: 40px;
        margin-bottom: 30px;
        margin-top: 26px;
        margin-left: 40px;
        border: none;
        width: 280px;
        height: 46px;
        line-height: 20px;
        background-color: #e8f0fe;
   }
    .search_box > input {
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
    }
    #search_icon > i {
    	color: #6f7070;
    	width: 36px;
    	height: 36px;
    	margin-top: 10px;
    }
 	#profile_box {
         position: absolute;
         left : 360px;
         top: 20px;
         width: 60px;
         height: 60px;
         border-radius: 100%;
   }
   #profile_img {
         width: 60px;
         height: 60px;
         border-radius: 100%;
   }
   #profile_box {
   		position: absolute;
   		left : 360px;
   		top: 20px;
   		width: 60px;
   		height: 60px;
   }
   .profile_menu {
        display: none;
        z-index: 6000;
   		display: inline-block;
   		position: absolute;
   		top: 300px;
   		left: 100px;
   	    width: 80px;
   	    height: 100px;
   	    border: 1px solid black;
   }
   .profile_menu li {
        display: block;
		border: 1px solid black;   
   }
   .profile_no { 	display: none;  }
   .profile_see {	display: block; }
   table {	border-collapse: collapse;  }
   table tr td { border: 1px solid black; padding-left: 5px; }
   table thead tr:nth-child(1) { font-weight: bold; }
   table thead tr:nth-child(2){ border-bottom: none; }
   table tr td:nth-child(1) { width: 130px;  }   
   table tr td:nth-child(2) { width: 150px;  }
   table tr td:nth-child(3) { width: 150px;  }
   table tr td:nth-child(4) { width: 250px;  }
   table tr td:nth-child(5) { width: 150px;  }
   table tr td:nth-child(6) { width: 150px;  }
   table tr td:nth-child(7) { width: 50px;  }
   table tr td:nth-child(8) { width: 150px;  }
 
</style>
<script type="text/javascript">
  $(document).ready(function(){
	 let today = new Date();
	 let year = today.getFullYear();
	 let month = today.getMonth() + 1;
	 let day = today.getDate();
	 
	 $('.today').text(year+"년 "+month +"월 "+ day+"일");
  });

// fnProfileBtn();
function fnShowBtnBox() {
	$('#profile_menu').toggleClass('profile_see profile_no');
}
</script>

</head>
<body>
<header  class="header">
	 <div class="container">
   
       <div class="left_box">
       		<a href="/nearby/board/boardList"><img src="${pageContext.request.contextPath}/resources/image/logo_color.png" id="logo_img"></a>
       </div> 
       <div class="mid_box">
            <ul class="btn_box">
			    <li id="home_btn" ><div class="boxes"><a href="/nearby/admin/admin"><i id="admin_icon" class="fas fa-user-shield"></i></a></div></li>
			    <li id="home_btn" ><div class="boxes"><a href="/nearby/board/boardList"><i id="home_icon" class="fas fa-home"></i></a></div></li>
	   			<li id="myhome_btn"><div class="boxes"><a href="/nearby/admin/memberList"><i id="myhome_icon" class="fas fa-users"></i></a></div></li>
    	    </ul>			
       </div>
   	   <div class="right_box">
   	   		<form class="main_search">
   	   			<div class="search_box">
   	   				<input type=text id="search" name="search">
   	   				<div id="search_icon"><i class="fas fa-search"></i></div>   	   				
   	   			</div>	   	   				
   	   		</form>
   	   	  <div id="profile_box">
   	   	 	<c:if test="${empty loginUser.profile.pSaved}">
					<img id="profile_img" src="${pageContext.request.contextPath}/resources/image/profile_default.png" onclick="fnShowBtnBox()" class="pointer defaultImg">
			</c:if>
			<c:if test="${not empty loginUser.profile.pSaved}">
					<img id="profile_img" src="/nearby/${loginUser.profile.pPath}/${loginUser.profile.pSaved}" onclick="fnShowBtnBox()" class="pointer">
			</c:if>
          </div>
   	   		<div id="profile_menu">
   	   			<ul>
   	   				<li><a href="/nearby/member/logout">로그아웃</a></li>   	   					
   	   			</ul>
   	   		</div>	
   	   	</div> 
 	</div>
</header>

<h1>관리자 페이지입니다.</h1>

<h3><a href="/nearby/admin/memberList">총 유저 :  ${fn:length(member) } </a></h3>


<br><br><br>
<h4>남자 유저 :  ${fn:length(memberMen) }  </h4>

	
<br><br><br>
<h4>여자 유저 :  ${fn:length(memberWomen) }  </h4>


<br><br><br>
<h4>성별없음 유저 :  ${fn:length(memberNoGender) }  </h4>

	
<hr><br>

<h4>오늘 날짜 : <span class="today"></span></h4>
<h4>오늘가입 유저 :  ${fn:length(memberCreatedDay) }  </h4>





<br><br>
총 게시글 :  ${fn:length(board) }


<input type="hidden" id="men" value="${fn:length(memberMen) } ">
<input type="hidden" id="women" value="${fn:length(memberWomen) } ">
<input type="hidden" id="noGender" value="${fn:length(memberNoGender) } ">

<br><br>
 <a href='/nearby/board/boardList'>  NEARBY로 이동  </a>
 
 
 
<div class ="chartjs">
<%-- 	<div class ="linechart"><canvas id="linechart" height="250" width="250"></canvas></div> --%>
<%-- 	<div class ="barchart"><canvas id="barchart" height="250" width="250"></canvas></div> --%>
	<div class ="donutchart"><canvas id="donutchart" height="250" width="250"></canvas></div>
</div>
<!-- <!-- <script> -->
<!-- var donutchart = new Chart(document.getElementById("donutchart"), { -->
<!-- 	  type: 'doughnut', -->
<!-- 	    data: { -->
<!-- 	      datasets: [{ -->
<!-- 	        data: [40, 60],      // 섭취량, 총급여량 - 섭취량 -->
<!-- 	        backgroundColor: [ -->
<!-- 	          '#9DCEFF', -->
<!-- 	          '#F2F3F6' -->
<!-- 	        ], -->
<!-- 	        borderWidth: 0, -->
<!-- 	        scaleBeginAtZero: true, -->
<!-- 	      } -->
<!-- 	    ] -->
<!-- 	  }, -->
<!-- 	}); -->

<!-- </script> -->

<script type="text/javascript">
 let men = $('#men').val()
 let women = $('#women').val()
 let noGender = $('#noGender').val()
 console.log(men + noGender + women)
 
var ctx = $('#donutchart').get(0).getContext('2d');
var donutdata =
{
   labels : ["여자", "남자", "선택안함"],
    datasets:
        [{
            backgroundColor: [
            	'rgba(255, 99, 132, 1.5)',
            	'rgba(54, 162, 235, 1.5)',
            	'rgba(255, 206, 86, 1.5)'
            ],
            hoverBorderColor : '#fff',
            data: [women, men, noGender]
        }]
};
var donutoptions = { 
		responsive: false,
		legend : {
			display: true,
			position : 'bottom'
		},
		title: { 
			display: true, 
			text: '유저 성비', 
			fontSize: 17, 
			fontColor: 'rgba(46, 49, 49, 1)' 
		},
		animation: false,
		tooltips: {
            displayColors: false, // 툴팁 바 컬러 표시 여부
       },
};
var donutChart = new Chart(ctx,{          
	type: 'doughnut',
	data: donutdata,
	options: donutoptions
});

</script>



</body>
</html>