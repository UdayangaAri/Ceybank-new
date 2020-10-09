package RoomReservation;

public class Rooms {

	protected String Checkin;
	protected String Checkout;

	protected String Branch;
	protected String Block;
	protected String RoomNo;
	protected String MealPlan;
	protected String Price;

	protected String Guestname;
	protected String GuestMobile;
	protected String GuestNIC;
	protected String GuestEmail;
	protected String GuestType;
	protected String PF;

	public String getGuestname() {
		return Guestname;
	}

	public String getBranch() {
		return Branch;
	}

	public void setBranch(String branch) {
		Branch = branch;
	}

	public String getPrice() {
		return Price;
	}

	public void setPrice(String price) {
		Price = price;
	}

	public String getPF() {
		return PF;
	}

	public void setPF(String pF) {
		PF = pF;
	}

	public void setGuestname(String guestname) {
		Guestname = guestname;
	}

	public String getGuestMobile() {
		return GuestMobile;
	}

	public void setGuestMobile(String guestMobile) {
		GuestMobile = guestMobile;
	}

	public String getGuestNIC() {
		return GuestNIC;
	}

	public void setGuestNIC(String guestNIC) {
		GuestNIC = guestNIC;
	}

	public String getGuestEmail() {
		return GuestEmail;
	}

	public void setGuestEmail(String guestEmail) {
		GuestEmail = guestEmail;
	}

	public String getGuestType() {
		return GuestType;
	}

	public void setGuestType(String guestType) {
		GuestType = guestType;
	}

	public String getBlock() {
		return Block;
	}

	public void setBlock(String block) {
		Block = block;
	}

	public String getRoomNo() {
		return RoomNo;
	}

	public void setRoomNo(String roomNo) {
		RoomNo = roomNo;
	}

	public String getMealPlan() {
		return MealPlan;
	}

	public void setMealPlan(String mealPlan) {
		MealPlan = mealPlan;
	}

	public String getCheckin() {
		return Checkin;
	}

	public void setCheckin(String checkin) {
		Checkin = checkin;
	}

	public String getCheckout() {
		return Checkout;
	}

	public void setCheckout(String checkout) {
		Checkout = checkout;
	}

}
