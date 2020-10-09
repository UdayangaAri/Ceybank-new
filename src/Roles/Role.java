package Roles;

public class Role {

	 protected int id;
	    protected String role;
	    protected String RoleDesc;
	    
	    public Role() {
	    }
	 
	    public Role(int id) {
	        this.id = id;
	    }
	    
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getRole() {
			return role;
		}
		public void setRole(String role) {
			this.role = role;
		}
		public String getRoleDesc() {
			return RoleDesc;
		}
		public void setRoleDesc(String roleDesc) {
			RoleDesc = roleDesc;
		}
	    
	    
	   
}
