@extends ('master')

@section ('content')

{{-- TOTO TREBA ASI POLUCNIT A PRESUNUT NORMALNE DO JS --}}
<script type="text/javascript">
    function set_login_value(){
        var email = document.getElementById("eml");
        var login = document.getElementById("login");
        login.value = email.value;
    }
</script>

<nav aria-label="breadcrumb" class="breadcrumbs">
    <div class="container">
        <div class="row">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('home') }}">Domov</a></li>
                <li class="breadcrumb-item active">Nový účet</li>
            </ol>
        </div>
    </div>
</nav>



<section>
    <div class="container py-5">
        <div class="row">
            <div class="container">

                @include ('inc.partials.messages')

                <form id="register-form-wholesale" action="{{ route('register') }}" method="post" class="validate-form">
                    @csrf
                    <div class="row">
                        <!-- LAVA STRANA -->
                        <div class="col-lg-3">
                            <h2>
                                Nový účet
                                <div class="line"></div>
                            </h2>

                            <p class="text-sm">
                                Tešíme sa, že ste sa rozhodli založiť nový účet v našom obchode.
                            </p>
                            <p class="text-sm">
                                Pomocou nášho účtu zberáte za každý nákup N-iq body, ktoré odmenia vaše pravidelné nákupy  výhodnejšími ponukami.
                            </p>

                            <div class="text-sm">
                                <a href="#zakaznicke-bonusy" class="font-weight-bold">
                                    Viac o zákazníckych bonusoch
                                </a>
                            </div>



                            <h2 class="mt-5">
                                Veľkoodberatelia
                                <span class="line"></span>
                            </h2>

                            <p class="text-sm">
                                Máte záujem predávať naše produkty vo vašom obchode ? Požiadajte o&nbsp;vytvorenie veľkoobchodného konta Naturiq pomocou našeho formuláru pre veľkoodberateľov.
                                <strong>(vyžaduje&nbsp;schválenie)</strong>
                            </p>

                            <div class="text-sm">
                                <a href="{{ route('register.seller') }}" class="font-weight-bold">
                                    Tvorba veľkoodberatelského konta
                                </a>
                            </div>
                        </div>


                        <div class="col-lg-9">
                            <div class="row">



                                <!-- STREDNA CAST REGISTRACIE  -->
                                <div class="col-lg-7 mt-5 mt-lg-0">
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
                                                   value="{{ old('client.name') }}">
                                            <div class="input_msg" data-id="name-surname"></div>
                                        </div>

                                        <!-- E mail + Tel c -->
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="eml">E-mail*</label>
                                                    <input id="eml" name="client[email]" class="form-control required" type="email" data-invalid-response="Prosíme vyplňte váš e-mail"
                                                           value="{{ old('client.email') }}" onblur="set_login_value()">
                                                    <div class="input_msg" data-id="eml"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="tel">Telefónne číslo*</label>
                                                    <input id="tel" name="client[phone]" class="form-control required" type="tel" data-invalid-response="Prosíme vyplňte vaše telefónne číslo"
                                                           value="{{ old('client.phone') }}">
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
                                                           value="{{ old('client.city') }}">
                                                    <div class="input_msg" data-id="city"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="street">Ulica a popisné číslo*</label>
                                                    <input id="street" name="client[street]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte vašu ulicu a číslo"
                                                           value="{{ old('client.street') }}">
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
                                                           value="{{ old('client.zip') }}">
                                                    <div class="input_msg" data-id="psc"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="form-group">
                                                    <label for="country">Krajina*</label>
                                                    <input id="country" name="client[country]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte krajinu"
                                                           value="{{ old('client.country') }}">
                                                    <div class="input_msg" data-id="country"></div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                    <!-- KONIEC SEKCIE FORMULARU -->


                                    <!-- INA DORUCOVACIA ADRESA -->
                                    <div class="form-header row mt-3" data-toggle="collapse" data-target="#dorucovacia" aria-expanded="false" aria-controls="dorucovacia">
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

                                    <div class="collapse" id="dorucovacia">

                                        <!-- Mesto + ulica -->
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="delivery-street">Ulica a popisné číslo*</label>
                                                    <input id="delivery-street" name="address[street]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte adresu doručenia"
                                                           value="{{ old('address.street') }}">
                                                    <div class="input_msg" data-id="delivery-street"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="delivery-city">Mesto*</label>
                                                    <input id="delivery-city" name="address[city]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte adresu doručenia"
                                                           value="{{ old('address.city') }}">
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
                                                           value="{{ old('address.zip') }}">
                                                    <div class="input_msg" data-id="delivery-psc"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="form-group">
                                                    <label for="delivery-country">Krajina</label>
                                                    <input id="delivery-country" name="address[country]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte vaše bydlisko"
                                                           value="{{ old('address.country') }}">
                                                    <div class="input_msg" data-id="delivery-country"></div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                    <!-- KONIEC SEKCIE FORMULARU -->

                                    <!-- OBJEDNAVKA NA FIRMU -->
                                    <div class="form-header row mt-3" data-toggle="collapse" data-target="#company" aria-expanded="false" aria-controls="company">
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

                                    <div class="collapse" id="company">

                                        <!-- MENO SPOLOČNOSTI -->
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="company-name">Názov spoločnosti*</label>
                                                    <input id="company-name" name="company[name]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte vaše meno spoločnosti"
                                                           value="{{ old('company.name') }}">
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
                                                           value="{{ old('company.ico') }}">
                                                    <div class="input_msg" data-id="company-id"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="company-tax-id">DIČ*</label>
                                                    <input id="company-tax-id" name="company[dic]" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte DIČ spoločnosti"
                                                           value="{{ old('company.dic') }}">
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
                                                           value="{{ old('company.icdph') }}">
                                                    <div class="input_msg" data-id="company-vat-id"></div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- KONIEC SEKCIE FORMULARU -->
                                </div>

                                <!-- PRAVA STRANA - prihlasovacie udaje -->
                                <div class="col-lg-5 mt-5 mt-lg-0">
                                    <div class="form-header row">
                                        <div class="col-auto">
                                            <h3 class="form-header__name">
                                                Prihlasovacie údaje
                                            </h3>
                                        </div>
                                        <div class="col">
                                            <div class="form-header__line"></div>
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <label for="login">Prihlasovacie meno</label>
                                        <input id="login" name="username" class="form-control" type="text" data-invalid-response="Prosíme vyplňte vaše prihlasovacie meno" value="{{ old('client.email') }}" disabled>
                                    </div>

                                    <div class="form-group">
                                        <label for="password">Heslo</label>
                                        <div class="input-group">
                                            <input id="password" name="password" class="form-control required" type="password" data-invalid-response="Prosíme zadajte vaše heslo" value="{{ old('password') }}">
                                            <div class="input-group-append">
                                                <button type="button" data-pass-id="password" class="btn btn-nq-70 reveal-password" name="button">
                                                    <i class="fas fa-eye icon"></i>
                                                </button>
                                            </div>

                                        </div>
                                        <div class="input_msg" data-id="password"></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="password-repeat">Zopakujte heslo</label>
                                        <div class="input-group">
                                            <input id="password-repeat" name="password_confirmation" class="form-control required" type="password" data-invalid-response="Prosíme zadajte opätovne vaše heslo" value="{{ old('password_confirmation') }}">
                                            <div class="input-group-append">
                                                <button type="button" data-pass-id="password-repeat" class="btn btn-nq-70 reveal-password" name="button">
                                                    <i class="fas fa-eye icon"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="input_msg" data-id="password-repeat"></div>
                                    </div>

                                    <div class="my-4">
                                        <div class="form-group">

                                            <input style="margin-left:0;" class="form-check-input required" type="checkbox" value="1" id="gdpr_consent" name="gdpr_consent" data-invalid-response="Bez súhlasu so spracovaním vašich osobných údajov nemôžeme konto registrovať">
                                            <label style="margin:0;margin-left:1.5em;" class="form-check-label" for="gdpr_consent">
                                                Súhlasím so spracovaním osobných údajov a s&nbsp;obchodnými podmienkami internetového obchodu naturiq.sk
                                            </label>
                                            <span data-id="gdpr_consent" class="input_msg"></span>

                                        </div>

                                        <a class="text-primary-red text-sm font-weight-bold" data-toggle="modal" data-modal-relation="gdpr" data-modal-content="gdpr_katalog" data-target="#baseModal" href="#">Viac informácii o ochrane osobných údajov</a>
                                    </div>



                                </div>

                                <div class="col-lg-7 mt-4">
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-orange w-100" name="subm">Vytvoriť účet</button>
                                    </div>
                                </div>

                            </div>
                        </div>



                    </div>
                    <!-- KONIEC FORMULATU -->
                </form>
            </div>
        </div>
    </div>

</section>

@endsection