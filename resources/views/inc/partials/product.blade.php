<div class="product">

    <!-- ODZNAKY LAVA STRANA / -->
    <div class="product__badges_left">
        @foreach ($product->tags as $tag)
            <div class="badge {{ $tag->class }}">{{ $tag->name }}</div>
        @endforeach
        @if ($product->in_action())
            <div class="badge sale">{{ $product->get_discount() }}</div>
        @endif
    </div>

    <!-- OBRAZOK PRODUKTU -->
    <a href="{{ route('product_detail',[$product->category->slug,$product->slug,$product->id]) }}"
       class="product__image">
        @if (is_set($product->image))
            <div>
                <img src="{{ image_get_thumbnail(asset('/storage/'.$product->image),'mini') }}">
            </div>
        @else
            <div class="mb-6 mt-3"></div>
        @endif
    </a>

    <!-- NAZOV PRODUKTU -->
    <div class="product__heading">
        <a class="category"
           href="{{ route('category',[$product->category->slug,$product->category->id]) }}">{{ $product->category->name }}</a>
        <a class="heading"
           href="{{ route('product_detail',[$product->category->slug,$product->slug,$product->id]) }}">{{ $product->name }}</a>
    </div>

    <!-- OBJEDNAVKOVY FORMULAR -->
    @if ($product->variants()->count() > 0)
    <form action="{{ route('cart') }}" method="post">
        @csrf
        <div class="d-none">
            @if ($product->active == 'NA')
                <input type="radio" name="variant_id" data-display-value="NEDOSTUPNÉ" value="0" checked="checked" />
                <input type="radio" name="variant_id" data-display-value="MOMENTÁLNE" value="0" checked="checked" />
            @else
                @foreach($product->variants() as $variant)
                    <input type="radio" name="variant_id" data-display-value="{{ $variant->weight }}"
                           @if ($variant->price < $variant->price_default)
                           data-regular-price="{{ format_money($variant->price_default) }}"
                           data-sale-price="{{ format_money($variant->price) }}"
                           @else data-regular-price="{{ format_money($variant->price) }}" @endif
                           value="{{ $variant->id }}" @if ($loop->first) checked="checked" @endif />
                @endforeach
            @endif
        </div>

        @if ($product->variants()->count() > 1)
        <div class="product__variant-selector btn btn-sm">
            <button type="button" name="button" class="prev-var">
                <img class="svg" src="{{ asset('images/arrow_slideshow_left.svg') }}" alt="">
            </button>
            <span class="variant-value text-center d-block"></span>
            <button type="button" name="button" class="next-var">
                <img class="svg" src="{{ asset('images/arrow_slideshow_right.svg') }}" alt="">
            </button>
        </div>
        @else
        <div class="product__variant-selector btn btn-sm">
            <span class="variant-value text-center d-block"></span>
        </div>
        @endif

        <div class="product__price">
            <span class="sale-price"></span>
            <span class="regular-price"></span>
        </div>

        <button type="submit" class="btn btn-orange w-100" @if ($product->price_default == 0) disabled @endif>
            do košíka
        </button>
    </form>
    @endif


</div>