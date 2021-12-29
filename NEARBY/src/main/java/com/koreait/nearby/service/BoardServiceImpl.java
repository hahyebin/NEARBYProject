package com.koreait.nearby.service;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.nearby.domain.Board;
import com.koreait.nearby.domain.Likes;
import com.koreait.nearby.domain.Member;
import com.koreait.nearby.repository.BoardRepository;
import com.koreait.nearby.repository.LikesRepository;

public class BoardServiceImpl implements BoardService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 게시글 전체 목록
	@Override
	public List<Board> selectBoardList() {
		BoardRepository boardRepository = sqlSession.getMapper(BoardRepository.class);	
		logger.info("보드 전체보기 : "+boardRepository.selectListBoard());
		return boardRepository.selectListBoard();
	}


	// 게시글 등록하기
	@Override
	public void insertBoard(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
//		Member member = (Member)multipartRequest.getSession().getAttribute("loginUser");
//		String id = member.getId();
		
		String id =multipartRequest.getParameter("id");
	
		String content = multipartRequest.getParameter("content");
		String location = multipartRequest.getParameter("location");
		
		Board board = new Board();
		
		board.setId(id);
		board.setContent(content);
		board.setLocation(location);
		board.setIp(multipartRequest.getRemoteAddr());
		
		
		try {
			MultipartFile file = multipartRequest.getFile("file");
			if(file != null && !file.isEmpty() ) {
		
				String[] video = {"mp4", "mpeg", "avi", "mov"};
				String origin = file.getOriginalFilename();
				String extName = origin.substring(origin.lastIndexOf("."));
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");
				String saved = uuid + extName;
				
				String sep = Matcher.quoteReplacement(File.separator);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String path = "resources"+sep + "upload" + sep + id+sep + sdf.format(new Date()).replaceAll("-", sep);
				String realPath = multipartRequest.getServletContext().getRealPath(path);
				
				logger.info("path: "+ path);
				logger.info("realpath: "+realPath);  // 루트 확인용
				
				File dir = new File(realPath);
				if ( !dir.exists() ) dir.mkdirs();
				
				File uploadFile = null;
				
				board.setPath(path);
				board.setOrigin(origin);
			
				
				// 비디오 확장자 saved 네임에 "video" 붙이기!
				for( int i =0; i<video.length; i++) {
					// System.out.println(saved.contains(video[i]));
				 	if(saved.contains(video[i])) {
						saved = "video" + saved;
						uploadFile = new File(realPath, saved); 
						board.setSaved(saved);
					} else {
						 uploadFile = new File(realPath, saved); 
						board.setSaved(saved);
					}
				}
				file.transferTo(uploadFile);
			}
			else {
				board.setPath("");
				board.setOrigin("");
				board.setSaved("");
			} 
			logger.info(board.toString());
	} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 삽입확인용
		//logger.info(board.toString());
		
		BoardRepository boardRepository = sqlSession.getMapper(BoardRepository.class);	
		int result = boardRepository.insertBoard(board);
		
		try {
			   response.setContentType("text/html; charset=UTF-8");
			   PrintWriter out = response.getWriter();
 			
 			if (result > 0) {
 				out.println("<script>");
 				out.println("alert('등록하겠습니다')");
 				out.println("location.href='/nearby/board/boardList'");
 				out.println("</script>");
 				out.close();
 			} else {
 				out.println("<script>");
 				out.println("alert('게시글 등록에 실패했습니다.')");
 				out.println("history.back()");
 				out.println("</script>");
 				out.close();
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
//	  	message(result, response, "게시글을 등록하겠습니다.", "게시글 등록에 실패했습니다.", "/nearby/board/boardList");
	}
	
	
	// 게시글 상세보기
	@Override
	public Board selectBoardByNo(Long bNo) {
		BoardRepository boardRepository = sqlSession.getMapper(BoardRepository.class);	
		logger.info("보드 상세보기 : "+boardRepository.selectBoardByNo(bNo));
		Board board = boardRepository.selectBoardByNo(bNo);
		return board;
	}
	
	
	// 게시글 수정하기
	@Override
	public void updateBoard(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {

		// logger.info(multipartRequest.getParameter("bNo"));
		String id = multipartRequest.getParameter("id");
		Board board = new Board();
		board.setId(id);
		board.setbNo(Long.parseLong(multipartRequest.getParameter("bNo")));
		board.setContent(multipartRequest.getParameter("content"));
		board.setLocation(multipartRequest.getParameter("location"));
		System.out.println("conent 수정 ? "+ multipartRequest.getParameter("content"));
	
try {
	MultipartFile file = multipartRequest.getFile("file");
		System.out.println(multipartRequest.getFile("file"));
		
		if( multipartRequest.getParameter("path").isEmpty() == false ) {   // path가 빈값이 아니라는건 기존에 이미지/비디오가 있었다는 의미다. 때문에 없는 경우엔 새로 만들고, 아니면 원래  path, saved, origin을 board에 다시 넣는다!!!
			
			if(file != null && !file.isEmpty() ) {   // file이 있으면 
					String[] video = {"mp4", "mpeg", "avi", "mov"};
					String origin = file.getOriginalFilename();
					System.out.println("origin " + origin);
					String extName = origin.substring(origin.lastIndexOf("."));
					String uuid = UUID.randomUUID().toString().replaceAll("-", "");
					String saved = uuid + extName;
					
					String sep = Matcher.quoteReplacement(File.separator);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String path = "resources"+sep + "upload" + sep + id+sep + sdf.format(new Date()).replaceAll("-", sep);
					String realPath = multipartRequest.getServletContext().getRealPath(path);
					
					logger.info("path: "+ path);
					logger.info("realpath: "+realPath);  // 루트 확인용
					
					File dir = new File(realPath);
					if ( !dir.exists() ) dir.mkdirs();
					
					File uploadFile = null;
					
					board.setPath(path);
					board.setOrigin(origin);
					
					// 비디오 확장자 saved 네임에 "video" 붙이기!
					for( int i =0; i<video.length; i++) {
						// System.out.println(saved.contains(video[i]));
						if(saved.contains(video[i])) {
							saved = "video" + saved;
							uploadFile = new File(realPath, saved); 
							board.setSaved(saved);
						} else {
							uploadFile = new File(realPath, saved); 
							board.setSaved(saved);
						}
					}
					file.transferTo(uploadFile);
			} else {
			
				board.setPath("");
				board.setOrigin("");
				board.setSaved("");
			} 
			
	} else {		
//			   System.out.println(multipartRequest.getParameter("path"));
//			   System.out.println(multipartRequest.getParameter("saved"));
//			   System.out.println(multipartRequest.getParameter("origin"));
		
				board.setPath(multipartRequest.getParameter("path"));
				board.setSaved(multipartRequest.getParameter("saved"));
				board.setOrigin(multipartRequest.getParameter("origin"));					
			
	}
			
	    } catch (Exception e) {
			e.printStackTrace();
		}
		
		// 삽입확인용
		BoardRepository boardRepository = sqlSession.getMapper(BoardRepository.class);	
		int result = boardRepository.updateBoard(board);	
		logger.info("수정되었닝" + board.toString());
		message(result, response, "수정성공", "수정실패",  "/nearby/board/boardList");
	}
	
	
	// 게시글 삭제하기
	@Override
	public void deleteBoard(HttpServletRequest request, HttpServletResponse response) {
		BoardRepository boardRepository = sqlSession.getMapper(BoardRepository.class);
	    Long bNo = Long.parseLong(request.getParameter("bNo"));
	    Member member = (Member)request.getSession().getAttribute("loginUser");
	    String id = member.getId();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("bNo", bNo);
        map.put("id", id);
		int result = boardRepository.deleteBoard(map);
		
		
		try {
			   response.setContentType("text/html; charset=UTF-8");
			   PrintWriter out = response.getWriter();
			
			if (result > 0) {
				out.println("<script>");
				out.println("alert('삭제하겠습니다')");
				out.println("location.replace('/nearby/board/boardList')");
				out.println("</script>");
				out.close();
			} else {
				out.println("<script>");
				out.println("alert('게시글 삭제에 실패했습니다.')");
				out.println("history.back()");
				out.println("</script>");
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	//	message(result, response, "삭제성공.", "삭제실패", "/nearby/board/boardList");
	}
	
	
	
	// 좋아요
	@Override
	public Board likes(Likes likes, HttpSession session) {
		BoardRepository boardRepository = sqlSession.getMapper(BoardRepository.class);	 // board db연결
		System.out.println("-----------board 좋아요------------");
		Board board = new Board();
		board.setbNo(likes.getbNo());
		
		int likeCheackBoard = boardRepository.boardLike(board);  //  게시판 좋아요 + 1
		System.out.println(" 게시판 좋아요 + 1 : "+likeCheackBoard);
		
		LikesRepository likesRepository = sqlSession.getMapper(LikesRepository.class); // 좋아요 db연결
		int likeTBLinsert = likesRepository.likeInsert(likes);
		System.out.println("라이크테이블 0으로 초기화 하는 인서트 결과 : " + likeTBLinsert);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bNo",likes.getbNo() );
		map.put("id", likes.getId());
		if( likeTBLinsert == 1 ) {  // 만약 인서트 성공하면 likeCheck = 1로 update하기  +  업뎃된 총 보드의 하트 수 갖고오기
			
			int likeTBLUpdate = likesRepository.likeCheck(map);
			System.out.println("인서트후 LikeCheck 1? " + likeTBLUpdate);
			  if( likeTBLUpdate == 1 ) {
				  board = boardRepository.boardLikesCount(board);
				  System.out.println("board의 좋아요 + 1 한 결과 갖고오기 " + board.getLikes());
			  }
		}
				return board;
	}
	
	
	// 좋아요 취소하기
	@Override
	public Board likesCancel(Likes likes, HttpSession session) {
		System.out.println("-----------board 좋아요 취소------------");
        BoardRepository boardRepository = sqlSession.getMapper(BoardRepository.class);	 // board db연결
		
		Board board = new Board();
		board.setbNo(likes.getbNo());
		
		int likeCancelBoard = boardRepository.boardLikeCancel(board);  //  게시판 좋아요 - 1
		System.out.println(" 게시판 좋아요 취소 - 1 : "+likeCancelBoard);
		
		LikesRepository likesRepository = sqlSession.getMapper(LikesRepository.class); // 좋아요 db연결
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bNo",likes.getbNo() );
		map.put("id", likes.getId());
		
			int likeCancelTBLUpdate = likesRepository.likeCheckCancel(map);
			System.out.println("likeCheck 0? " +likeCancelTBLUpdate );
			  if( likeCancelTBLUpdate == 1 ) {
				  board = boardRepository.boardLikesCount(board);
				  System.out.println("board 취소 한 결과   " + board.getLikes());
			  }
			
				return board;
	}
	
	
	
	// 관리자 지역별 게시글 수 보기 
	@Override
	public Map<String, Object> adminBoardList() {
		 BoardRepository boardRepository = sqlSession.getMapper(BoardRepository.class);
		 List<Board> list = boardRepository.adminBoardList();
		 System.out.println(list.toString());
	    System.out.println(list.get(0).getLocation());
	    String fullLocation = "";
	    int seoul =0; int incheon=0; int gyeonggi = 0; int busan=0; int daegu=0; int daejun=0; int ulsan=0; int gwangju=0;
	    int sejong=0; int gangwon=0; int chungcheongbuk=0; int chungcheongnam=0; int gyeongsangbuk=0; int gyeongsangnam=0; int jeollanam=0; int jeollabuk=0; int jeju = 0;
	    for(int i=0; i<list.size(); i++) {
	    	System.out.println(list.get(i).getLocation());   // 서울특별시 마포구 대흥동   서울특별시 마포구 대흥동   
	    	fullLocation = list.get(i).getLocation();          // "서울특별시", "인천광역시", "부산광역시", "대구광역시", "대전광역시","울산광역시","광주광역시","세종특별자치시", "강원도", "경기도", "충청북도",
	                                                          //   "충청남도","경상북도","경상남도", "전라남도","전라북도","제주특별자치도"
	    	if ( fullLocation.contains("서울특별시")){
	    		seoul++;  
	    	} else if ( fullLocation.contains("인천광역시")){
	    		incheon++;
	    	} else if ( fullLocation.contains("부산광역시")){
	    		busan++;
	    	} else if ( fullLocation.contains("대구광역시")){
	    		daegu++;
	    	}else if ( fullLocation.contains("대전광역시")){
	    		daejun++;
	    	}else if ( fullLocation.contains("울산광역시")){
	    		ulsan++;
	    	}else if ( fullLocation.contains("광주광역시")){
	    		gwangju++;
	    	}else if ( fullLocation.contains("세종특별자치시")){
	    		sejong++;
	    	}else if ( fullLocation.contains("강원도")){
	    		gangwon++;
	    	}else if ( fullLocation.contains("경기도")){
	    		gyeonggi++;
	    	}else if ( fullLocation.contains("충청북도")){
	    		chungcheongbuk++;
	    	}else if ( fullLocation.contains("충청남도")){
	    		chungcheongnam++;
	    	}else if ( fullLocation.contains("경상북도")){
	    		gyeongsangbuk++;
	    	}else if ( fullLocation.contains("경상남도")){
	    		gyeongsangnam++;
	    	}else if ( fullLocation.contains("전라남도")){
	    		jeollanam++;
	    	}else if ( fullLocation.contains("전라북도")){
	    		jeollabuk++;
	    	}else if ( fullLocation.contains("제주특별자치도")){
	    		jeju++;
	    	}    
	    }
	     Map<String, Object> map = new HashMap<String, Object>();
	     map.put("seoul",seoul);   map.put("incheon",incheon);   map.put("gyeonggi",gyeonggi);  map.put("busan",busan);  map.put("daegu",daegu);
	     map.put("daejun",daejun);  map.put("ulsan",ulsan);   map.put("gwangju",gwangju);    map.put("sejong",sejong);   map.put("gangwon",gangwon);  
	     map.put("chungcheongbuk",chungcheongbuk); map.put("chungcheongnam",chungcheongnam); map.put("gyeongsangbuk",gyeongsangbuk); map.put("gyeongsangnam",gyeongsangnam);
	     map.put("jeollanam",jeollanam);   map.put("jeollabuk",jeollabuk);   map.put("jeju",jeju);
		return map;
	}
	
}