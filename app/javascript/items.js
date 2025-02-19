window.addEventListener('turbo:load', function(){

  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener("input", () => {
  const inputValue = parseFloat(priceInput.value);
  
  if (inputValue >= 300 && inputValue <= 9999999) {
  const addTaxDom = document.getElementById('add-tax-price');
  const tax = Math.floor(inputValue * 0.10);
  addTaxDom.innerHTML = tax;
  
  const profit = document.getElementById('profit');
  profit.textContent = Math.floor(inputValue - tax);
  } else {
  addTaxDom.textContent = '0';
  profit.textContent = '0';
      }
  });
  });
  window.addEventListener("turbo:load", price);
  window.addEventListener("turbo:render", price);