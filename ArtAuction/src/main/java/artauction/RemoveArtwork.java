package artauction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet implementation class EditArtwork
 */
@WebServlet(name = "RemoveArtwork", urlPatterns = {"/App/RemoveArtwork"})
public class RemoveArtwork extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveArtwork() {
        super();
        // Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int artworkID = Integer.parseInt(request.getParameter("artworkID"));


        AuctionDAO auctionDAO = new AuctionDAO();
        String result = auctionDAO.removeArtwork(artworkID);

        if (result.equals("Successfully Removed")) {
            response.sendRedirect(request.getContextPath() + "/");
        }

    }

}
