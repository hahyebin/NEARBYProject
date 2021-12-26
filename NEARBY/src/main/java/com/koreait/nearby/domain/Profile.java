package com.koreait.nearby.domain;

public class Profile {

	private String id, content, pOrigin, pSaved, path;
	
	public Profile() {
		// TODO Auto-generated constructor stub
	}

	public Profile(String id, String content, String pOrigin, String pSaved, String path) {
		super();
		this.id = id;
		this.content = content;
		this.pOrigin = pOrigin;
		this.pSaved = pSaved;
		this.path = path;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getpOrigin() {
		return pOrigin;
	}

	public void setpOrigin(String pOrigin) {
		this.pOrigin = pOrigin;
	}

	public String getpSaved() {
		return pSaved;
	}

	public void setpSaved(String pSaved) {
		this.pSaved = pSaved;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "Profile [id=" + id + ", content=" + content + ", pOrigin=" + pOrigin + ", pSaved=" + pSaved + ", path="
				+ path + "]";
	}
	
	
	
	
}
