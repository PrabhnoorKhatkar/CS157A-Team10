package ArtAuction;

public class Image {
    private int imageId;
    private String filename;
    private int uploaderId;

    public Image(int imageId, String filename, int uploaderId) {
        this(filename, uploaderId);
        this.imageId = imageId;
    }

    public Image(String filename, int uploaderId) {
        this.filename = filename;
        this.uploaderId = uploaderId;
    }

    public Image(Integer imageId) {
        this.imageId = imageId;
    }

    public Image() {

    }


    public int getImageId() {
        return this.imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public String getFilename() {
        return this.filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public int getUploaderId() {
        return this.uploaderId;
    }

    public void setUploaderId(int uploaderId) {
        this.uploaderId = uploaderId;
    }
}
