<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	 * { 
	 font-family: 'Noto Sans KR', sans-serif;
	 padding: 0; margin: 0;
	 box-sizing: border-box;
	 background-color: #fafafa;
	}
	
    .title {
    	font-size: 20px;
    	text-align: center;
    	width: 500px;
    	margin: 30px auto;
     }
    
	.img_wrap {
		width: 100%;
		margin: 90px auto;
		text-align: center;
		}
	.img {
		width: 300px;
		margin: 0 auto;
	}
  .footer_wrap {
   border-top:thin;
   margin-top: 130px;
   padding-bottom: 50px;
   text-align: center;
   font-weight: bold;
   }
   .footer_wrap p{
   		font-size: 12px;
   		font-weight: normal;
   }
   
   
</style>
</head>
<body>
 
<div class="img_wrap">

<a href="/nearby/"><img id="app_icon" src="${pageContext.request.contextPath}/resources/image/app_icon.png" class="img">
</a>
</div>
<div>
    
<div class="title">서비스 이용에 불편을 드려 죄송합니다.</div>

</div>

<footer class="footer_wrap">
           <h5>About NearBy©</h5><br>
           <p>로고     히스토리     개인정보처리방침     도움말      제휴      광고      문의/피드백      채용</p>
           <p>© 2021-2022 NEARBY.COM NEARBY isn’t endorsed by Facebook and doesn’t reflect the views or opinions of Facebook or anyone officially </p>
           <p>involved in producing or managing League of Legends. League of Legends and Riot Games are trademarks or registered trademarks of Riot</p>
           <p>Games, Inc. NEARBY Company © NearBy, Inc.</p>   
            <br><br>
      </footer>

</body>
</html>