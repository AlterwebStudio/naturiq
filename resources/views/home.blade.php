@extends ('master')

@section ('content')

@include ('inc.partials.slideshows.home_slideshow')

<section class="py-5">
    <!-- Product row -->
    <div class="container">
        <div class="row product-categories">
            <div class="col-lg mb-4 mb-lg-0 col-6 product-categories__icon">
                <a href="/product"><div class="icon">
                        <img src="images/icons/.svg" alt="">
                    </div>
                    Morušový čaj</a>
            </div>

            <div class="col-lg mb-4 mb-lg-0 col-6 product-categories__icon">
                <a href="/product"><div class="icon">
                        <img src="images/icons/.svg" alt="">
                    </div>
                    Sušené ovocie</a>
            </div>

            <div class="col-lg mb-4 mb-lg-0 col-6 product-categories__icon">
                <a href="/product"><div class="icon">
                        <img src="images/icons/.svg" alt="">
                    </div>
                    Trail mix</a>
            </div>


            <div class="col-lg mb-4 mb-lg-0 col-6 product-categories__icon">
                <a href="/product"><div class="icon">
                        <img src="images/icons/.svg" alt="">
                    </div>
                    Müesli bezlepkové</a>
            </div>

            <div class="col-lg mb-4 mb-lg-0 col-6 product-categories__icon">
                <a href="/product"><div class="icon">
                        <img src="images/icons/.svg" alt="">
                    </div>
                    Müesli original</a>
            </div>

            <div class="col-lg mb-4 mb-lg-0 col-6 product-categories__icon">
                <a href="/product"><div class="icon">
                        <img src="images/icons/.svg" alt="">
                    </div>
                    Orechy</a>
            </div>

            <div class="col-lg mb-4 mb-lg-0 col-6 product-categories__icon">
                <a href="/product"><div class="icon">
                        <img src="images/icons/.svg" alt="">
                    </div>
                    Vločky</a>
            </div>

            <div class="col-lg mb-4 mb-lg-0 col-6 product-categories__icon">
                <a href="/product"><div class="icon">
                        <img src="images/icons/.svg" alt="">
                    </div>
                    Semienka</a>
            </div>

        </div>
    </div>
</section>


<section class="pt-5 pb-4">

    <!-- NAJOBLUBENEJSIE PRODUKTY  -->
    <div class="container">
        <div class="row align-items-center mb-3 section-heading">
            <div class="col">
                <h2>
                    Najobľúbenejšie produkty
                    <span class="line"></span>
                </h2>
            </div>
            <div class="col text-right">
                <a href="#">
                    Všetky produkty
                </a>
            </div>
        </div>
    </div>
    @include('inc.partials.slideshows.product-slideshow', ['featured'=>$featured])

</section>

<!-- AKCIOVÝ BANNER  -->
<section class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-12">
                @include ('inc.partials.shop-banner')
            </div>
        </div>
    </div>
</section>


<!-- AKCIOVE PRODUKTY  -->
<section class="pt-4 pb-5">
    <div class="container">
        <div class="row align-items-center  mb-3  section-heading">
            <div class="col">
                <h2>
                    Akcia
                    <span class="line"></span>
                </h2>
            </div>
            <div class="col text-right">
                <a href="#">
                    Všetky produkty
                </a>
            </div>
        </div>
    </div>

    <!-- slideshow  -->
    @include('inc.partials.slideshows.product-slideshow', ['featured'=>$sale])

</section>
<!-- END AKCIOVE PRODUKTY -->

<section class="alt-bg-100 py-5 py-lg-6">

    <div class="container">
        <div class="row">
            <div class="col-md-4 content-banner-container">
                <a class="content-banner banner-small blue">
                    <div class="banner-text">
                        <img src="images/banners/e-shop.png" alt="">
                    </div>
                </a>
                <a class="content-banner banner-small pink">
                    <div class="banner-text">
                        <img src="images/banners/pribeh.png" alt="">
                    </div>
                </a>
            </div>
            <div class="col-md-4 content-banner-container">
                <a class="content-banner banner-small green">
                    <div class="banner-text">
                        <img src="images/banners/kde_nas_najdete.png" alt="">
                    </div>
                </a>
                <a class="content-banner banner-small yellow">
                    <div class="banner-text">
                        <img src="images/banners/vo-velkom.png" alt="">
                    </div>
                </a>
            </div>
            <div class="col-md-4 content-banner-container">
                <a class="content-banner banner-big purple">
                    <div class="banner-text">
                        <img src="images/banners/recepty.png" alt="">
                    </div>
                </a>
            </div>
        </div>
    </div>

</section>

@endsection

@section ('custom-js-scripts')


    <!-- Custom JS Scripts -->
    <script type="text/javascript">
        const currentSlideNr = document.querySelector(".header-slideshow__dots .dots_nr .actual");
        const totalSlideNr = document.querySelector(".header-slideshow__dots .dots_nr .total");
        const totalSlides = document.querySelectorAll(".header-slideshow .header-slideshow__slide");


        $(document).ready(function() {
            // Aktivujeme hlavnu slideshow
            const slideshowEl = $('.header-slideshow__container');
            // VSETKY VIDEA V SLIDESHOW
            const videos = $('.header-slideshow__container video');
            const curr = $('.header-slideshow__container').find(".slick-current");
            const hasVid = curr.find(".header-slideshow__bg").has('video').length;



            totalSlideNr.innerHTML = totalSlides.length;



            videos.each(function(key, value) {
                value.addEventListener('ended', function() {
                    //console.log('video skoncilo, spustam slick');
                    slideshowEl.slick('play');
                    slideshowEl.slick('slickNext');
                });
            });

            // AK MA PRVY SLIDE VIDEO, TAK HO SPUSTI, PAUZNI SLICK
            if (hasVid) {
                // console.log('ma video');
                const vid = curr.find(".header-slideshow__bg video");
                slideshowEl.slick('pause');
                vid[0].play();
            }

        }) // END doc ready


        $('.header-slideshow__container').on('afterChange', function(event, slick, currentSlide) {
            const slideshowVideos = $(".header-slideshow__slide:not(.slick-current) .header-slideshow__bg video");

            slideshowVideos.each(function(key, value) {
                value.pause();
                value.currentTime = 0;
            })
            const curr = $('.header-slideshow__container').find(".slick-current");
            const hasVid = curr.find(".header-slideshow__bg").has('video').length;
            const vid = curr.find(".header-slideshow__bg video");



            //Ak bola pred tym playhead zastavena tak ju spusti

            $('.header-slideshow__container').slick('play');

            // Ak ma aktualny slide video, spusti ho
            if (vid[0]) {
                $('.header-slideshow__container').slick('pause');
                vid[0].play();
            }
        });

        $('.header-slideshow__container').on('beforeChange', function(event, slick, currentSlide, nextSlide) {
            const next_Slide = $('.header-slideshow__container').find(".header-slideshow__bg").eq(nextSlide);

            currentSlideNr.innerHTML = nextSlide + 1;

            // Ak ma aktualny slide video, spusti ho
            if (next_Slide.has('video').length) {
                $('.header-slideshow__container').slick('pause');
                //next_Slide.find('video').play();
                next_Slide.find('video')[0].play()
            }
        });


        const allProductSlideshows = document.querySelectorAll('.product-slideshow_container');

        allProductSlideshows.forEach(function(single) {
            //console.log(single);
            const slideShow = single.querySelector('.product-slideshow');
        })

        $('.product-slideshow_container').each(function() {
            const slideShow = $(this).find('.product-slideshow');

            slideShow.slick({
                fade: false,
                dots: true,
                speed: 850,
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
                        speed: 550,
                        infinite: true,
                        dots: true
                    }
                },
                    {
                        breakpoint: 768,
                        settings: {
                            speed: 250,
                            slidesToShow: 2,
                            slidesToScroll: 2,
                            dots: false
                        }
                    },
                    {
                        breakpoint: 526,
                        settings: {
                            speed: 250,
                            slidesToShow: 1,
                            slidesToScroll: 1,
                            dots: false
                        }
                    }
                ],
            })

        });



        $('.header-slideshow__container').slick({
            fade: true,
            dots: true,
            speed: 950,
            cssEase: "ease-in-out",
            lazyLoad: 'progressive',
            arrows: true,
            infinite: true,
            dotsClass: 'pagina',
            draggable: true,
            cssEase: 'ease-out',
            autoplay: true,
            autoplaySpeed: 6000,
            pauseOnHover: true,
            appendDots: $('.header-slideshow__dots .dots'),
            //pauseOnFocus: true,
            prevArrow: $('.directional .prev'),
            nextArrow: $('.directional .next'),
            slidesToShow: 1,
            slidesToScroll: 1,
        });
    </script>

@endsection