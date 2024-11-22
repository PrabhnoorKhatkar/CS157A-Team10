function toggleFollowingList() {
	const list = document.getElementById('followingList');
	const button = document.getElementById('followingBtn');

	if (list.style.display === 'none') {
		list.style.display = 'block';
	} else {
		list.style.display = 'none';
	}
}

function toggleFollowersList() {
	const list = document.getElementById('followersList');
	const button = document.getElementById('followersBtn');

	if (list.style.display === 'none') {
		list.style.display = 'block';
	} else {
		list.style.display = 'none';
	}
}