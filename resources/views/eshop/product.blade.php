@extends ('master')

@section ('content')

    <!-- BREADCRUMBS -->
    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">Domov</a></li>
                    <li class="breadcrumb-item"><a href="{{ route('eshop') }}">E-shop</a></li>
                    <li class="breadcrumb-item"><a href="{{ route('category', [$product->category->slug, $product->category->id]) }}">{{ $product->category->name }}</a></li>
                    <li class="breadcrumb-item active">{{ $product->name }}</li>
                </ol>
            </div>
        </div>
    </nav>


    {{--PRODUCT--}}
    <section class="product-page py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-5">

                    {{--HLAVNA SLIDESHOW PRODUKTU--}}
                    <div class="product-page__main-slideshow">

                        {{--ODZNAKY LAVA STRANA--}}
                        <div class="product__badges_left">
                            @foreach ($product->tags as $tag)
                                <div class="badge {{ $tag->class }}">{{ $tag->name }}</div>
                            @endforeach
                            @if ($product->in_action())
                                <div class="badge sale">{{ $product->get_discount() }}</div>
                            @endif
                        </div>

                        {{--ODZNAKY PRAVA STRANA--}}
                        <div class="product__badges_right">
                            @foreach ($product->attributes as $attribute)
                                <div class="badge"><img src="{{ asset('/storage/'.$attribute->icon) }}" title="{{ $attribute->title }}" /></div>
                            @endforeach
                        </div>

                        {{--HLAVNA SLIDESHOW--}}
                        @if (is_set($product->image) or is_set($product->gallery))
                        <div class="row">

                            <div class="col-12 mx-auto col-lg-8 slideshow">
                                <div class="slide">
                                    <img src="{{ image_get_thumbnail(asset('/storage/'.$product->image),'medium') }}" alt="">
                                </div>
                                @if (is_set($product->gallery))
								@foreach (json_decode($product->gallery) as $image )
                                <div class="slide">
                                    <img src="{{ image_get_thumbnail(asset('/storage/'.$image),'medium') }}" alt="">
                                </div>
								@endforeach
                                @endif
                            </div>

                        </div>
                        @endif
                    </div>

                    {{--SPODNA SLIDESHOW - OVLADA HLAVNU--}}
                    @if (is_set($product->image) OR is_set($product->gallery))
                    <div class="product-page__nav-slideshow  mb-5 mb-lg-0">
                        <div class="slide">
                            <img src="{{ image_get_thumbnail(asset('/storage/'.$product->image),'cropped') }}" alt="">
                        </div>
                        @if (is_set($product->gallery))
                        @foreach (json_decode($product->gallery) as $image )
                            <div class="slide">
                                <img src="{{ image_get_thumbnail(asset('/storage/'.$image),'cropped') }}" alt="">
                            </div>
                        @endforeach
                        @endif
                    </div>
                    @endif

                </div>
                <div class="col-lg-6 ml-auto">

                    <a href="{{ route('category', [$product->category->slug, $product->category->id]) }}">{{ $product->category->name }}</a>
                    <h1>
                        {{ $product->name }}
                        <span class="line"></span>
                    </h1>

                    <span class="label">Popis</span>

                    {!! $product->description !!}

                    @if ($product->active=='yes' and $product->price > 0)

                    <span class="label">Gramáž</span>
                    <form id="product" action="{{ route('cart') }}" method="post">

                        @csrf

                        <div>
                            <div class="btn-group">
                                @foreach($product->variants() as $variant)
                                    <label for="variant{{$loop->iteration}}" class="btn">
                                        <input id="variant{{$loop->iteration}}" type="radio" name="variant_id" data-display-value="{{ $variant->weight }}" data-regular-price="{{ format_money($variant->price_default) }}" @if (regular_price($variant->price_action)) data-sale-price="{{ $variant->price_action }}" @endif value="{{ $variant->id }}" @if($product->id == $variant->id) checked="checked" @endif>
                                        <span>{{ $variant->weight }}</span>
                                    </label>
                                @endforeach
                            </div>
                        </div>

                        <span class="label">
								Cena
							</span>

                        <div class="product__price">
                            <span class="sale-price"></span>
                            <span class="regular-price"></span>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 mb-3 mb-lg-0">
                                <div class="input-group input-group-sm counter">
                                    <div class="input-group-prepend">
                                        <button class="btn btn-sm btn-minus">
                                            -
                                        </button>
                                    </div>
                                    <input name="quantity" value="1" type="text" class="form-control form-control-sm text-center counter_field" placeholder="Počet">
                                    <div class="input-group-append">
                                        <button class="btn btn-sm btn-plus">
                                            +
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-5">
                                <button class="btn btn-orange w-100" type="submit">do košíka</button>
                            </div>
                        </div>

                    </form>
                    @else

                        <p class="alert alert-warning">PRODUKT JE MOMENTÁLNE NEDOSTUPNÝ NA OBJEDNANIE</p>

                    @endif



                </div>
            </div>

            <div class="row pt-5">

                <div class="col-12">
                    <ul class="nav nav-tabs tab-menu" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">ZLOŽENIE PRODUKTU</a>
                        </li>
                        @if ($product->details)
                        <li class="nav-item">
                            <a class="nav-link" id="home-tab" data-toggle="tab" href="#desc" role="tab" aria-controls="desc" aria-selected="true">VIAC O PRODUKTE</a>
                        </li>
                        @endif
                        @if (is_set($product->nutritions))
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">NUTRIČNÉ HODNOTY</a>
                        </li>
                        @endif
                        @if ($product->recepts->count() > 0)
                        <li class="nav-item">
                            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">V RECEPTOCH</a>
                        </li>
                        @endif
                        @if ($product->storage)
                        <li class="nav-item">
                            <a class="nav-link" id="storage-tab" data-toggle="tab" href="#storage" role="tab" aria-controls="storage" aria-selected="false">PODMIENKY SKLADOVANIA</a>
                        </li>
                        @endif
                    </ul>
                </div>


                <div class="col-12">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

                            {!! $product->contents !!}

                        </div>
                        <div class="tab-pane fade show active" id="desc" role="tabpanel" aria-labelledby="desc-tab">

                            {!! $product->details !!}

                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">

                            {!! $product->nutritions !!}

                        </div>
                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                            <div class="row">
                            @foreach ($product->recepts as $recept)
                                <div class="col-sm-12 col-lg-4">
                                @include ('inc.partials.recipe', ['recept'=>$recept])
                                </div>
                            @endforeach
                            </div>
                        </div>
                        <div class="tab-pane fade" id="storage" role="tabpanel" aria-labelledby="storage-tab">

                            {!! $product->storage !!}

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>




    <!-- INI TIEZ KUPILI - PRODUKTY SLIDESHOW  -->
    <section class="pt-4 pb-5 alt-bg-100">
        <div class="container">
            <div class="row align-items-center mb-3 section-heading">
                <div class="col">
                    <h2>Iní tiež kúpili
                        <span class="line"></span>

                    </h2>
                </div>
                <div class="col text-right">
                    <a href="{{ route('featured') }}">
                        Všetky produkty
                    </a>
                </div>
            </div>
        </div>
        <!-- slideshow  -->
        <?php $featured = $product->get_featured(false); ?>
        @include ('inc.partials.slideshows.product-slideshow', ['featured'=>$featured])
    </section>



@endsection


@section ('custom-js-scripts')

<script type="text/javascript">
  $(document).ready(function() {
    $('.product-slideshow_container').each(function() {
      const slideShow = $(this).find('.product-slideshow');

      slideShow.slick({
        fade: false,
        dots: true,
        speed: 250,
        cssEase: "ease-in-out",
        lazyLoad: 'progressive',
        arrows: true,
        infinite: true,
        dotsClass: 'paging',
        draggable: true,
        cssEase: 'ease-in-out',
        autoplay: true,
        autoplaySpeed: 6000,
        pauseOnHover: true,
        //pauseOnFocus: true,
        prevArrow: $(this).find('.prev'),
        nextArrow: $(this).find('.next'),
        slidesToShow: 4,
        slidesToScroll: 4,
        responsive: [{
            breakpoint: 992,
            settings: {
              slidesToShow: 3,
              slidesToScroll: 3,
              infinite: true,
              dots: true
            }
          },
          {
            breakpoint: 768,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 2,
              dots: false,
            }
          },
          {
            breakpoint: 526,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1,
              dots: false,
            }
          }
        ],
      })

      $('.product-page__main-slideshow .slideshow').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: true,
        fade: true,
        infinite: false,
        draggable: false,
        asNavFor: '.product-page__nav-slideshow',
        prevArrow: $('.product-page__main-slideshow .prev'),
        nextArrow: $('.product-page__main-slideshow .next'),
      });

      $('.product-page__nav-slideshow').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        asNavFor: '.product-page__main-slideshow .slideshow',
        dots: false,
        arrows: false,
        infinite: false,
        //centerMode: true,
        focusOnSelect: true,
        responsive: [{
            breakpoint: 992,
            settings: {
              slidesToShow: 4,
              slidesToScroll: 1,
            }
          },
          {
            breakpoint: 768,
            settings: {
              slidesToShow: 4,
              slidesToScroll: 1,
              dots: false,
            }
          },
          {
            breakpoint: 526,
            settings: {
              slidesToShow: 4,
              slidesToScroll: 1,
              dots: false,

            }
          }
        ]
      });

    });
  });
</script>

@endsection
