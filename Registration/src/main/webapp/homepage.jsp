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
<header class="">
    <div class="search-container">
        <h2> Art Auction</h2>
        <form action="SearchArtwork" method="post">
            <input type="text" class="search-box" placeholder="Search..." name="searchText">
            <button type="submit" class="search-button">Search</button>
        </form>
       
    </div>
    <img src="/Registration/Upload/0" alt="profile pic" width="64" height="64">
</header>

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



<section class="search-results" id="gallery">
    <div class="container">
        <h2>Search Results</h2>
        <div class="art-grid">
                 <h2>Show Results</h2>
                 
                 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
                <!-- Iterate over the artwork list and display each artwork -->
                <c:forEach var="artwork" items="${artworkList}">
                    <div class="art-item">
                        <h3>${artwork.title}</h3>
                        <p>Starting Bid: $${artwork.startingPrice}</p>
                        <p>Description: ${artwork.description}</p>
                    </div>
                </c:forEach>
         
        
        </div>
    </div>
</section>


</body>
</html>