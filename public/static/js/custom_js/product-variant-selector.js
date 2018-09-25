const allProductsOnPage = document.querySelectorAll('.product, .product-page');


//=================================
// CLASS *************************
// CONSTRUCTOR *******************
//=================================
const ProductVariantSelector = function(product){
  this.options = product.querySelectorAll('input[type="radio"]');
  this.selectedOption = product.querySelector('input[type="radio"]:checked');
  this.prevButton = product.querySelector('.prev-var');
  this.nextButton = product.querySelector('.next-var');
  this.selectedOptionIndex = this.getSelectedOption();
  this.variantValue = product.querySelector('.variant-value');
  this.priceContainer = product.querySelector('.product__price');

  // Nastartujeme vsetky event listenery
  this.addEventListeners();

  // Nastavime vychodziu hodnotu
  this.setSelectedOption();

}

// =============================
//Class: Oznac radio button v zavislosti na tom, ktory v poradi ma byt oznaceny
// ==============================
ProductVariantSelector.prototype.setSelectedOption = function(direction){
    const that = this;

    switch (direction) {

      case 'prev':
        //zisti ci niesi na zaciatku radu, ak ano tak ukaz poslednu hodnotu
        if(that.selectedOptionIndex <= 0){
          that.selectedOptionIndex = that.options.length-1;
        }
        else{
          that.selectedOptionIndex --;
        }
        break;

      case 'next':
        // zisti ci niesi na konci radu a ak ano tak ukaz prvu hodnotu
        if (that.selectedOptionIndex >= that.options.length-1) {
          that.selectedOptionIndex = 0;
        }
        else{
          that.selectedOptionIndex ++;
        }
      break;
      default:
      // v pripade ze funkcia nebola zavolana smerovymi sipkami, tak znova zisti, ktory radio button je aktivny a zapis hodnotu do classy
      that.selectedOptionIndex = that.getSelectedOption();

    }

    that.options[that.selectedOptionIndex].checked = true;

    //vytiahni si hodnotu ktoru mas zobrazit z data akativneho prvku a vypis ju
    const selectedOptionValue = that.options[that.selectedOptionIndex].getAttribute('data-display-value');
    if(that.variantValue){
      that.variantValue.innerHTML = selectedOptionValue;
    }


    const selectedOptionRegPrice = that.options[that.selectedOptionIndex].getAttribute('data-regular-price');
    const selectedOptionSalePrice = that.options[that.selectedOptionIndex].getAttribute('data-sale-price');

    //Vynuluje price container
    that.priceContainer.innerHTML = null;

    if(selectedOptionSalePrice){
      const salePrice = document.createElement('span');
            salePrice.classList.add('sale-price');
            salePrice.innerHTML = selectedOptionSalePrice;

      that.priceContainer.appendChild(salePrice);
    }

    const regPrice = document.createElement('span');
          regPrice.classList.add('regular-price');
          regPrice.innerHTML = selectedOptionRegPrice;

      that.priceContainer.appendChild(regPrice);

}


// =============================
//Class: GetSelectedOption - zisti, ktorý radio button v poradi je selectnuty
// ==============================
ProductVariantSelector.prototype.getSelectedOption = function(){
    const that = this;

    let i;
    for(i = 0; i<that.options.length; i++){

        if(that.options[i].checked){
          return i;
        }

    }
    return "no selected radio button";
}


// =============================
//Class: AddEventListeners
// ==============================
ProductVariantSelector.prototype.addEventListeners = function(){
  var that = this;

  if(that.prevButton){
    //pre sipku doprava
    that.prevButton.addEventListener('click', function(){
      that.setSelectedOption('prev');
    });
  }

  if(that.nextButton){
    //pre sipku dolava
    that.nextButton.addEventListener('click', function(){
      that.setSelectedOption('next');
    });
  }

  //pridaj listner kazdemu radio buttonu
  that.options.forEach(function(option) {

    option.addEventListener('click', function(){

      that.setSelectedOption();


    })
  })

  //pre manualne zvolenie
}

//END CLASS


allProductsOnPage.forEach(function(product){

  const selector = new ProductVariantSelector(product);

  // console.log( selectedRadio[0].getAttribute('data-display-value')  );
})
