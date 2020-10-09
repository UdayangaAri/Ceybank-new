package News_Updates;

import java.sql.Blob;

import javax.servlet.http.Part;

public class NewsBean {

	protected int id;
	protected String Title;
	protected String Description;
	
	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
