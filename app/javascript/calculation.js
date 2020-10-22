function calculation() {
  const itemPrice = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  itemPrice.addEventListener("keyup", () => {
    const inputPrice = itemPrice.value;
    const inputPriceFee = inputPrice * 0.1;
    const salesProfit = inputPrice - inputPriceFee;

    addTaxPrice.innerHTML = Math.floor(inputPriceFee);
    profit.innerHTML = Math.floor(salesProfit);
  });
}


window.addEventListener('load',calculation);