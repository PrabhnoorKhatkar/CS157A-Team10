function toggleFollowingList() {
	const list = document.getElementById('followingList');
	const button = document.getElementById('followingBtn');

	if (list.style.display === 'none') {
		list.style.display = 'block';
		button.textContent = 'Following';
	} else {
		list.style.display = 'none';
		button.textContent = 'Following';
	}
}

function toggleFollowersList() {
	const list = document.getElementById('followersList');
	const button = document.getElementById('followersBtn');

	if (list.style.display === 'none') {
		list.style.display = 'block';
		button.textContent = 'Followers';
	} else {
		list.style.display = 'none';
		button.textContent = 'Followers';
	}
}