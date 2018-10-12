@if (isset($item))

  <div class="shopping-cart__row">

  <!-- OBRAZOK PRODUKTU -->
  <div class="col-12 text-center col-sm-2 pr-sm-4  mb-3 mb-sm-0">
    <a href="{{ route('product_detail', [App\Product::get_category_slug($item->id),str_slug($item->name),$item->id]) }}" class="image text-center">
      <img src="{{ image_get_thumbnail(asset('/storage/'.$item->options->image),'mini') }}" alt="{{ $item->name }}">
    </a>
  </div>

  <!-- NAZOV PRODUKTU -->
  <div class="col-sm-6 text-center text-sm-left mb-3 mb-sm-0">
    <div class="name">
      <a class="heading" href="{{ route('product_detail', [App\Product::get_category_slug($item->id),str_slug($item->name),$item->id]) }}">
        {{ $item->name }}
      </a>
      @if ($item->options->has('weight'))
        <div class="variant">
          {{ $item->options->weight }}
        </div>
      @endif
    </div>
  </div>

  <!-- POCET -->
  <div class="col-sm mb-3 mb-sm-0 text-center">
    <span class="text-sm">{{ $item->qty }} ks</span>
  </div>

  <div class="col-sm prices mb-3 mb-sm-0 text-sm-right text-center">
    <div class="price_total">
      {{ number_format($item->subtotal,2, ',', ' ') }} &euro;
    </div>
    <div class="price_unit">
      {{ number_format($item->price,2, ',', ' ') }} &euro; / ks
    </div>
  </div>


</div>
@endif