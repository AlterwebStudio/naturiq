






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

  @foreach ($slideshow as $slide)
    <div class="header-slideshow__slide">
      <div class="container header-slideshow__photo-caption">
        <div class="row">
          <div class="col-lg-5 ml-auto mt-5 mt-lg-0">
            <div class="directional">
              <div class="directional-arrow prev">
                <img class="svg" src="{{ asset('images/arrow_slideshow_left.svg') }}" alt="">
              </div>
              <div class="directional-arrow next ml-2">
                <img class="svg" src="{{ asset('images/arrow_slideshow_right.svg') }}" alt="">
              </div>
            </div>
            <h2>
              <span>
                {{ $slide->product->name }}
              </span>
            </h2>
            <a href="{{ route('product_detail',[$slide->product->category->slug,$slide->product->slug,$slide->product->id]) }}" class="btn btn-orange mb-3 mr-lg-3">
              Viac o produkte
            </a>
            @if ($slide->product->recepts->count() > 0)
            <a href="{{ route('product_recipes', [$slide->product->slug, $slide->product_id]) }}" class="btn  mb-3 btn-outline-light">
              Recepty s produktom
            </a>
            @endif
          </div>

          <div class="header-slideshow__hero col-lg-6">
            <div class="big-hero">
              <img src="{{ image_get_thumbnail(asset('storage/'.$slide->product->image),'medium') }}" alt="">
            </div>
            <div class="small-hero">
              <img src="{{ image_get_thumbnail(asset('storage/'.$slide->product->image),'medium') }}" alt="">
            </div>
          </div>
        </div>
      </div>
      <div class="header-slideshow__bg" style="background-image:url({{ asset('storage/'.$slide->background->image) }})"></div>
    </div>
  @endforeach

  </div>
</div>
