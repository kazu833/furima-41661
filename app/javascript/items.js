
window.addEventListener('turbo:load', function(){

  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  priceInput.addEventListener('input', () => {
    const price = priceInput.value; 

    if (price >= 300 && price <= 9999999) {
       const fee = Math.floor(price * 0.10);
      const gains = price - fee;

      addTaxPrice.textContent = fee.toLocaleString();
      profit.textContent = gains.toLocaleString();
    } else {
      addTaxPrice.textContent = '0';
      profit.textContent = '0';
    }
  });
});