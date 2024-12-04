<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layouts"%>
<layout:base>
	<jsp:attribute name="head">
		<title>Settings test</title>
	</jsp:attribute>
	<jsp:body>
		<label for="theme-select">
			Select a theme!
		</label>
		<select id="theme-select">
			<option value="system">System</option>
			<option value="light">Light</option>
			<option value="dark">Dark</option>
		</select>

		<script>
            const body = document.body;
            const themeSelect = document.getElementById('theme-select');
            const prefersDark = window.matchMedia('(prefers-color-scheme: dark)');

            function getSystemTheme() {
                return prefersDark.matches ? 'dark-mode' : 'light-mode';
            }

            function setTheme(value) {
                var dark = value === 'dark' || (value === 'system' && prefersDark.matches);
                body.classList.toggle('dark-mode', dark);
                localStorage.setItem('theme-preference', value);
            }

            // Handle system theme changes
            prefersDark.addEventListener('change', () => {
                if (themeSelect.value === 'system') {
                    setTheme('system');
                }
            });

            // Handle dropdown changes
            themeSelect.addEventListener('change', (e) => {
                setTheme(e.target.value);
            });

            // Initialize on page load
            const savedPreference = localStorage.getItem('theme-preference') ?? 'system';
            themeSelect.value = savedPreference;
            setTheme(savedPreference);
		</script>
	</jsp:body>
</layout:base>
