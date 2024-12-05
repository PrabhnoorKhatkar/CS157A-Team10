package artauction;

import artauction.user.UserDAO;
import artauction.image.Image;
import artauction.image.ImageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SearchArtwork", urlPatterns={"/SearchArtwork"})
public class SearchArtwork extends HttpServlet {

    private static final long serialVersionUID = 1L;

	public SearchArtwork() {
		super();
	}



	/**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       // TODO When not logged in prompt user to login to see featured artworks based on their followings.

		String searchText = request.getParameter("searchText");
		if (searchText == null || searchText.trim().isEmpty()) {
			searchText = "";
		}

        ArtworkDAO searchDAO = new ArtworkDAO();

        List<Artwork> artworkList = searchDAO.query(searchText);

        request.setAttribute("artworkList", artworkList);

        response.sendRedirect("/");
    }
}
