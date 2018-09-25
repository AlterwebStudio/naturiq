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
    <a href="{{ route('product_detail',[$product->category->slug,$product->slug,$product->id]) }}" class="product__image">
      <div>
        <img src="{{ image_get_thumbnail(asset('/storage/'.$product->image),'small') }}" alt="{{ $product->name }}">
      </div>
    </a>

    <!-- NAZOV PRODUKTU -->
    <div class="product__heading">
      <a class="category" href="{{ route('category',[$product->category->slug,$product->category->id]) }}">{{ $product->category->name }}</a>
      <a class="heading" href="{{ route('product_detail',[$product->category->slug,$product->slug,$product->id]) }}">{{ $product->name }}</a>
    </div>

    <!-- OBJEDNAVKOVY FORMULAR -->
    <form action="{{ route('cart') }}" method="post">
      @csrf
      <div class="d-none">
          @forelse($product->childs as $variant)
              <input type="radio" name="variant_id" data-display-value="{{ $variant->weight }}" data-regular-price="{{ $variant->price_default }}" data-sale-price="{{ $variant->price_action }}" value="{{ $variant->id }}" @if ($loop->first) checked="checked" @endif>
          @empty
              <input type="radio" name="variant_id" data-display-value="{{ $product->weight }}" data-regular-price="{{ $product->price_default }}" data-sale-price="{{ $product->price_action }}" value="{{ $product->id }}" checked="checked">
          @endforelse
      </div>

      <div class="product__variant-selector btn btn-sm">
        <button type="button" name="button" class="prev-var">
          <img class="svg" src="/images/arrow_slideshow_left.svg" alt="">
        </button>
        <span class="variant-value"></span>
        <button type="button" name="button" class="next-var">
          <img class="svg" src="/images/arrow_slideshow_right.svg" alt="">
        </button>
      </div>

      <div class="product__price">
        <span class="sale-price"></span>
        <span class="regular-price"></span>
      </div>

      <button type="submit" class="btn btn-orange w-100">
        do košíka
      </button>
    </form>


  </div>