@extends ('master')

@section ('content')

    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">Domov</a></li>
                    <li class="breadcrumb-item active">Košík - Dodacie údaje</li>
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

        <div class="shopping-cart-steps__step">
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
                <div class="col-lg-7">
                    <div class="form-header row">
                        <div class="col-auto">
                            <h3 class="form-header__name">
                                Objednávka
                            </h3>
                        </div>
                        <div class="col">
                            <div class="form-header__line"></div>
                        </div>
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
                                    <div class="text-bg font-weight-bold">Celkom:</div>
                                    <div class="text-sm">vrátane DPH</div>
                                    {{--<div class="text-sm">Celkom bez DPH:</div>--}}
                                </div>
                                <div class="col text-right">
                                    <div class="text-bg font-weight-bold">{{ format_money(App\Order::subtotal()) }}</div>
                                    {{--<div class="text-sm">{{ format_money( App\Order::subtotal() ) }}</div>--}}
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
                                    <div class="text-bg font-weight-bold">{{ format_money( App\Order::total() ) }}</div>
                                    <div class="text-sm">{{ format_money( App\Order::subtotal() ) }}</div>
                                </div>
                            </div>
                        </div>

                    </div>

                    @if (! session()->has('coupon') )
                    <div class="coupon col-12">
                        <form id="coupon-form" action="{{ route('cart.activate_coupon') }}" method="post" class="validate-form">
                            @csrf
                            <div class="coupon__row py-4">
                                <div class="col-lg-8 mb-2 mb-lg-0">
                                    <input type="text" id="coupon" name="coupon[code]" class="form-control required" data-invalid-response="Prosíme vyplňte kód zľavového kupónu" placeholder="Kód kupónu" />
                                    <div class="input_msg" data-id="coupon"></div>
                                </div>
                                <div class="col-lg-4">
                                    <button type="submit" class="btn btn-outline-orange w-100" name="coupon[activate]" >Aktivovať kupón</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    @endif

                </div>


                <div class="col-lg-5">
                    <form id="register-form-wholesale" action="{{ route('cart.register') }}" method="post" class="validate-form">
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
                                </div>

                                <div>

                                    <div class="form-group">
                                        <label for="name-surname">Meno a priezvisko*</label>
                                        <input id="name-surname" name="client[name]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte vaše meno a priezvisko"
                                               value="@if (is_set($client->name)){{ $client->name }}@else{{ old('client.name') }}@endif">
                                        <div class="input_msg" data-id="name-surname"></div>
                                    </div>

                                    <!-- E mail + Tel c -->
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="eml">E-mail*</label>
                                                <input id="eml" name="client[email]" class="form-control required" type="eml" data-invalid-response="Prosíme vyplňte váš e-mail"
                                                       value="@if (is_set($client->email)){{ $client->email }}@else{{ old('client.email') }}@endif">
                                                <div class="input_msg" data-id="eml"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="tel">Telefónne číslo*</label>
                                                <input id="tel" name="client[phone]" class="form-control required" type="tel" data-invalid-response="Prosíme vyplňte vaše telefónne číslo"
                                                       value="@if (is_set($client->phone)){{ $client->phone }}@else{{ old('client.phone') }}@endif">
                                                <div class="input_msg" data-id="tel"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Mesto + ulica -->
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="city">Mesto*</label>
                                                <input id="city" name="client[city]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte vaše mesto"
                                                       value="@if (is_set($client->city)){{ $client->city }}@else{{ old('client.city') }}@endif">
                                                <div class="input_msg" data-id="city"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="street">Ulica a popisné číslo*</label>
                                                <input id="street" name="client[street]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte vašu ulicu a číslo"
                                                       value="@if (is_set($client->street)){{ $client->street }}@else{{ old('client.street') }}@endif">
                                                <div class="input_msg" data-id="street"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- PSC + Krajina -->
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label for="psc">PSČ*</label>
                                                <input id="psc" name="client[zip]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte vaše PSČ"
                                                       value="@if (is_set($client->zip)){{ $client->zip }}@else{{ old('client.zip') }}@endif">
                                                <div class="input_msg" data-id="psc"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="form-group">
                                                <label for="country">Krajina*</label>
                                                <input id="country" name="client[country]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte krajinu"
                                                       value="@if (is_set($client->country)){{ $client->country }}@else{{ old('client.country') }}@endif">
                                                <div class="input_msg" data-id="country"></div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <!-- KONIEC SEKCIE FORMULARU -->


                                <!-- INA DORUCOVACIA -->
                                <div class="form-header row mt-3" data-toggle="collapse" data-target="#dorucovacia" @if ($client->address->use==1 or is_set(old('address.street'))) aria-expanded="true" @else aria-expanded="false" @endif aria-controls="dorucovacia">
                                    <div class="col-auto">
                                        <h3 class="form-header__name">
                                            INÁ DORUČOVACIA ADRESA
                                        </h3>
                                    </div>
                                    <div class="col">
                                        <div class="form-header__line"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-check form-header__checkbox"></i>
                                    </div>
                                </div>

                                <div class="collapse @if ($client->address->use==1 or is_set(old('address.street'))) show @endif" id="dorucovacia">

                                    <!-- Mesto + ulica -->
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="delivery-street">Ulica a popisné číslo*</label>
                                                <input id="delivery-street" name="address[street]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte adresu doručenia"
                                                       value="@if (is_set($client->address->street)){{ $client->address->street }}@else{{ old('address.street') }}@endif">
                                                <div class="input_msg" data-id="delivery-street"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="delivery-city">Mesto*</label>
                                                <input id="delivery-city" name="address[city]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte adresu doručenia"
                                                       value="@if (is_set($client->address->city)){{ $client->address->city }}@else{{ old('address.city') }}@endif">
                                                <div class="input_msg" data-id="delivery-city"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- PSC + Krajina -->
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label for="delivery-psc">PSČ*</label>
                                                <input id="delivery-psc" name="address[zip]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte vaše PSČ"
                                                       value="@if (is_set($client->address->zip)){{ $client->address->zip }}@else{{ old('address.zip') }}@endif">
                                                <div class="input_msg" data-id="delivery-psc"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="form-group">
                                                <label for="delivery-country">Krajina</label>
                                                <input id="delivery-country" name="address[country]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte vaše bydlisko"
                                                       value="@if (is_set($client->address->country)){{ $client->address->country }}@else{{ old('address.country') }}@endif">
                                                <div class="input_msg" data-id="delivery-country"></div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <!-- KONIEC SEKCIE FORMULARU -->

                                <!-- Objednavka na firmu -->
                                <div class="form-header row mt-3" data-toggle="collapse" data-target="#company" @if ($client->company->use == 1 or is_set(old('company.name'))) aria-expanded="true" @else aria-expanded="false" @endif aria-controls="company">
                                    <div class="col-auto">
                                        <h3 class="form-header__name">
                                            Objednávka na firmu
                                        </h3>
                                    </div>
                                    <div class="col">
                                        <div class="form-header__line"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-check form-header__checkbox"></i>
                                    </div>
                                </div>

                                <div class="collapse @if ($client->company->use == 1 or is_set(old('company.name'))) show @endif" id="company">


                                    <!-- MENO SPOLOČNOSTI -->
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="company-name">Názov spoločnosti*</label>
                                                <input id="company-name" name="company[name]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte vaše meno spoločnosti"
                                                       value="@if (is_set($client->company->name)){{ $client->company->name }}@else{{ old('company.name') }}@endif">
                                                <div class="input_msg" data-id="company-name"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- ICO + DIC -->
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="company-id">IČO*</label>
                                                <input id="company-id" name="company[ico]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte IČO spoločnosti"
                                                       value="@if (is_set($client->company->ico)){{ $client->company->ico }}@else{{ old('company.ico') }}@endif">
                                                <div class="input_msg" data-id="company-id"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="company-tax-id">DIČ*</label>
                                                <input id="company-tax-id" name="company[dic]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte DIČ spoločnosti"
                                                       value="@if (is_set($client->company->dic)){{ $client->company->dic }}@else{{ old('company.dic') }}@endif">
                                                <div class="input_msg" data-id="company-tax-id"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- IC DPH -->
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="company-vat-id">IČ DPH</label>
                                                <input id="company-vat-id" name="company[icdph]" class="form-control" type="text" data-invalid-response="Prosíme vyplňte vaše meno spoločnosti"
                                                       value="@if (is_set($client->company->icdph)){{ $client->company->icdph }}@else{{ old('company.icdph') }}@endif">
                                                <div class="input_msg" data-id="company-vat-id"></div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <!-- KONIEC SEKCIE FORMULARU -->


                                <div class="form-group mt-4 text-right" >
                                    <div class="row">
                                        <div class="col-md-auto order-2 text-left">
                                            <a href="{{ url()->previous() }}" class="btn btn-outline-nq-70 w-100">Späť na nákup</a>
                                        </div>
                                        <div class="col-md-auto ml-auto order-1 order-md-2 mb-3 mb-md-0 text-right"><button type="submit" class="btn btn-orange w-100" name="subm">Doprava a platba</button></div>
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