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
	a {
		text-decoration: none;	
	}
	
	ul li {
		list-style-type: none;
	}
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
	#members_icon{
		color: #fe4662;
    }
	
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
   		cursor: pointer;
   }
   #profile_menu {
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
   .profile_see {	display: block; }
   .profile_menu li {
        display: block;
		border: 1px solid black;   
   }
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
	$('#profile_menu').toggleClass('profile_see');
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
	   			<li id="myhome_btn"><div class="boxes"><a href="/nearby/admin/memberList"><i id="members_icon" class="fas fa-users"></i></a></div></li>
    	    </ul>			
       </div>
   	   <div class="right_box">
   	   		<form class="main_search">
   	   			<div class="search_box">
   	   				<input type=text id="search" name="search">
   	   				<div id="search_icon"><i class="fas fa-search"></i></div>   	   				
   	   			</div>	   	   				
   	   		</form>
   	   	  <div id="profile_box" onclick="fnShowBtnBox()">
   	   	 	<c:if test="${empty loginUser.profile.pSaved}">
					<img id="profile_img" src="${pageContext.request.contextPath}/resources/image/profile_default.png"  class="pointer defaultImg">
			</c:if>
			<c:if test="${not empty loginUser.profile.pSaved}">
					<img id="profile_img" src="/nearby/${loginUser.profile.pPath}/${loginUser.profile.pSaved}" class="pointer">
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
	<table class="member" id="member">
		<thead>
			<tr>
				<td>회원번호</td>
				<td>아이디</td>
				<td>이름</td>
				<td>이메일</td>
				<td>생일</td>
				<td>번호</td>
				<td>성별</td>
				<td>가입일</td>
			</tr>
		</thead>
		<tbody>
	<c:if test="${member != null }">
	 <c:forEach items="${member}" var="member">
			<tr>
				<td>${member.mNo}</td>
				<td>${member.id}</td>
				<td>${member.name}</td>
				<td>${member.email}</td>
				<td>${member.birthday}</td>
				<td>${member.phone}</td>
				<td>${member.gender}</td>
				<td>${member.mCreated}</td>
			</tr>
	 </c:forEach>
	</c:if>
		</tbody>
		
	</table>



<br><br><br>
<h4>남자 유저 :  ${fn:length(memberMen) }  </h4>

	<table class="menTable" id="menTable">
		<thead>
			<tr>
				<td>회원번호</td>
				<td>아이디</td>
				<td>이름</td>
				<td>이메일</td>
				<td>생일</td>
				<td>번호</td>
				<td>성별</td>
				<td>가입일</td>
			</tr>
		</thead>
		<tbody>
		<c:if test="${memberMen != null }">
 			<c:forEach items="${memberMen}" var="men">
			<tr>
				<td>${men.mNo}</td>
				<td>${men.id}</td>
				<td>${men.name}</td>
				<td>${men.email}</td>
				<td>${men.birthday}</td>
				<td>${men.phone}</td>
				<td>${men.gender}</td>
				<td>${men.mCreated}</td>
			</tr>
		   </c:forEach>
	   </c:if>
		</tbody>
		
	</table>


<br><br><br>
<h4>여자 유저 :  ${fn:length(memberWomen) }  </h4>

	<table class="womenTable" id="womenTable">
		<thead>
			<tr>
				<td>회원번호</td>
				<td>아이디</td>
				<td>이름</td>
				<td>이메일</td>
				<td>생일</td>
				<td>번호</td>
				<td>성별</td>
				<td>가입일</td>
			</tr>
		</thead>
		<tbody>
		<c:if test="${memberWomen != null }">
		 <c:forEach items="${memberWomen}" var="women">
			<tr>
				<td>${women.mNo}</td>
				<td>${women.id}</td>
				<td>${women.name}</td>
				<td>${women.email}</td>
				<td>${women.birthday}</td>
				<td>${women.phone}</td>
				<td>${women.gender}</td>
				<td>${women.mCreated}</td>
			</tr>
		 </c:forEach>
	    </c:if>
		</tbody>
		
	</table>


<br><br><br>
<h4>성별없음 유저 :  ${fn:length(memberNoGender) }  </h4>

	<table class="noGender" id="noGender">
		<thead>
			<tr>
				<td>회원번호</td>
				<td>아이디</td>
				<td>이름</td>
				<td>이메일</td>
				<td>생일</td>
				<td>번호</td>
				<td>성별</td>
				<td>가입일</td>
			</tr>
		</thead>
		<tbody>
		<c:if test="${memberNoGender != null }">
 		<c:forEach items="${memberNoGender}" var="noGender">
			<tr>
				<td>${noGender.mNo}</td>
				<td>${noGender.id}</td>
				<td>${noGender.name}</td>
				<td>${noGender.email}</td>
				<td>${noGender.birthday}</td>
				<td>${noGender.phone}</td>
				<td>${noGender.gender}</td>
				<td>${noGender.mCreated}</td>
			</tr>
		 </c:forEach>
		</c:if>
		</tbody>
	</table>
<hr><br>



<h4>오늘 날짜 : <span class="today"></span></h4>
<h4>오늘가입 유저 :  ${fn:length(memberCreatedDay) }  </h4>

	<table class="memberCreatedDay" id="memberCreatedDay">
		<thead>
			<tr>
				<td>회원번호</td>
				<td>아이디</td>
				<td>이름</td>
				<td>이메일</td>
				<td>생일</td>
				<td>번호</td>
				<td>성별</td>
				<td>가입일</td>
			</tr>
		</thead>
		<tbody>
		<c:if test="${memberCreatedDay != null }">
		 <c:forEach items="${memberCreatedDay}" var="memberCreatedDay">
			<tr>
				<td>${memberCreatedDay.mNo}</td>
				<td>${memberCreatedDay.id}</td>
				<td>${memberCreatedDay.name}</td>
				<td>${memberCreatedDay.email}</td>
				<td>${memberCreatedDay.birthday}</td>
				<td>${memberCreatedDay.phone}</td>
				<td>${memberCreatedDay.gender}</td>
				<td>${memberCreatedDay.mCreated}</td>
			</tr>
		 </c:forEach>
		</c:if>
			
		</tbody>
		
	</table>



<br><br>



<input type="hidden" id="men" value="${fn:length(memberMen) } ">
<input type="hidden" id="women" value="${fn:length(memberWomen) } ">
<input type="hidden" id="noGender" value="${fn:length(memberNoGender) } ">

<br><br>
 <a href='/nearby/board/boardList'>  NEARBY로 이동  </a>
 
 
 
<div class ="chartjs">
	<div class ="donutchart"><canvas id="donutchart" height="250" width="250"></canvas></div>
</div>


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