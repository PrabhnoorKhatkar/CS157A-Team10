package artauction.image;

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
import java.security.SecureRandom;
import java.util.Set;

/**
 * Servlet implementation class Login
 */
@WebServlet(name = "ImageUpload", urlPatterns = {"/Uploads/*"}, loadOnStartup = 1)
@MultipartConfig()
public class ImageUploader extends HttpServlet {
    private static File localUploadDirectory;
    private static final ImageDAO dao = new ImageDAO();
    private static final SecureRandom random = new SecureRandom();
    private static File placeholder;

    @Override
    public void init() {
        // Get the file location where it would be stored.
        localUploadDirectory = Path.of(System.getProperty("java.io.tmpdir"), "artauction").toFile();
        localUploadDirectory.mkdirs();

        System.err.printf("Storing images in: %s%n", localUploadDirectory);
        var context = getServletContext();
        placeholder = new File(context.getRealPath("/myapp/temporary-pic.jpg"));
        Set<String> resourcePaths = context.getResourcePaths("/myapp/images");
        System.err.println("Uploaded initial images:");
        // We assume that the files listed in the database are also in sorted order
        var sortedPaths = resourcePaths.stream().sorted().toList();
        for (var s: sortedPaths) {
            var realpath = Path.of(context.getRealPath(s));
            try (var stream = new FileInputStream(realpath.toFile())) {
                var filename = realpath.getFileName().toString();
                var uploaded = upload(stream, filename);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    /**
     * @param inputStream The stream of contents to be uploaded into a file.
     * @param filename The name of the file where the contents should go.
     * @return The File on-disk where the contents were uploaded to.
     * @throws java.io.IOException If copying fails.
     */
    public static File upload(InputStream inputStream, String filename) throws java.io.IOException {
        File uploaded = new File(localUploadDirectory, filename);
        Files.copy(inputStream, uploaded.toPath(), StandardCopyOption.REPLACE_EXISTING);
        System.err.println("Uploaded: " + uploaded);
        return uploaded;
    }

    public static String salt(int length) {
        String saltChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "abcdefghijklmnopqrstuvwxyz" + "0123456789";
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < 8; i++) {
            sb.append(saltChars.charAt(random.nextInt(saltChars.length())));
        }
        return sb.toString();
    }

    /**
     * @param id The ID of the Image we want to retrieve.
     * @return A file representing the Image on-disk, or null if the ID is invalid.
     */
    public static File retrieveById(int id) {
        var img = dao.findByID(id);
        if (img == null) {
            return null;
        }
        return Path.of(localUploadDirectory.getAbsolutePath(), img.getFilename()).toFile();
    }
    public static File retrieveByName(String filename) {
        var img = dao.findByFilename(filename);
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
        File file;
        try {
            int id = Integer.parseInt(idStr);
            file = retrieveById(id);
        } catch (NumberFormatException e) {
            file = retrieveByName(idStr);
        }
        if (file == null) {
            System.err.printf("File %s was not found, using placeholder%n", idStr);
            file = placeholder;
        }
        response.setContentType(Files.probeContentType(file.toPath()));
        response.setContentLength((int) file.length());
        response.getOutputStream().write(Files.readAllBytes(file.toPath()));
    }

//    /***
//     * Uploads the "file" to the OS's tmpdir.
//     * @param request an {@link HttpServletRequest} object that contains the request the client has made of the servlet
//     *
//     * @param response an {@link HttpServletResponse} object that contains the response the servlet sends to the client
//     *
//     * @throws ServletException
//     * @throws java.io.IOException
//     */
//    @Override
//    public void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, java.io.IOException {
////        var filePart = request.getPart("file");
////        if (filePart == null) {
////            System.out.println("file null");
////            return;
////        }
////        File uploaded = upload(filePart.getInputStream(), filePart.getSubmittedFileName());
//    }
}