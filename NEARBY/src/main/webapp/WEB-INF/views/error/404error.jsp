<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
</style>
</head>
<body>
 
<div class="img_wrap">

<a href="/nearby/"><img id="app_icon" src="${pageContext.request.contextPath}/resources/image/app_icon.png" class="img">
</a>
</div>
<div>
    
<div class="title">요청하신 페이지를  찾을 수 없습니다.</div>

</div>

</html>