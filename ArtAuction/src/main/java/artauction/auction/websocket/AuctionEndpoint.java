package artauction.auction.websocket;

import jakarta.websocket.OnMessage;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

import java.io.IOException;

@ServerEndpoint("/websocket/auction")
public class AuctionEndpoint {
        @OnMessage
        public void onMessage(Session session, String msg) {
            try {
                session.getBasicRemote().sendText(msg);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
}
