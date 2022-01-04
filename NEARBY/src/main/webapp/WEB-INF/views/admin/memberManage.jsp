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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminHeader.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>Insert title here</title>
<style>
  .header {
		
		height: 106px;
		background-color: white;
	}
    #memberList_btn {
		
        border-bottom: 8px solid #fe4662;
      }
	#memberList_icon { color: #fe4662; }
   .profile_menu li {
        display: block;
		border: 1px solid black;   
   }
   .search_result{
   		width: 1500px;
   		margin: 30px auto;
   		font-size: 20px;
   		font-weight: 600;
   		text-align: center;
   }
   .search_result_wrap { 
   		width: 1500px;
   		margin: 0 auto;
   }
   table {	
   		border-collapse: collapse; 
   		margin: 0 auto; 
   		text-align: center;
   	}
   table tr td { border: 1px solid black; padding-left: 5px; }
   table thead tr:nth-child(1) { font-weight: bold; }
   table thead tr:nth-child(2){ border-bottom: none; } 
   table tr td:nth-child(1) { width: 80px;   }   
   table tr td:nth-child(2) { width: 150px;  }
   table tr td:nth-child(3) { width: 150px;  }
   table tr td:nth-child(4) { width: 250px;  }
   table tr td:nth-child(5) { width: 150px;  }
   table tr td:nth-child(6) { width: 150px;  }
   table tr td:nth-child(7) { width: 50px;    }
   table tr td:nth-child(8) { width: 130px;   }
   table tr td:nth-child(9) { width: 130px;  } 
   .list_thead td { 
   		height: 40px; 
   		border-top: none;
   		border-left: none;
   		border-right: none;
   	    border-bottom: 2px solid gray;
   	}
    tbody tr td{ 	
    	height: 30px;
   		border-top: none;
   		border-left: none;
   		border-right: none;
     }
     tfoot tr td {
     	height: 40px; 
     	border-left: none;
   		border-right: none;
   		border-bottom: none;
      }
   .fa-user{   color: #fe4662;   cursor: pointer; }
	a { color:black; }
   .member_delete {		color : black; }

   .pageNo:hover{  font-weight: bold; color:black; }
   .nowPage {	color:red; }
   
   /* confirm 관련 */
  .swal2-popup {
 	 width: 330px;
  	 height: 220px;
  	 padding: 0.6em;
	}
  .swal2-icon.swal2-warning {
	width: 50px;
	height: 50px;
	border-color: pink;
	color: pink;
	}
 .swal2-content{    font-size: 0.9em;  }
 .swal2-icon .swal2-icon-content {
    height: 30px; width:20px;
 	font-size: 45px;
    padding-top: 10px;
    padding-left: 4px;
 }
 .swal2-styled.swal2-confirm {
 	width: 75px;
 	font-size: 14px;
 	background-color: pink;
 }
.swal2-styled.swal2-cancel {
	width:60px;
	height: 35.5px;
	font-size: 14px;
}

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

// 회원 비활성화 ajax
function fnMemberDelete(i){
		 
	/* if (confirm( '유저 번호'+ i+'번을 삭제하겠습니다.' )) {
		
		$.ajax({
			url : "/nearby/admin/deleteMember",
			type: "get",
			data : "mNo="+i,
			dataType: 'json',
			contentType:'application/json',
			success : function(map){
				 if(map.result.result > 0){
				  $('#mNoReInsert'+i).addClass('member_delete');
				  $('#mNo'+i).removeAttr('onclick');
				  location.href="/nearby/admin/findMember";
			 } else {
				 alert('삭제실패');
			 }
			}, 
			error: function(xhr){
				alert('삭제서버 실패');
				console.log(xhr.responseText);
			}
		})
	}	  */
	
   Swal.fire({
				//title: '정말로 삭제하시겠습니까',
		        text: '유저 번호'+ i+'번을 삭제하겠습니다.',
		        icon: 'warning',
		        showCancelButton: true,
		        closeOnClickOutside: false,
		        confirmButtonColor: '#D4D4D4',  // confirm
		        cancelButtonColor: '#D4D4D4',   // cancel
		        confirmButtonText: '삭제',
		        cancelButtonText: '취소'
		        }).then((result) => {
                    if (result.isConfirmed) {
                    /*     Swal.fire({
                            text : '삭제가 완료되었습니다.',
                            closeOnConfirm : true,
                            icon : 'success',
                            timer : 4000
                        }) */
	                        $.ajax({
									url : "/nearby/admin/deleteMember",
									type: "get",
									data : "mNo="+i,
									dataType: 'json',
									contentType:'application/json',
									success : function(map){
										 if(map.result.result > 0){
										  $('#mNoReInsert'+i).addClass('member_delete');
										  $('#mNo'+i).removeAttr('onclick');
										  location.href="/nearby/admin/findMember";
									 } else {
										 alert('삭제실패');
									 }
									}, 
									error: function(xhr){
										alert('삭제서버 실패');
										console.log(xhr.responseText);
									}
								})
                        }
                })
      }
 
 // 회원 비활->활성
 function fnReInsert(i){
/* 	 if (confirm( '유저 번호'+ i+'번을 활성화시키겠습니다.' )) {
		 $.ajax({
				url : "/nearby/admin/reInsertMember",
				type: "get",
				data : "mNo="+i,
				dataType: 'json',
				contentType:'application/json',
				success : function(map){
				 if(map.result.result > 0){
					 $('#mNo'+i).addClass('member_delete');
					 location.href="/nearby/admin/findMember";
				 } else {
					 alert('삭제실패');
				 }
				}, 
				error: function(xhr){
					alert('삭제서버 실패');
					console.log(xhr.responseText);
				}
			})
	 } */
	 
	  Swal.fire({
			//title: '정말로 삭제하시겠습니까',
	        text: '유저 번호'+ i+'번을 활성화시키겠습니다.',
	        icon: 'warning',
	        closeOnClickOutside: false,
	        showCancelButton: true,
	        confirmButtonColor: '#D4D4D4',  // confirm
	        cancelButtonColor: '#D4D4D4',   // cancel,
	        closeOnConfirm : false,
	        confirmButtonText: '활성화',
	        cancelButtonText: '취소'
	        }).then((result) => {
              if (result.isConfirmed) {
                /*   Swal.fire({
                	  closeOnConfirm : true,
                      text : '활성화 되었습니다.',
                      timer : 4000,
                      icon : 'success'
                  }) */
                      $.ajax({
                    		url : "/nearby/admin/reInsertMember",
            				type: "get",
            				data : "mNo="+i,
            				dataType: 'json',
            				contentType:'application/json',
            				success : function(map){
            				 if(map.result.result > 0){
            					 $('#mNo'+i).addClass('member_delete');
            					 location.href="/nearby/admin/findMember";
            				 } else {
            					// alert('삭제실패');
            				 }
            				}, 
            				error: function(xhr){
            				//	alert('삭제서버 실패');
            					console.log(xhr.responseText);
            				}
					 }) // ajax
                }
          }) // 
 }
</script>

</head>
<body>
	<header class="header">
		<jsp:include page="/WEB-INF/views/layout/adminHeader.jsp" flush="true" />
	</header>
    
    <c:if test="${map.query == null }">
		 <div class="search_result">전체 회원 목록 </div>
	</c:if>
   

	<c:if test="${map.query != null }">
		 <div class="search_result">"${map.query}" 검색결과  ${map.cnt}명이 조회되었습니다. </div>
	</c:if>
<input type="hidden" value="${map.cnt}" id="cnt">


<div class="search_result_wrap">
<table class="memberSearch" id="memberSearch">
		<thead>
			<tr class="list_thead">
			
				<td>회원번호</td>
				<td>아이디</td>
				<td>이름</td>
				<td>이메일</td>
				<td>생일</td>
				<td>번호</td>
				<td>성별</td>
				<td>가입일</td>
				<td>회원비활성화</td>
			</tr>
		</thead>
		<tbody>

		<c:if test="${map.searchResult != null }">
		 <c:forEach items="${map.searchResult}" var="memberSearch" varStatus="vs">
			<tr>
			
				<td>${memberSearch.mNo}</td>
				<td>${memberSearch.id}</td>
				<td>${memberSearch.name}</td>
				<td>${memberSearch.email}</td>
				<td>${memberSearch.birthday}</td>
				<td>${memberSearch.phone}</td>
				<td>${memberSearch.gender}</td>
				<td>${memberSearch.mCreated}</td>
				<c:if test="${memberSearch.state == 0 }">
					<td><i class="fas fa-user user_cursor" id="mNo${memberSearch.mNo}" onclick="fnMemberDelete(${memberSearch.mNo})" ></i></td>
				</c:if>
				<c:if test="${memberSearch.state == -1 }">
					<td><i class="fas fa-user member_delete" id="mNoReInsert${memberSearch.mNo}" onclick="fnReInsert(${memberSearch.mNo})" ></i></td>
				</c:if>
			</tr>
		 </c:forEach>
		</c:if>
			
		</tbody>
		<tfoot>
			<tr>
				<td colspan="9">${map.pageEntity}</td>			
			</tr>
		</tfoot>
	</table>
</div>


</body>
</html>