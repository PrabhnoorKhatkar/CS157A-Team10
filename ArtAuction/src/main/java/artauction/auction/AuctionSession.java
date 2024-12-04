package artauction.auction;

import artauction.Artwork;
import jakarta.websocket.Session;

import java.util.ArrayList;

public class AuctionSession {
    private Artwork artwork;
    public ArrayList<Session> peers = new ArrayList<>();
    public AuctionSession(Artwork artwork) {
        this.artwork = artwork;
    }

}
