package block_Register;

public class block {

	
	protected int id;
	protected int Location;
    protected String Block_name;
    protected String Block_status;
    
	public int getLocation() {
		return Location;
	}
	public void setLocation(int branchID) {
		Location = branchID;
	}
	public String getBlock_name() {
		return Block_name;
	}
	public void setBlock_name(String block_name) {
		Block_name = block_name;
	}
	public String getBlock_status() {
		return Block_status;
	}
	public void setBlock_status(String block_status) {
		Block_status = block_status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
