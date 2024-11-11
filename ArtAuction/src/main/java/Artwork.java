
public class Artwork {
    private Integer id;
    private String title;
    private String description;
    private String artist;

    public Artwork() {
        this.artist = "<no-artist>";
        this.description = "<no-description>";
        this.id = -1;
        this.title = "<no-title>";
    }
    public Artwork(Integer id, String description, String artist, String title) {
        this.artist = artist;
        this.description = description;
        this.id = id;
        this.title = title;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getArtist() {
        return this.artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }
}
