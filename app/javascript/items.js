const price = () => {
  const priceInput = document.getElementById('item-price');
  const addTaxDom = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = parseFloat(priceInput.value);

      if (inputValue >= 300 && inputValue <= 9999999) {
        const tax = Math.floor(inputValue * 0.10);
        addTaxDom.innerHTML = tax;
        profit.textContent = Math.floor(inputValue - tax);
      } else {
        addTaxDom.textContent = '0';
        profit.textContent = '0';
      }
    });
  }
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);