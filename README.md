# CS157A-Team10

## Brushstroke Bargains
An online art auction platform designed for artists to showcase their work and for users to bid on artworks.

## Setup
Download the zip from Canvas. Extract it to a folder of your choosing.

### Install MySQL 8.0

Either do this manually:
+ Download from https://dev.mysql.com/downloads/mysql/8.0.html and follow the instructions there to get it running
+ Use the root user. Set the root password to `dbpassword`.

Or use Docker:
+ Ensure you have docker + docker-compose. Open a terminal in the `ArtAuction` directory and then run `docker compose up`.

### Setup MySQL 8.0
Run the MySQL server via your preferred method.

Open MySQL workbench. Edit or Add the connection to the server and ensure the fields are:

- Connection Name: `artauction`
- Hostname: `127.0.0.1`
- Username: `root`
- Password: `dbpassword`
- Default schema: leave it blank

Double click this connection to open it. Right click in the Schemas window and press Create Schema:

Name the schema `artauction` and press Apply, then press Apply on the confirmation popup:

Then, in the top menu, go to Server > Data Import. Select the checkbox to `Import from Self-Contained File`, press the “…” button and browse to `ArtAuction`, then select `artauction.sql`. Then select the default target schema to be `artauction`.

Then press Start Import and you should see some new tables pop up under the `artauction` schema.


### Running the project with Eclipse and Tomcat:

- Ensure that MySQL is still running.
- Launch Eclipse IDE. In the menu, import the project by going to File > Import Projects from File System.
- Click the "Directory" button and select the ArtAuction folder:
- You should see the ArtAuction project popup, either as a Maven or an Eclipse project. Select it, then press Finish.
- Click on the root-level ArtAuction project node in the Project Explorer window.
- Then navigate to Run > Run and in the popup, click "Run on Server" then press OK.
- In the following popup, select:
    - Manually define a new server
    - Apache > Tomcat v10.1 Server
    - Server’s host name: localhost
    - Check the “Always use this server when running the project” box.

- Click next, then either select an existing instance of Tomcat 10.1 you have installed, or click "Download and Install" and accept the license agreement to download Tomcat 10.1 for you.
- Once you click "Finish", it should immediately startup Tomcat and load the project, and you should see http://localhost:8080/ArtAuction/ popup in your default browser. The site is now ready to use!

- Some notes:
- To reach purchase artwork functionalities, you have to bid on a active artwork, and then adjust the end timestamp in sql to very near in the future (e.g 1 min in the future)
- Wait for the countdown to work, and refresh the page and it should direct you have won, there may be a reserve, so you can place a very large bid to ensure you bid more than the reserve. 

## Relations:

- user(**userID**, emailAddress, password, name, displayName, address, anonymous)
- admin(**userID**, role, referralCode, referralCodeUsed)
- Follow(**followerID**, **followingID**)

---
- image(**imageID**, filename, uploaderID)
- artimage(**artworkID**, **imageID**)
- profilepicture(**userID**, imageID)

---

- artwork(**artworkID**, title, description, artist)
- favorite(**userID**, **artworkID**)
- Tag(**artworkID**, name)

---

- auctiondetails(**artworkID**, startTimestamp, endTimestamp, amount, startingPrice, reserve, result)
- auction(**userID**, **artworkID**)
- bid(**userID**, **artworkID**, timestamp, bidAmount)

---

- OrderDetails(**orderID**, timestamp, trackingNumber, status, totalPaid)
- Order(**userID**, **orderID**)
- OrderItem(**orderID**, **artworkID**)

## Example user passwords:

User passwords are 'password\_1' through 'password\_16' respectfully. They are hashed by SHA256.

