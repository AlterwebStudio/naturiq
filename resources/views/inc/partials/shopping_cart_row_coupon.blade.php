@if (isset($coupon))
<div class="shopping-cart__row other_row">

  <!-- OBRAZOK PRODUKTU -->
  <div class="col-2 pr-4 d-none d-sm-flex">

  </div>

  <!-- NAZOV PRODUKTU -->
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

  <!-- POCET -->
  <div class="col">
  </div>

  <div class="col prices text-right text-sm-center">
    <div class="price_total">
      {!! $coupon->discount !!}
    </div>
  </div>

  <!-- ODSTRANIT PRODUKT Z KOSIKU -->
  <div class="col-auto d-none d-sm-flex">
    <a href="{{ route('cart.remove_coupon') }}" class="remove" style="visibility:hidden;">
      <i class="fas fa-times"></i>
    </a>
  </div>

</div>
@endif