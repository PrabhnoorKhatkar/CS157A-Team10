<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
         
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="myapp/homepage-style.css">
    <script src="myapp/main.js"></script>
    <title>Artwork</title>
</head>
<body>

 <!-- TODO Iterate over the artwork list and display each artwork -->

    <section class="artwork-details">
        <div class="container">
            <h2>${artwork.title}</h2>
            <p>Artist: ${artwork.artistName}</p>
            <p>Starting Bid: $${artwork.startingPrice}</p>
            <p>Description: ${artwork.description}</p>
            <p>Auction Ends: ${artwork.auctionDeadline}</p>
        </div>
    </section>


</body>
</html>