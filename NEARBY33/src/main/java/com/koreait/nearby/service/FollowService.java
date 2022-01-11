package com.koreait.nearby.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.koreait.nearby.domain.Follow;

@Service
public interface FollowService {
	
	public Map<String, Object> following(Follow follow, HttpSession session);
	public Map<String, Object> unfollowing(Follow follow, HttpSession session);
	public List<Follow> selectFollowingIdById(HttpSession session);
	public List<Follow> selectFollowedIdById(HttpSession session);
	public Map<String, Object> checkFollow(Follow follow, HttpSession session);
}
