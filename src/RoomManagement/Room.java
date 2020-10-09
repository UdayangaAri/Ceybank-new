package RoomManagement;

public class Room {
	 protected int id;
	 protected String RoomNo;
	    protected String roomName;
	    
	    protected int roomType;
	    protected int blockID;
	    protected int branchID;
	    protected String roomStatus;
	    
	    
	public int getBranchID() {
			return branchID;
		}
		public void setBranchID(int branchID) {
			this.branchID = branchID;
		}
	public String getRoomStatus() {
			return roomStatus;
		}
		public void setRoomStatus(String roomStatus) {
			this.roomStatus = roomStatus;
		}
	public int getBlockID() {
			return blockID;
		}
		public void setBlockID(int blockID) {
			this.blockID = blockID;
		}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRoomNo() {
		return RoomNo;
	}
	public void setRoomNo(String roomNo) {
		RoomNo = roomNo;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	
	public int getRoomType() {
		return roomType;
	}
	public void setRoomType(int i) {
		this.roomType = i;
	}
		
}
