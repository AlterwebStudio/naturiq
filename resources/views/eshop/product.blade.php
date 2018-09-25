@extends ('master')

@section ('content')

    <!-- BREADCRUMBS -->
    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Domov</a></li>
                    <li class="breadcrumb-item"><a href="/eshop">E-shop</a></li>
                    <li class="breadcrumb-item"><a href="{{ route('category', [$product->category->slug, $product->category->id]) }}">{{ $product->category->name }}</a></li>
                    <li class="breadcrumb-item active">{{ $product->name }}</li>
                </ol>
            </div>
        </div>
    </nav>


    <!-- PRODUCT -->
    <section class="product-page py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-5">

                    <!-- HLAVNA SLIDESHOW PRODUKTU -->
                    <div class="product-page__main-slideshow">

                        <!-- ODZNAKY LAVA STRANA / -->
                        <div class="product__badges_left">
                            @foreach ($product->tags as $tag)
                                <div class="badge {{ $tag->class }}">{{ $tag->name }}</div>
                            @endforeach
                            @if ($product->in_action())
                                <div class="badge sale">{{ $product->get_discount() }}</div>
                            @endif
                        </div>

                        <!-- ODZNAKY PRAVA STRANA / -->
                        <div class="product__badges_right">
                            @foreach ($product->attributes as $attribute)
                                <div class="badge"><img src="{{ asset('/storage/'.$attribute->icon) }}" title="{{ $attribute->title }}" /></div>
                            @endforeach
                        </div>

                        <div class="row">
                            <div class="col-2 d-none d-lg-flex align-items-center">
                                <div class="directional-arrow prev">
                                    <img class="svg" src="/images/arrow_slideshow_left.svg" alt="">
                                </div>
                            </div>
                            <div class="col-10 mx-auto col-lg-8 slideshow">
								@for ($i=0; $i < 4; $i++)
                                <div class="slide">
                                    <img src="{{ asset('/storage/'.$product->image) }}" alt="">
                                </div>
								@endfor
                            </div>
                            <div class="col-2 d-none d-lg-flex align-items-center">
                                <div class="directional-arrow next">
                                    <img class="svg" src="/images/arrow_slideshow_right.svg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- PRODUCT GALLERY - SPODNA SLIDESHOW KTORA OVLADA TU HLAVNU -->
                    <div class="product-page__nav-slideshow  mb-5 mb-lg-0">
                        @for ($i=0; $i < 4; $i++)
                        <div class="slide">
                            <img src="/images/produkty/1.png" alt="">
                        </div>
						@endfor
                    </div>

                </div>
                <div class="col-lg-6 ml-auto">

                    <a href="{{ route('category', [$product->category->slug, $product->category->id]) }}">{{ $product->category->name }}</a>
                    <h1>
                        {{ $product->name }}
                        <span class="line"></span>
                    </h1>

                    <span class="label">Zloženie</span>

                    {!! $product->contents !!}

                    <span class="label">
							Gramáž
						</span>

                    <form id="prodcut" action="{{ route('cart') }}" method="post">

                        @csrf

                        <div>
                            <div class="btn-group">
                                @foreach($product->variants() as $variant)
                                    <label for="variant{{$loop->iteration}}" class="btn">
                                        <input id="variant{{$loop->iteration}}" type="radio" name="variant_id" data-display-value="{{ $variant->weight }}" data-regular-price="{{ format_money($variant->price_default) }}" data-sale-price="{{ format_money($variant->price_action) }}" value="{{ $variant->id }}" @if($product->id == $variant->id) checked="checked" @endif>
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
                                <button class="btn btn-orange btn-sm w-100" type="submit">do košíka</button>
                            </div>
                        </div>

                    </form>



                </div>
            </div>

            <div class="row pt-5">

                <div class="col-12">
                    <ul class="nav nav-tabs tab-menu" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">POPIS PRODUKTU</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">NUTRIČNÉ HODNOTY</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">V RECEPTOCH</a>
                        </li>
                    </ul>
                </div>


                <div class="col-12">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

                            {!! $product->description !!}

                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">

                            {!! $product->nutritions !!}

                        </div>
                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                            <p>
                                <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. A eos, mollitia quibusdam vitae rerum officiis, libero animi? Temporibus, ratione, debitis! Fugiat modi perspiciatis, provident quos ea ex at? Optio, porro.</span>
                                <span>Itaque perspiciatis, quas harum at adipisci odit. Hic nesciunt, incidunt fugit dicta delectus mollitia veniam in magni, consequatur! Quo nesciunt itaque, et eius ratione exercitationem aut quae debitis doloribus modi.</span>
                                <span>Laborum, dolorum delectus cumque iure eveniet optio non deleniti quod. Pariatur, ipsam, fuga quasi tempore mollitia perspiciatis expedita at dignissimos animi officia omnis molestias aliquam maiores alias cupiditate earum facilis!</span>
                            </p>
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
		@include ('inc.partials.slideshows.product-slideshow')
    </section>



@endsection


@section ('custom-js-scripts')

    <script type="text/javascript">
        $(document).ready(function(){
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