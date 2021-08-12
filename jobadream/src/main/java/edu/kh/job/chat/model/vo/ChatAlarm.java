package edu.kh.job.chat.model.vo;

public class ChatAlarm {
	private int alarmNo;
	private String alarmMessage;
	private String alarmStatus;
	private int memberNo;
	private String memberName;
	private int chatRoomNo;
	
	
	public ChatAlarm() {}

	public int getAlarmNo() {
		return alarmNo;
	}

	public void setAlarmNo(int alarmNo) {
		this.alarmNo = alarmNo;
	}

	public String getAlarmMessage() {
		return alarmMessage;
	}

	public void setAlarmMessage(String alarmMessage) {
		this.alarmMessage = alarmMessage;
	}

	public String getAlarmStatus() {
		return alarmStatus;
	}

	public void setAlarmStatus(String alarmStatus) {
		this.alarmStatus = alarmStatus;
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
	

	public int getChatRoomNo() {
		return chatRoomNo;
	}

	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}

	@Override
	public String toString() {
		return "ChatAlarm [alarmNo=" + alarmNo + ", alarmMessage=" + alarmMessage + ", alarmStatus=" + alarmStatus
				+ ", memberNo=" + memberNo + ", memberName=" + memberName + ", chatRoomNo=" + chatRoomNo + "]";
	}

	
}
