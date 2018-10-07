@extends ('master')

@section ('content')

<!-- BREADCRUMBS -->
<nav aria-label="breadcrumb" class="breadcrumbs">
    <div class="container">
        <div class="row">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Domov</a></li>
                <li class="breadcrumb-item"><a href="{{ route('recipes') }}">Recepty</a></li>
                <li class="breadcrumb-item active">{{ $recipe->title }}</li>
            </ol>
        </div>
    </div>
</nav>


<!-- RECEPT -->
<section class="py-5 recipe-page">
    <div class="container">
        <div class="row">

            <!-- LAVA STRANA INGREDIENCIE + TAGY -->
            <div class="col-md-3">
                <div class="recipe-page__sidebar">


                    <h2>
                        Ingrediencie
                        <div class="line"></div>
                    </h2>
                    <!-- ZOZNAM INGREDIENCII  -->
                    <div class="row ingredients mb-4">
                        {!! $recipe->ingredients !!}
                    </div>

                    <h2>
                        Tagy receptu
                        <div class="line"></div>
                    </h2>
                    <div class="tags">
                        @foreach ($recipe->tags as $tag)
                            <div class="tag {{ $tag->class }}">{{ $tag->name }}</div>
                        @endforeach
                    </div>
                </div>
            </div>

            <!-- PRAVA STRANA RECEPTU -->
            <div class="col-md-9">
                <h1>
                    {{ $recipe->title }}
                    <div class="line"></div>
                </h1>

                <!-- GALLERY -->
                @if (is_set($recipe->gallery))
                <div class="row content-gallery">
                    <div class="col-12">

                        <div class="content-gallery-large-container">
                            <div class="content-gallery-large-controls">
                                <div class="directional-arrow prev slick-arrow" style="display: flex;">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 10 16.5" enable-background="new 0 0 10 16.5" xml:space="preserve" class="svg replaced-svg">
										<path fill="none" stroke="#FFFFFF" stroke-width="2" d="M8.5,15.8L1,8.2l7.5-7.5"></path>
										</svg>
                                </div>
                                <div class="directional-arrow next slick-arrow" style="display: flex;">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 10 16.5" enable-background="new 0 0 10 16.5" xml:space="preserve" class="svg replaced-svg">
										<path fill="none" stroke="#FFFFFF" stroke-width="2" d="M1.2,0.7l7.5,7.5l-7.5,7.5"></path>
										</svg>
                                </div>
                            </div>

                            {{--VELKE NAHLADY - musia korespondovat so zmenseninami v content-gallery-small--}}
                            <div class="content-gallery-large">
                                <div class="gallery-item">
                                    <img src="{{ image_get_thumbnail(asset('/storage/'.$recipe->illustration),'medium') }}" alt="">
                                </div>
                                @foreach (json_decode($recipe->gallery) as $image)
                                <div class="gallery-item">
                                    <img src="{{ image_get_thumbnail(asset('/storage/'.$image),'medium') }}" alt="">
                                </div>
                                @endforeach

                            </div>
                        </div>


                        {{--MALE NAHLADY - musia korespondovat s velkymi content-gallery-large--}}
                        <div style="overflow-y:visible; overflow-x:hidden;">
                            <div class="content-gallery-small">
                                <div class="gallery-item">
                                    <img src="{{ image_get_thumbnail(asset('/storage/'.$recipe->illustration),'thumb') }}" alt="">
                                </div>
                                @foreach (json_decode($recipe->gallery) as $image)
                                    <div class="gallery-item">
                                        <img src="{{ image_get_thumbnail(asset('/storage/'.$image),'thumb') }}" alt="">
                                    </div>
                                @endforeach

                            </div>
                        </div>

                    </div>
                </div>
                @endif
                <!-- END GALLERY -->


                <!-- POSTUP -->
                <div class="row mb-4">
                    <div class="col-12">
                        <h2>
                            Postup
                            <div class="line"></div>
                        </h2>

                        {!! $recipe->content !!}

                    </div>
                </div>
                <!-- END POSTUP  -->

                <div class="row align-items-center mb-3">
                    <div class="col-12">
                        <h2>Na prípravu sme použili
                            <span class="line"></span>
                        </h2>
                    </div>
                    @foreach ($recipe->products as $product)
                    <div class="col-lg-3 col-sm-6 mb-5">
                        @include('inc.partials.product', ['product'=>$product])
                    </div>
                    @endforeach
                </div>

            </div>
        </div>

    </div>
</section>

@endsection

@section ('custom-js-scripts')
    <script type="text/javascript">
        $(document).ready(function(){

            $('.content-gallery-large').slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: true,
                fade: true,
                asNavFor: '.content-gallery-small',
                prevArrow: $('.content-gallery-large-controls .prev'),
                nextArrow: $('.content-gallery-large-controls .next'),
            });

            $('.content-gallery-small').slick({
                slidesToShow: 5,
                slidesToScroll: 1,
                asNavFor: '.content-gallery-large',
                dots: false,
                arrows: false,
                centerMode: true,
                focusOnSelect: true,
                responsive: [{
                    breakpoint: 992,
                    settings: {
                        slidesToShow: 5,
                        slidesToScroll: 1,
                    }
                },
                    {
                        breakpoint: 768,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 1
                        }
                    },
                    {
                        breakpoint: 526,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 1
                        }
                    }
                ]
            });


            // PRODUKTOVA SLIDESHOW
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