package Branches;

public class Branch {
	 protected int id;
	    protected String name;
	    protected String DisplayName;
	    protected String Address;
	    protected String Phone1;
	    protected String Phone2;
	    protected String Email;
	   
	    public String getStatus() {
			return Status;
		}
		public void setStatus(String status) {
			Status = status;
		}
		protected String Status;
	    
	    public String getFax() {
			return Fax;
		}
		public void setFax(String fax) {
			Fax = fax;
		}
		protected String Fax;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getDisplayName() {
			return DisplayName;
		}
		public void setDisplayName(String displayName) {
			DisplayName = displayName;
		}
		public String getAddress() {
			return Address;
		}
		public void setAddress(String address) {
			Address = address;
		}
		public String getPhone1() {
			return Phone1;
		}
		public void setPhone1(String phone1) {
			Phone1 = phone1;
		}
		public String getPhone2() {
			return Phone2;
		}
		public void setPhone2(String phone2) {
			Phone2 = phone2;
		}
		public String getEmail() {
			return Email;
		}
		public void setEmail(String email) {
			Email = email;
		}
	    
	    
}
