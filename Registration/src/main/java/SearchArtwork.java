import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class SearchArtwork extends HttpServlet {

    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String searchText = request.getParameter("searchQuery");


        String sql = "SELECT * FROM Artwork WHERE 'title' LIKE ? OR 'description' LIKE ?";
		String noResult = "No Artworks Found.";
        PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, searchText);
		ps.setString(2, searchText);


        ResultSet resultSet = statement.executeQuery();
        if(!resultSet.next())
        {
            //TODO Send result no artwork found
        }
        else
        {
            // TODO: Send result set into homepage .jsp with the structure defined in DTD
        }


        }
    
}
