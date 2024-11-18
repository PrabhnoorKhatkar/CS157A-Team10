import jakarta.ejb.Startup;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.time.Instant;
import java.util.Date;
import java.util.Set;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class Login
 */
@WebServlet(name = "ImageUpload", urlPatterns = {"/ImageUpload/*"}, loadOnStartup = 1)
@MultipartConfig()
public class ImageUpload extends HttpServlet {
    private File localUploadDirectory;
    private final ImageDAO dao = new ImageDAO();

    @Override
    public void init() {
        // Get the file location where it would be stored.
        localUploadDirectory = Path.of(System.getProperty("java.io.tmpdir"), "ArtAuction", Long.toString(Instant.now().getEpochSecond())).toFile();
        var localDirMade = localUploadDirectory.mkdirs();
        if (!localDirMade) return;

        System.err.printf("Storing images in: %s%n", localUploadDirectory);
        var context = getServletContext();
        Set<String> resourcePaths = context.getResourcePaths("/myapp/images");
        System.err.println("initial images:");
        // We assume that the files listed in the database are also in sorted order
        var sortedPaths = resourcePaths.stream().sorted().toList();
        for (var s: sortedPaths) {
            var realpath = Path.of(context.getRealPath(s));
            try (var stream = new FileInputStream(realpath.toFile())) {
                var filename = realpath.getFileName().toString();
                var uploaded = upload(stream, filename);
                System.err.printf("%s%n", uploaded);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private File upload(InputStream inputStream, String filename) throws java.io.IOException {
        File uploaded = new File(localUploadDirectory, filename);
        Files.copy(inputStream, uploaded.toPath(), StandardCopyOption.REPLACE_EXISTING);
        return uploaded;
    }

    private File retrieve(int id) {
        var img = dao.findByID(id);
        if (img == null) {
            return null;
        }
        return Path.of(localUploadDirectory.getAbsolutePath(), img.getFilename()).toFile();
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
        String idStr = request.getPathInfo().substring(1);
        int id = Integer.parseInt(idStr);
        File file = retrieve(id);
        if (file == null) {return;}
        response.setContentType(Files.probeContentType(file.toPath()));
        response.setContentLength((int) file.length());
        response.getOutputStream().write(Files.readAllBytes(file.toPath()));
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