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
import java.util.ArrayList;

/**
 * Servlet implementation class Login
 */
@WebServlet(name = "Upload", urlPatterns = {"/Upload/*"})
@MultipartConfig()
public class Upload extends HttpServlet {
    private File localUploadDirectory;
    private int uploadId = 0;
    private final ArrayList<Path> filepaths = new ArrayList<>();

    @Override
    public void init() {
        // Get the file location where it would be stored.
        // TODO: decide a location for this
        localUploadDirectory = Path.of(System.getProperty("java.io.tmpdir")).toFile();
        uploadId = 0;
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getPathInfo().substring(1).isEmpty()) {
            request.setAttribute("uploaded", filepaths);
            request.getRequestDispatcher("/WEB-INF/list-uploaded.jsp").forward(request, response);
            response.sendRedirect("/");
        }
        int fileId = Integer.parseInt(request.getPathInfo().substring(1));
        response.setContentType("image/png");
        Path path = filepaths.get(fileId);
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

        File uploaded = new File(localUploadDirectory, uploadId + "-" + filePart.getSubmittedFileName());
        Files.copy(filePart.getInputStream(), uploaded.toPath(), StandardCopyOption.REPLACE_EXISTING);

        // format is /Registration/Upload/{filename}
        System.out.println(uploaded.toPath());
        var out = response.getWriter();
        out.println(uploadId);
        filepaths.add(uploaded.toPath());
        uploadId++;
    }
}