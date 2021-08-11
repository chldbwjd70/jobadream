package edu.kh.job.chat.model.vo;

import java.sql.Timestamp;

public class ChatRoom {
	
	private int chatRoomNo;
	private String status;
	
	private int memberNo;
	private String memberName;
	
	private int boardNo;
	private String boardTitle;
	
	public ChatRoom() {}

	public int getChatRoomNo() {
		return chatRoomNo;
	}

	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	@Override
	public String toString() {
		return "ChatRoom [chatRoomNo=" + chatRoomNo + ", status=" + status + ", memberNo=" + memberNo + ", memberName="
				+ memberName + ", boardNo=" + boardNo + ", boardTitle=" + boardTitle + "]";
	}


}
