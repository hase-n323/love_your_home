function changePreview(backgroundImageUrl, overlayImageUrl, backgroundSize) {
  var background = document.getElementById('background');
  var overlay = document.getElementById('overlay');
  background.style.backgroundImage = 'url(' + backgroundImageUrl + ')';
  overlay.style.backgroundImage = 'url(' + overlayImageUrl + ')';
  background.style.backgroundSize = backgroundSize; // 背景サイズを動的に変更
}

function showProductInfo(productNumber, productLink, backgroundImageUrl, overlayImageUrl, backgroundSize) {
  changePreview(backgroundImageUrl, overlayImageUrl, backgroundSize);

  var productInfo = document.getElementById('product-info');
  var productNumberElem = document.getElementById('product-number');
  var productLinkElem = document.getElementById('product-link');

  productNumberElem.textContent = 'Product Number: ' + productNumber;
  productLinkElem.href = productLink;

  productInfo.style.display = 'block'; // 商品情報を表示
}

// 以下が必須です
window.showProductInfo = showProductInfo;
