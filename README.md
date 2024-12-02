# CS157A-Team10

## Art Auction
An online art auction platform designed for artists to showcase their work and for users to bid on artworks.

## Relations:

- User(**ID**, emailAddress, password, name, displayName, address, anonymous)
- Admin(**userID**, name)
- Follow(**followerID**, **followingID**)

---

- Image(**ID**, filename)
- Uploaded(**userID**, **imageID**)
- ProfilePicture(**userID**, **imageID**)
- ArtImage(**artworkID**, **imageID**)

---

- Artwork(ID, title, description, artist)
- Favorite(**userID**, **artworkID**)
- Tag(**artworkID**, name)

---

- AuctionDetails(**ID**, startTimestamp, endTimestamp, amount, startingPrice, reserve, result)
- Auction(**userID**, **artworkID**, **auctionDetailsID**)
- Bid(**userID**, **auctionDetailsID**, timestamp, dollarAmount)

---

- OrderDetails(**ID**, timestamp, trackingNumber, status, totalPaid)
- Order(**userID**, **orderDetailsID**)
- OrderItem(**orderDetailsID**, **artworkID**)

## Example user passwords:

User passwords are 'password\_1' through 'password\_10' respectfully. They are hashed by SHA256.
