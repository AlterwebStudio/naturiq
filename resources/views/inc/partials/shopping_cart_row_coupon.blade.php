@if (isset($coupon))
<div class="shopping-cart__row other_row">

  {{-- PRODUCT IMAGE ICON --}}
  <div class="col-2 pr-4 d-none d-sm-flex"></div>

  {{-- PRODUCT NAME --}}
  <div class="col-sm-4 col-auto">
    <div class="name">
      <span class="heading">
        {{ $coupon->title }}
      </span>
      <span class="subheading">
          Číslo kupónu: {{ $coupon->code }}
      </span>
    </div>
  </div>

  <div class="col"></div>

  <div class="col prices text-sm-center">
    <div class="price_total">
      {!! $coupon->discount !!}
    </div>
  </div>

  {{-- DEACTIVATE COUPON --}}
  <div class="col-auto d-none d-sm-flex">
    <a href="{{ route('cart.remove_coupon') }}" class="remove">
      <i class="fas fa-times"></i>
    </a>
  </div>

</div>
@endif