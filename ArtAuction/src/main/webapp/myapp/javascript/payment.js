
// add dash to card number input

const cardNumberInput = document.getElementById('cardNumber');

cardNumberInput.addEventListener('input', (event) => {

	let input = event.target.value.replace(/\D/g, '');

	let formattedInput = '';

	for (let i = 0; i < input.length; i += 4) {
		if (formattedInput !== '') {
			formattedInput += '-';
		}
		formattedInput += input.substr(i, 4);
	}

	event.target.value = formattedInput;
});

// card month and year expiration

const cardMonthSelect = document.getElementById('cardMonth');

for (let i = 1; i <= 12; i++) {
	const option = document.createElement('option');

	option.value = String(i).padStart(2, '0');

	option.textContent = String(i).padStart(2, '0');

	cardMonthSelect.appendChild(option);
}

const cardYearSelect = document.getElementById('cardYear');

const currentYear = new Date().getFullYear();

for (let i = 0; i < 10; i++) {
	
	const option = document.createElement('option');
	
	option.value = currentYear + i;
	
	option.textContent = currentYear + i;
	
	cardYearSelect.appendChild(option);
}