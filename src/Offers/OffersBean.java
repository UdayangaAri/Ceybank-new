package Offers;

import java.sql.Blob;

import javax.servlet.http.Part;

public class OffersBean {

	protected int id;
	protected int ImageID;
	protected String Status;
	protected Part image;
	protected String ImageDate;
	protected Blob Images;
	protected String exdate;
	
	
	
	public String getExdate() {
		return exdate;
	}
	public void setExdate(String exdate) {
		this.exdate = exdate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getImageID() {
		return ImageID;
	}
	public void setImageID(int imageID) {
		ImageID = imageID;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public Part getImage() {
		return image;
	}
	public void setImage(Part image) {
		this.image = image;
	}
	public String getImageDate() {
		return ImageDate;
	}
	public void setImageDate(String imageDate) {
		ImageDate = imageDate;
	}
	public Blob getImages() {
		return Images;
	}
	public void setImages(Blob images) {
		Images = images;
	}
	
	
}
