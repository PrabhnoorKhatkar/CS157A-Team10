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
import java.util.ArrayList;
import java.util.UUID;

/**
 * Servlet implementation class Login
 */
@WebServlet(name = "Upload", urlPatterns = {"/Upload/*"})
@MultipartConfig()
public class Upload extends HttpServlet {
    private File localUploadDirectory;
    private int uploadId = 0;

    @Override
    public void init() {
        // Get the file location where it would be stored.
        // TODO: decide a location for this
        localUploadDirectory = Path.of(System.getProperty("java.io.tmpdir")).toFile();
    }

    public File upload(InputStream inputStream, String filename) throws java.io.IOException {
        File uploaded = new File(localUploadDirectory, String.format("%s-%s-%s", uploadId, UUID.randomUUID(), filename);
        Files.copy(inputStream, uploaded.toPath(), StandardCopyOption.REPLACE_EXISTING);
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
        var out = response.getWriter();
    }
}