@if (isset($item))
<div class="shopping-cart__row other_row">

  <!-- OBRAZOK PRODUKTU -->
  <div class="col-2 pr-4 d-none d-sm-flex">

  </div>

  <!-- NAZOV PRODUKTU -->
  <div class="col-sm-4 col-auto">
    <div class="name">
      <span class="heading">
        {{ $item->name }}
      </span>
      @if ($item->options->has('desc'))
      <span class="subheading">
          {{ $item->options->desc }}
      </span>
      @endif
    </div>
  </div>

  <!-- POCET -->
  <div class="col">
  </div>

  <div class="col prices text-sm-center text-lg-right">
    <div class="price_total">
      {{ format_money($item->price) }}
    </div>
  </div>

  <!-- ODSTRANIT PRODUKT Z KOSIKU -->
  {{--<div class="col-auto d-none d-sm-flex">--}}
    {{--<a href="#" class="remove" style="visibility:hidden;">--}}
      {{--<i class="fas fa-times"></i>--}}
    {{--</a>--}}
  {{--</div>--}}

</div>
@endif