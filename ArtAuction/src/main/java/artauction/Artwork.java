package artauction;

import artauction.image.Image;

import java.util.ArrayList;
import java.util.List;

public class Artwork {
    private Integer id;
    private String title;
    private String description;
    private String artist;
    private List<Image> images = new ArrayList<>();
    private Auction auctionDetails;

    public Artwork(Integer id, String title, String description, String artist, Auction auctionDetails) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.artist = artist;
        this.auctionDetails = auctionDetails;
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

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
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

    public Auction getAuctionDetails() {
        return auctionDetails;
    }

    public void setAuctionDetails(Auction auctionDetails) {
        this.auctionDetails = auctionDetails;
    }

}
