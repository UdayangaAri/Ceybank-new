package Log;

public class Log {
	
	 	protected int id;
	 	protected String Edited_unit;
	    protected String edited_by;
	    protected String edit_status;
	    protected String edited_time;
	    protected String previous_data;
	    
	    
	    
		public String getEdited_unit() {
			return Edited_unit;
		}
		public void setEdited_unit(String edited_unit) {
			Edited_unit = edited_unit;
		}
		public String getEdit_status() {
			return edit_status;
		}
		public void setEdit_status(String edit_status) {
			this.edit_status = edit_status;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getEdited_by() {
			return edited_by;
		}
		public void setEdited_by(String edited_by) {
			this.edited_by = edited_by;
		}
		public String getEdited_time() {
			return edited_time;
		}
		public void setEdited_time(String edited_time) {
			this.edited_time = edited_time;
		}
		public String getPrevious_data() {
			return previous_data;
		}
		public void setPrevious_data(String previous_data) {
			this.previous_data = previous_data;
		}
	    
}
