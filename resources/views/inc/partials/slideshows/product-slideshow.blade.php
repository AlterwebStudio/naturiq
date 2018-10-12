
<div class="container product-slideshow_container">
  <div class="row">
    <div class="col-2 col-md-1 d-flex align-items-center">
      @if ($featured->count() > 4)
      <div class="directional-arrow prev">
        <img class="svg" src="{{ asset('images/arrow_slideshow_left.svg') }}" alt="">
      </div>
      @endif
    </div>

    <!-- Slideshow container -->
    <div class="col-8 col-md-10">
      <div class="row product-slideshow">

        @foreach ($featured as $item)
        <div class="col-sm-3">
            @include('inc.partials.product', ['product' => $item])
        </div>
        @endforeach

      </div>
    </div>
    <!-- Container end -->

    <div class="col-2 col-md-1 d-flex align-items-center">
      @if ($featured->count() > 4)
      <div class="directional-arrow next">
        <img class="svg" src="{{ asset('images/arrow_slideshow_right.svg') }}" alt="">
      </div>
      @endif
    </div>
  </div>
</div>
