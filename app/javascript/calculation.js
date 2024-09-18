	const priceInput = document.getElementById('item-price');
	let resultDisplay = document.getElementById('add-tax-price');
	let Profit = document.getElementById('profit');
	priceInput.addEventListener('input', function() {
		const inputValue = parseFloat(priceInput.value);

		if (!isNaN(inputValue)) {
				const increasedValue = inputValue * 0.1;
				resultDisplay.textContent = Math.floor(increasedValue);
				const resultValue = Math.floor(increasedValue).toString();
            resultDisplay.innerHTML = '';
            resultDisplay.insertAdjacentHTML('beforeend', `<span>${resultValue}</span>`);
				const resultProfit = inputValue - increasedValue;
				const LastProfit = Math.floor(resultProfit).toString();
				Profit.innerHTML = '';
        Profit.insertAdjacentHTML('beforeend', `<span>${LastProfit}</span>`);
		} else {
				resultDisplay.textContent = '0';
		}
})