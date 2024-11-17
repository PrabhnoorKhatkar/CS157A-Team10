import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

/**
 * Servlet implementation class EditArtwork
 */
public class PlaceBid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceBid() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int artworkID = Integer.parseInt(request.getParameter("artworkID"));
        int userID = (int) request.getSession().getAttribute("userID");


        String bidAmountString = request.getParameter("bidAmount");
        Float bidAmount = Float.parseFloat(bidAmountString);

        // TODO i dont think we need this get rid prob when done
        SearchArtworkDAO searchDAO = new SearchArtworkDAO();
		Artwork artwork = searchDAO.getArtworkById(artworkID);


		AuctionDAO auctionDAO = new AuctionDAO();
		Auction auction = auctionDAO.getAuctionByArtworkID(artworkID);

        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        if(currentTimestamp.before(auction.getEndTimestamp()))
        {
            String result = auctionDAO.placeBid(userID, bidAmount, artworkID);
        }




	}

}
