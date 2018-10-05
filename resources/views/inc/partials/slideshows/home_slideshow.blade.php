






<div class="header-slideshow">
  <div class="header-slideshow__controls container">

    <div class="header-slideshow__dots">
      <div class="dots_nr">
        <span class="actual">
          1
        </span>
        /
        <span class="total">
          4
        </span>
      </div>
      <div class="dots">

      </div>
    </div>

  </div>


  <div class="header-slideshow__container">

    <?php
      for ($i=0; $i < 5; $i++):
    ?>


    <div class="header-slideshow__slide">
      <div class="container header-slideshow__photo-caption">
        <div class="row">
          <div class="col-lg-5 ml-auto mt-5 mt-lg-0">
            <div class="directional">
              <div class="directional-arrow prev">
                <img class="svg" src="images/arrow_slideshow_left.svg" alt="">
              </div>
              <div class="directional-arrow next ml-2">
                <img class="svg" src="images/arrow_slideshow_right.svg" alt="">
              </div>
            </div>
            <h2>
              <span>
                Arónia Chokeberries
              </span>
            </h2>
            <a href="product.php" class="btn btn-orange mb-3 mr-lg-3">
              Viac o produkte
            </a>
            <a href="#" class="btn  mb-3 btn-outline-light">
              Recepty s produktom
            </a>
          </div>

          <div class="header-slideshow__hero col-lg-6">
            <div class="big-hero">
              <img src="images/produkty/velky.png" alt="">
            </div>
            <div class="small-hero">
              <img src="images/produkty/velky.png" alt="">
            </div>
          </div>
        </div>
      </div>
      <div class="header-slideshow__bg" style="background-image:url('/images/bg/watercolor_purple.jpg')"></div>
    </div>

    <?php
      endfor;
    ?>

  </div>
</div>
