
import jakarta.persistence.*;

@Entity
@Table(name = "Image")
public class Image {
    @Id
    @Column(name = "ID")
    private Integer id;

    @Column(name = "filename")
    private String filename;

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFilename() {
        return this.filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
}
