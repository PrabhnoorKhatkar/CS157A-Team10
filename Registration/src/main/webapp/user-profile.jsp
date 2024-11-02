<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="myapp/user-profile-style.css"
	type="text/css" />
<title>My Profile</title>
</head>
<body>

	<header class="profile-header">
		<div class="header-left">
			<h2>
				<a href="homepage.jsp" class="logo">ART AUCTION</a>
			</h2>
		</div>

		<div class="header-right">

			<a href="art-upload-form.jsp" class="upload-btn">Upload</a>

			<button class="signout-btn">Sign Out</button>

			<a href="user-profile.jsp" class="profile-btn"> <img
				src="myapp/temporary-pic.jpg" alt="profile pic" width="64"
				height="64">
			</a>
		</div>
	</header>

	<div class="profile-container">
		
		<img src="myapp/temporary-pic.jpg" alt="Profile Picture"
			class="profile-pic">
		
		<h2 class="username">Username</h2>
		
		<a href="edit-profile.jsp" class="edit-profile-btn">Edit Profile</a>
		
		<a href="edit-profile.jsp" class="setting-btn">Setting</a>
	</div>

	<div class="user-artwork">
		<h2>My Artwork</h2>
		<div class="art-grid">
			
			<div class="art-item">
				<a href="ArtworkPage?artworkId=${artwork.artID}"
					class="art-item-link">
					<h3>${artwork.title}Title1</h3>
					<p>Starting Bid: $${artwork.startingPrice}</p>
					<p>Description: ${artwork.description}</p>
				</a>
			</div>
			
			<div class="art-item">
				<a href="ArtworkPage?artworkId=${artwork.artID}"
					class="art-item-link">
					<h3>${artwork.title}Title2</h3>
					<p>Starting Bid: $${artwork.startingPrice}</p>
					<p>Description: ${artwork.description}</p>
				</a>
			</div>
			
			<div class="art-item">
				<a href="ArtworkPage?artworkId=${artwork.artID}"
					class="art-item-link">
					<h3>${artwork.title}Title3</h3>
					<p>Starting Bid: $${artwork.startingPrice}</p>
					<p>Description: ${artwork.description}</p>
				</a>
			</div>
			
		</div>
	</div>


</body>
</html>