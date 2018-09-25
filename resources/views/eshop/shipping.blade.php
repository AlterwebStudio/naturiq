@extends ('master')

@section ('content')

    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Domov</a></li>
                    <li class="breadcrumb-item active">Košík - Doprava a platba</li>
                </ol>
            </div>
        </div>
    </nav>

    <section class="shopping-cart-steps">

        <div class="shopping-cart-steps__step active">
            <div class="name">
                Dodacie údaje
            </div>
        </div>

        <div class="shopping-cart-steps__step-separator"></div>

        <div class="shopping-cart-steps__step active">
            <div class="name">
                Doprava a platba
            </div>
        </div>

        <div class="shopping-cart-steps__step-separator"></div>

        <div class="shopping-cart-steps__step">
            <div class="name">
                Sumarizácia
            </div>
        </div>

    </section>

    @include ('inc.partials.messages')

    <section>
        <div class="container py-5">
            <div class="row">



                <!-- LAVA STRANA -->
                <div class="col-lg-5">
                    <div class="form-header row">
                        <div class="col-auto">
                            <h3 class="form-header__name">
                                Objednávka
                            </h3>
                        </div>
                        <div class="col">
                            <div class="form-header__line"></div>
                        </div>
                        <div class="col-auto"><a href="{{ route('cart') }}">upraviť</a></div>
                    </div>



                    <!-- DESKTOPOVY KOSIK -->
                    <div class="shopping-cart d-none d-sm-block">

                        <div class="shopping-cart__body">

                            @forelse (Cart::content() as $item)
                                @include ('inc.partials.shopping_cart_row', ['item' => $item])
                            @empty
                                <p class="alert alert-light">Vás košík je zatiaľ prázdny. Začnite v kategórií <a href="{{ route('eshop') }}">E-shop</a>.</p>
                            @endforelse

                            @if (session()->has('coupon'))
                                @include ('inc.partials.shopping_cart_row_coupon', ['coupon' => \App\Coupon::get()])
                            @endif

                        </div>
                        <div class="shopping-cart__footer col-12">
                            <div class="row">
                                <div class="col text-left">
                                    <div class="text-bg font-weight-bold">Celkom s DPH:</div>
                                    <div class="text-sm">Celkom bez DPH:</div>
                                </div>
                                <div class="col text-right">
                                    <div class="text-bg font-weight-bold">{{ Cart::total() }} &euro;</div>
                                    <div class="text-sm">{{ Cart::subtotal() }} &euro;</div>
                                </div>
                            </div>
                        </div>

                    </div>


                    <!-- MOBILNY KOSIK -->
                    <div class="shopping-cart mobile d-sm-none">

                        <div id="mobile-order" class="shopping-cart__body">
                            @foreach (Cart::content() as $item)
                                @include ('inc.partials.shopping_cart_row', ['item' => $item])
                            @endforeach

                            @include ('inc.partials.shopping_cart_row_other')
                        </div>
                        <div class="shopping-cart__footer col-12">
                            <div class="row">
                                <div class="col-auto text-left">
                                    <div class="text-bg font-weight-bold">Celkom s DPH:</div>
                                    <div class="text-sm">Celkom bez DPH:</div>
                                </div>
                                <div class="col text-right">
                                    <div class="text-bg font-weight-bold">{{ Cart::total() }} &euro;</div>
                                    <div class="text-sm">{{ Cart::subtotal() }} &euro;</div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>


                <div class="col-lg-7">
                    <form id="shopping-cart-payment-and-delivery" action="{{ route('eshop.shipping_payment') }}" method="post" class="validate-form">
                        @csrf
                        <div class="row">
                            <!-- Prava CAST REGISTRACIE  -->
                            <div class="col-lg-12 mt-5 mt-lg-0">
                                <!-- OSOBNE UDAJE -->
                                <div class="form-header row">
                                    <div class="col-auto">
                                        <h3 class="form-header__name">
                                            Doprava
                                        </h3>
                                    </div>
                                    <div class="col">
                                        <div class="form-header__line"></div>
                                    </div>
                                </div>

                                <div class="row">

                                    @foreach ($shippings as $shipping)
                                    <div class="col-md-3 col-6">
                                        <label for="doprava{{$loop->iteration}}" class="shopping-cart__method">
                                            <input type="radio" id="doprava{{$loop->iteration}}" name="shipping_id" class="required" value="{{ $shipping->id }}"/>
                                            <div class="method">
                                                <figure>
                                                    <img src="https://via.placeholder.com/150x150/f5f5f5/736250">
                                                </figure>
                                                <span class="method-name">{{ $shipping->name }}</span>
                                                <span class="method-price">+ {{ format_money($shipping->price) }}</span>
                                            </div>
                                        </label>
                                    </div>
                                    @endforeach

                                </div>
                            </div>
                        </div>


                        <!-- PLATBA -->

                        <div class="row">
                            <!-- Prava CAST REGISTRACIE  -->
                            <div class="col-lg-12 mt-5 mt-lg-0">
                                <!-- OSOBNE UDAJE -->
                                <div class="form-header row">
                                    <div class="col-auto">
                                        <h3 class="form-header__name">
                                            Platba
                                        </h3>
                                    </div>
                                    <div class="col">
                                        <div class="form-header__line"></div>
                                    </div>
                                </div>

                                <div class="row">

                                    @foreach ($payments as $payment)
                                    <div class="col-md-3 col-6">
                                        <label for="platba{{$loop->iteration}}" class="shopping-cart__method">
                                            <input type="radio" id="platba{{$loop->iteration}}" name="payment_id" class="required" value="{{ $payment->id }}" />
                                            <div class="method">
                                                <figure>
                                                    <img src="https://via.placeholder.com/150x150/f5f5f5/736250">
                                                </figure>
                                                <span class="method-name">{{ $payment->name }}</span>
                                                <span class="method-price">+ {{ format_money($payment->price) }}</span>
                                            </div>
                                        </label>
                                    </div>
                                    @endforeach

                                </div>
                                <!-- KONIEC SEKCIE FORMULARU -->

                                <div class="form-group mt-4 text-right">
                                    <div class="row">
                                        <div class="col-md-auto order-2 text-left">
                                            <a href="{{ route('cart') }}" class="btn btn-outline-nq-70 w-100">Dodacie údaje</a>
                                        </div>
                                        <div class="col-md-auto ml-auto order-1 order-md-2 mb-3 mb-md-0 text-right">
                                            <button type="submit" class="btn btn-orange w-100" name="subm">Sumarizácia
                                            </button>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                </div>


                <!-- KONIEC FORMULARU -->
                </form>

            </div>
        </div>

    </section>

@endsection