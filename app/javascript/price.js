function price (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {

  const calTaxPrice = Math.floor(itemPrice.value/10);

  const addTaxPrice  = document.getElementById("add-tax-price");
  addTaxPrice.innerHTML = `${calTaxPrice}`;

  const calProfit = itemPrice.value - calTaxPrice

  const profit  = document.getElementById("profit");
  profit.innerHTML = `${calProfit}`;
  });
    
};

window.addEventListener('load', price);