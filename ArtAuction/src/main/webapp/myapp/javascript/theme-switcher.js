const body = document.body;
const toggleBtn = document.getElementById('toggle-btn');
const darkPreferenceQuery = window.matchMedia('(prefers-color-scheme: dark)');
const pastPreference = localStorage.getItem('color-scheme')

// Toggle theme function
function toggleTheme(forceDark) {
    body.classList.toggle('dark-mode', forceDark);

    const dark = body.classList.contains('dark-mode');
    if (dark) {
        setDarkTheme(body.classList.contains('dark-mode'));
        localStorage.setItem('color-scheme', dark ? 'dark' : 'light');
    }
    toggleBtn.textContent = dark
        ? 'Switch to Light Mode'
        : 'Switch to Dark Mode';
}

// Listen for system theme changes
darkPreferenceQuery.addEventListener('change', (e) => {
    if (!localStorage.getItem('color-scheme')) {
        toggleTheme(e.matches);
    }
});

// Add click event listener
toggleBtn.addEventListener('click', toggleTheme);

// Initialize on page load
toggleTheme(pastPreference);
