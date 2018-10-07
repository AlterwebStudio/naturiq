@foreach ($categories as $category)
    <div class="col-lg mb-4 mb-lg-0 col-6 product-categories__icon">
        <a href="{{ route('category',[$category->slug,$category->id]) }}">
            <div class="icon">
                <img src="{{ asset('storage/'.$category->icon) }}" alt="">
            </div>
            {{ $category->name }}
        </a>
    </div>
@endforeach