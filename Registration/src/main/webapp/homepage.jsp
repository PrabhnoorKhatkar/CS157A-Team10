<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="myapp/homepage-style.css">
    <script src="myapp/main.js"></script>
    <title>Homepage</title>
</head>
<body>
<!--<p>homepage</p> -->
<div class="search-container">
    <h2> Art Auction</h2>
    <input type="text" class="search-box" placeholder="Search..." name="searchText">
    <button type="submit" class="search-button">Search</button>
</div>

<section class="featured-artwork" id="gallery">
    <div class="container">
        <h2>Featured Artwork</h2>
        <div class="art-grid">
            <div class="art-item">
                <img src="art1.jpg" alt="Artwork 1">
                <h3>The Eternal Dream</h3>
                <p>Artist: Jane Doe</p>
                <p>Starting Bid: $5,000</p>
            </div>
            <div class="art-item">
                <img src="art2.jpg" alt="Artwork 2">
                <h3>Colors of the Wind</h3>
                <p>Artist: John Smith</p>
                <p>Starting Bid: $8,000</p>
            </div>
            <div class="art-item">
                <img src="art3.jpg" alt="Artwork 3">
                <h3>Whispers in Time</h3>
                <p>Artist: Alice Brown</p>
                <p>Starting Bid: $12,000</p>
            </div>
        </div>
    </div>
</section>

</body>
</html>