@if (isset($item))
<div class="shopping-cart__row">

    <!-- OBRAZOK PRODUKTU -->
    <div class="col-12 text-center col-sm-2 pr-sm-4  mb-3 mb-sm-0">
        <a href="{{ route('product_detail', [App\Product::get_category_slug($item->id),str_slug($item->name),$item->id]) }}" class="image text-center">
            <img src="{{ image_get_thumbnail(asset('/storage/'.$item->options->image),'small') }}" alt="{{ $item->name }}">
        </a>
    </div>

    <!-- NAZOV PRODUKTU -->
    <div class="col-sm-4 text-center text-sm-left mb-3 mb-sm-0">
        <div class="name pr-2">
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
    <div class="col-sm mb-3 mb-sm-0">

        <form action="{{ route('cart.update_quantity',[$item->rowId]) }}" method="post">
            @csrf
            <div class="input-group input-group-sm counter">
                <div class="input-group-prepend">
                    <button type="submit" name="btn-minus" class="btn btn-sm btn-minus event-proceed">
                        -
                    </button>
                </div>
                <input name="quantity" value="{{ $item->qty }}" type="text" class="form-control form-control-sm text-center counter_field event-proceed" placeholder="Počet">
                <div class="input-group-append">
                    <button  name="btn-minus" type="submit" class="btn btn-sm btn-plus event-proceed">
                        +
                    </button>
                </div>
            </div>
        </form>

    </div>

    <div class="col-sm prices mb-3 mb-sm-0">
        <div class="price_total">
            {{ number_format($item->subtotal,2, ',', ' ') }} &euro;
        </div>
        <div class="price_unit">
            {{ number_format($item->price,2, ',', ' ') }} &euro; / ks
        </div>
    </div>

    <!-- ODSTRANIT PRODUKT Z KOSIKU -->
    <div class="col-sm-auto text-center">
        <a href="{{ route('cart.remove_item', [$item->rowId]) }}" class="remove">
            <i class="fas fa-times"></i>
        </a>
    </div>

</div>
@endif