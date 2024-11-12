
public class Artwork {
    private Integer id;
    private String title;
    private String description;
    private String artist;
    private Integer duration;
    // TODO private ImageUpload image;

    public Artwork(Integer id, String title, String description, String artist, Integer duration) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.artist = artist;
        this.duration = duration;
    }
    public Artwork(Integer id, String title, String description, String artist) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.artist = artist;
    }

    public Artwork(String title, String description, String artist) {
        this.title = title;
        this.description = description;
        this.artist = artist;
    }
    
    
    
    public Artwork() {
    }

    public Integer getId() {
        return id;
    }
   
    public void setId(Integer id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getArtist() {
        return artist;
    }
    public void setArtist(String artist) {
        this.artist = artist;
    }
    public Integer getDuration() {
        return duration;
    }
    public void setDuration(Integer duration) {
        this.duration = duration;
    }
        
}
