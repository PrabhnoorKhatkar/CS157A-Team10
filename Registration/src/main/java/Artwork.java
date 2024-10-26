import java.awt.image.BufferedImage;

public class Artwork 
{

	
	private String title;
	private String duration;
	private String result;
	private String reserve;
	private float startingPrice;
	private String description;
	private BufferedImage image;
	

	
	
	public Artwork(String title, String duration, String result, String reserve, float startingPrice, String description,
			BufferedImage image) {
		super();
		this.title = title;
		this.duration = duration;
		this.result = result;
		this.reserve = reserve;
		this.startingPrice = startingPrice;
		this.description = description;
		this.image = image;
	}
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getReserve() {
		return reserve;
	}
	public void setReserve(String reserve) {
		this.reserve = reserve;
	}
	public float getStartingPrice() {
		return startingPrice;
	}
	public void setStartingPrice(float startingPrice) {
		this.startingPrice = startingPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public BufferedImage getImage() {
		return image;
	}
	public void setImage(BufferedImage image) {
		this.image = image;
	}
	
	
	
	
}
