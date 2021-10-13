function price (){
  //console.log("price自動計算");

  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
  //console.log(itemPrice.value);

//下に計算結果を表示する記述
  const calTaxPrice = Math.floor(itemPrice.value/10);
  //console.log(calTaxPrice);
  const addTaxPrice  = document.getElementById("add-tax-price");
  addTaxPrice.innerHTML = `${calTaxPrice}`;

  const calProfit = itemPrice.value - calTaxPrice
  //console.log(calProfit);
  const profit  = document.getElementById("profit");
  profit.innerHTML = `${calProfit}`;

//下に投稿後0になる記述（必要なら後からファイルを分けて追記）
    // const charNum  = document.getElementById("char_num");
    // charNum.innerHTML = "0文字";

    // const charNum  = document.getElementById("char_num");
    // charNum.innerHTML = "0文字";

  });
    
};

window.addEventListener('load', price);