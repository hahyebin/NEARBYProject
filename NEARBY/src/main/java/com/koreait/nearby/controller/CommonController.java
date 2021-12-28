package com.koreait.nearby.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.koreait.nearby.domain.Member;
import com.koreait.nearby.service.BoardService;
import com.koreait.nearby.service.MemberService;

@Controller
public class CommonController {

	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	// 프로필사진 변경 후 마이페이지 이동
	@GetMapping("board/updateProfilePicture")
	public String updateProfilePicture(Member member) {
		return "redirect:boardList";
	}
	
	
	 private BoardService bService;
	  private MemberService mService;
	
	  public  CommonController(BoardService bService, MemberService mService) {
		super();
		this.bService = bService;
		this.mService = mService;
	}


    // 관리자
	@GetMapping("admin/admin")
	  public String admin(Model model) {
		   model.addAttribute("board", bService.selectBoardList());
		   model.addAttribute("member", mService.selectMemberList());
		   model.addAttribute("memberMen", mService.selectMemberMen());
		   model.addAttribute("memberWomen", mService.selectMemberWomen());
		   model.addAttribute("memberNoGender", mService.selectMemberNoGender());
		   model.addAttribute("memberCreatedDay", mService.selectMemberCreatedDay());
		  return "admin/admin";
	  }
	
	// 관리자가 전체 유저보는 페이지
	@GetMapping("admin/memberList")
	public String memberList(Model model){
		 model.addAttribute("member", mService.selectMemberList());
		   model.addAttribute("memberMen", mService.selectMemberMen());
		   model.addAttribute("memberWomen", mService.selectMemberWomen());
		   model.addAttribute("memberNoGender", mService.selectMemberNoGender());
		   model.addAttribute("memberCreatedDay", mService.selectMemberCreatedDay());
		  return "admin/memberManage";
	}
	
}
