@if (isset($banner))
<div class="shop-banner {{ $banner->background->class }}">
    <div class="row w-100">

        <div class="col-lg-5 mx-auto">
            <h2 class="shop-banner__heading">
        <span class="text-light">
          {{ $banner->title }}
        </span>
                {{ $banner->text }}
            </h2>
        </div>

        <div class="col-lg-5 shop-banner__hero">

            <div class="big-hero">
                <img src="{{ asset('storage/'.$banner->image) }}" alt="">
            </div>
            <div class="small-hero">
                <img src="{{ asset('storage/'.$banner->image) }}" alt="">
            </div>

        </div>
    </div>
</div>
@endif