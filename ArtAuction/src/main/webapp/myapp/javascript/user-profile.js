function toggleFollowingList() {
	const list = document.getElementById('followingList');
	const follower = document.getElementById('followersList');

	if (list.style.display === 'none') {
		list.style.display = 'block';
		follower.style.display = 'none';
	} else {
		list.style.display = 'none';
	}
}

function toggleFollowersList() {
	const list = document.getElementById('followersList');
	const following = document.getElementById('followingList');

	if (list.style.display === 'none') {
		list.style.display = 'block';
		following.style.display = 'none';
	} else {
		list.style.display = 'none';
	}
}

function toggleArtworkList() {
	const list = document.getElementById('artworkList');
	const favorite = document.getElementById('favoriteList');
	const order = document.getElementById('orderList');

	if (list.style.display === 'none') {
		list.style.display = 'block';
		favorite.style.display = 'none';
		order.style.display = 'none';
	} else {
		list.style.display = 'none';
	}
}

function toggleFavoriteList() {
	const list = document.getElementById('favoriteList');
	const artwork = document.getElementById('artworkList');
	const order = document.getElementById('orderList');

	if (list.style.display === 'none') {
		list.style.display = 'block';
		artwork.style.display ='none';
		order.style.display = 'none';
	} else {
		list.style.display = 'none';
	}
}

function toggleOrderList() {
	const list = document.getElementById('orderList');
	const favorite = document.getElementById('favoriteList');
	const artwork = document.getElementById('artworkList');

	if (list.style.display === 'none') {
		list.style.display = 'block';
		artwork.style.display ='none';
		favorite.style.display = 'none';
	} else {
		list.style.display = 'none';
	}
}
