package com.weaving.biz.room;

public class RoomVO {
	private int roomId;
	private String roomName;
	private String roomLoc;
	private String roomSize;
	private String roomMax;
	private String description;

	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomLoc() {
		return roomLoc;
	}
	public void setRoomLoc(String roomLoc) {
		this.roomLoc = roomLoc;
	}
	public String getRoomSize() {
		return roomSize;
	}
	public void setRoomSize(String roomSize) {
		this.roomSize = roomSize;
	}
	public String getRoomMax() {
		return roomMax;
	}
	public void setRoomMax(String roomMax) {
		this.roomMax = roomMax;
	}
	@Override
	public String toString() {
		return "RoomVO [roomId=" + roomId + ", roomName=" + roomName + ", roomLoc=" + roomLoc + ", roomSize=" + roomSize
				+ ", roomMax=" + roomMax + ", description=" + description + "]";
	}
}
