import jakarta.ejb.Startup;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.Set;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class Login
 */
@WebServlet(name = "ImageUpload", urlPatterns = {"/ImageUpload/*"})
@MultipartConfig()
@Startup
public class ImageUpload extends HttpServlet {
    private File localUploadDirectory;
    private int uploadId = 0;
    private ImageDAO dao = new ImageDAO();

    @Override
    public void init() {
        // Get the file location where it would be stored.
        // TODO: decide a location for this
        localUploadDirectory = Path.of(System.getProperty("java.io.tmpdir")).toFile();
        var context = getServletContext();
        Set<String> resourcePaths = getServletContext().getResourcePaths("/WEB-INF/premade-files");
        for (var s: resourcePaths) {
            System.err.println(s);
            try {
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            var realpath = Path.of(context.getRealPath(s));
        }
    }

    private File upload(InputStream inputStream, String filename) throws java.io.IOException {
        File uploaded = new File(localUploadDirectory, String.format("%s-%s-%s", uploadId, UUID.randomUUID(), filename));
        Files.copy(inputStream, uploaded.toPath(), StandardCopyOption.REPLACE_EXISTING);
        return uploaded;
    }

    private File retrieve(int id) {
        var filepath = dao.findByID(id);
        return filepath.map(image -> localUploadDirectory.toPath().resolve(image.getFilename()).toFile()).orElse(null);
    }

    /***
     *
     * @param request an {@link HttpServletRequest} object that contains the request the client has made of the servlet
     *
     * @param response an {@link HttpServletResponse} object that contains the response the servlet sends to the client
     *
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        var out = response.getWriter();
        out.println("<html>");
        out.println("hi");
        Set<String> resourcePaths = getServletContext().getResourcePaths("/WEB-INF/premade-files");
        for (var s: resourcePaths) {
            out.println(s);
            var realpath = Path.of(getServletContext().getRealPath(s));
        }
        out.println("</html>");
    }

    /***
     * Uploads the "file" to the OS's tmpdir.
     * @param request an {@link HttpServletRequest} object that contains the request the client has made of the servlet
     *
     * @param response an {@link HttpServletResponse} object that contains the response the servlet sends to the client
     *
     * @throws ServletException
     * @throws java.io.IOException
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {
        var filePart = request.getPart("file");

        if (filePart == null) {
            System.out.println("file null");
            return;
        }
        File uploaded = upload(filePart.getInputStream(), filePart.getSubmittedFileName());
        response.setContentType("text/plain");
        var out = response.getWriter();
        out.write(uploaded.getAbsolutePath());
    }
}