import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.nio.file.Path;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Stateless
public class ImageDAO {
    @PersistenceContext
    private EntityManager em;

    public List<Image> getAllImages() {
        return em.createQuery("SELECT i FROM Image i", Image.class).getResultList();
    }

    public Optional<Image> findByID(int id) {
        return Optional.ofNullable(em.find(Image.class, id));
    }
}