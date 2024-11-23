function toggleFollowingList() {
	const list = document.getElementById('followingList');

	if (list.style.display === 'none') {
		list.style.display = 'block';
	} else {
		list.style.display = 'none';
	}
}

function toggleFollowersList() {
	const list = document.getElementById('followersList');

	if (list.style.display === 'none') {
		list.style.display = 'block';
	} else {
		list.style.display = 'none';
	}
}