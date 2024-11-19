package ArtAuction;

public class Image {
    private Integer imageId;
    private String filename;
    private Integer uploaderId;

    public Image(Integer imageId) {
        this.imageId = imageId;
    }
    public Image(String filename, Integer uploaderId) {
        this.filename = filename;
        this.uploaderId = uploaderId;
    }

    public Image() {

    }


    public Integer getImageId() {
        return this.imageId;
    }

    public void setImageId(Integer imageId) {
        this.imageId = imageId;
    }

    public String getFilename() {
        return this.filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Integer getUploaderId() {
        return this.uploaderId;
    }

    public void setUploaderId(Integer uploaderId) {
        this.uploaderId = uploaderId;
    }
}
