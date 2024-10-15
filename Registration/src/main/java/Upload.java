import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

/**
 * Servlet implementation class Login
 */
@WebServlet(name="Upload", urlPatterns = {"/Upload/*"})
@MultipartConfig()
public class Upload extends HttpServlet {
    private File localUploadDirectory;

    @Override
    public void init() {
        // Get the file location where it would be stored.
        localUploadDirectory = Path.of(System.getProperty("user.home")).toFile();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filename = request.getPathInfo().substring(1);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Transfer-Encoding", "binary");
        Path path = localUploadDirectory.toPath().resolve(filename);
        Files.copy(path, response.getOutputStream());
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {
        var filePart = request.getPart("file");

        if (filePart == null) {
            System.out.println("file null");
            return;
        }

        File uploaded = new File(localUploadDirectory, filePart.getSubmittedFileName());
        Files.copy(filePart.getInputStream(), uploaded.toPath(), StandardCopyOption.REPLACE_EXISTING);
        // format is /Registration/Upload/{filename}
        response.sendRedirect(String.format("%s", filePart.getSubmittedFileName()));
        System.out.println(uploaded.toPath());
    }
}