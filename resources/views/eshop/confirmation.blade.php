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
                    <form id="register-form-wholesale" action="{{ route('eshop.confirmation') }}" method="post" class="validate-form">
                        @csrf
                        <div class="row">
                            <!-- Prava CAST REGISTRACIE  -->
                            <div class="col-lg-12 mt-5 mt-lg-0">
                                <!-- OSOBNE UDAJE -->
                                <div class="form-header row">
                                    <div class="col-auto">
                                        <h3 class="form-header__name">
                                            Osobné údaje
                                        </h3>
                                    </div>
                                    <div class="col">
                                        <div class="form-header__line"></div>
                                    </div>
                                    <div class="col-auto">
                                        <a href="{{ route('cart') }}">upraviť</a>
                                    </div>
                                </div>

                                <div>

                                    <div class="form-group">
                                        <label for="name-surname">Meno a priezvisko</label>
                                        <span class="filled-data">{{ $client->name }}</span>
                                    </div>

                                    <!-- E mail + Tel c -->
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="eml">E-mail</label>
                                                <span class="filled-data">{{ $client->email }}</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="tel">Telefónne číslo</label>
                                                <span class="filled-data">{{ $client->phone }}</span>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Mesto + ulica -->
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="city">Mesto</label>
                                                <span class="filled-data">{{ $client->city }}</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="street">Ulica a popisné číslo</label>
                                                <span class="filled-data">{{ $client->street }}</span>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- PSC + Krajina -->
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label for="psc">PSČ</label>
                                                <span class="filled-data">{{ $client->zip }}</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="form-group">
                                                <label for="country">Krajina</label>
                                                <span class="filled-data">{{ $client->country }}</span>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <!-- KONIEC SEKCIE FORMULARU -->


                                <!-- INA DORUCOVACIA -->
                                <div class="form-header row mt-3">
                                    <div class="col-auto">
                                        <h3 class="form-header__name">
                                            INÁ DORUČOVACIA ADRESA
                                        </h3>
                                    </div>
                                    <div class="col">
                                        <div class="form-header__line"></div>
                                    </div>
                                    <div class="col-auto">
                                        <a href="{{ route('cart') }}">upraviť</a>
                                    </div>
                                </div>

                                <div>

                                @if (is_set($client->address->street))

                                    <!-- Mesto + ulica -->
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="delivery-street">Ulica a popisné číslo</label>
                                                <span class="filled-data">{{ $client->address->street }}</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="delivery-city">Mesto</label>
                                                <span class="filled-data">{{ $client->address->city }}</span>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- PSC + Krajina -->
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label for="delivery-psc">PSČ</label>
                                                <span class="filled-data">{{ $client->address->zip }}</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="form-group">
                                                <label for="delivery-country">Krajina</label>
                                                <span class="filled-data">{{ $client->address->country }}</span>
                                            </div>
                                        </div>
                                    </div>

                                @else

                                    <span class="filled-data">
                                    Totožná s fakturačnou
                                    </span>

                                @endif

                                </div>
                                <!-- KONIEC SEKCIE FORMULARU -->

                                <!-- Objednavka na firmu -->
                                <div class="form-header row mt-3">
                                    <div class="col-auto">
                                        <h3 class="form-header__name">
                                            Objednávka na firmu
                                        </h3>
                                    </div>
                                    <div class="col">
                                        <div class="form-header__line"></div>
                                    </div>
                                    <div class="col-auto">
                                        <a href="{{ route('cart') }}">upraviť</a>
                                    </div>
                                </div>

                                <div>

                                @if (is_set($client->company->name))

                                    <!-- MENO SPOLOČNOSTI -->
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="company-name">Názov spoločnosti</label>
                                                <span class="filled-data">{{ $client->company->name }}</span>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- ICO + DIC + IC DPH -->
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label for="company-id">IČO</label>
                                                <span class="filled-data">{{ $client->company->ico }}</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label for="company-tax-id">DIČ</label>
                                                <span class="filled-data">{{ $client->company->dic }}</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label for="company-vat-id">IČ DPH</label>
                                                <span class="filled-data">{{ $client->company->icdph }}</span>
                                            </div>
                                        </div>
                                    </div>

                                @else

                                    <span class="filled-data">
                                        Nie, objednáva súkromná osoba
                                    </span>

                                @endif

                                </div>
                                <!-- KONIEC SEKCIE FORMULARU -->


                                <div class="form-group mt-4 text-right" >
                                    <div class="row">
                                        <div class="col-md-auto order-2 text-left">
                                            <a href="kosik_2.php" class="btn btn-outline-nq-70 w-100">Doprava a platba</a>
                                        </div>
                                        <div class="col-md-auto ml-auto order-1 order-md-2 mb-3 mb-md-0  text-right">
                                            <button type="submit" class="btn btn-nq-blue w-100" name="subm">Objednať s povinnosťou platby</button>
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