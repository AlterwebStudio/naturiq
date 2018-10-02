@extends ('master')

@section ('content')

    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Domov</a></li>
                    <li class="breadcrumb-item active"><a href="{{ route('login') }}">Prihlásenie</a></li>
                    <li class="breadcrumb-item active">Zmena hesla</li>
                </ol>
            </div>
        </div>
    </nav>



    <section>
        <div class="container py-5">
            <div class="row">

                <div class="col-12 mb-5">
                    @include ('inc.partials.messages')
                </div>

                @if (Auth::check())

                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="text-center">
                                    Zmena hesla
                                    <div class="line"></div>
                                </h2>
                            </div>
                            <div class="col-md-5 mx-md-auto">

                                <p class="text-center">
                                    <small>
                                        Zadajte vaše súčasné heslo a následne dva krát vpíšte<br/>nové heslo s dĺžkou minimálne 6 znakov.
                                    </small>
                                </p>
                                <form id="text-form" action="{{ route('eshop.profile') }}" method="post" class="validate-form my-4">
                                    @csrf
                                    <input type="hidden" name="email" value="{{ Auth::user()->email }}" />
                                    <div class="form-group">
                                        <label for="current-password">Súčasné heslo</label>
                                        <div class="input-group">
                                            <input id="current-password" name="current_password" class="form-control required" type="password" data-invalid-response="Prosíme zadajte vaše súčasné heslo" value="">
                                            <div class="input-group-append">
                                                <button type="button" data-pass-id="current-password" class="btn btn-nq-70 reveal-password" name="button">
                                                    <i class="fas fa-eye icon"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="input_msg" data-id="current_password"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="new_password">Nové heslo</label>
                                        <div class="input-group">
                                            <input id="password" name="password" class="form-control required" type="password" data-invalid-response="Prosíme zadajte vaše nové heslo" value="">
                                            <div class="input-group-append">
                                                <button type="button" data-pass-id="password" class="btn btn-nq-70 reveal-password" name="button">
                                                    <i class="fas fa-eye icon"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="input_msg" data-id="new_password"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="confirm_password">Kontrola nového hesla</label>
                                        <div class="input-group">
                                            <input id="confirm_password" name="password_confirmation" class="form-control required" type="password" data-invalid-response="Pre kontrolu nové heslo zopakujte" value="">
                                            <div class="input-group-append">
                                                <button type="button" data-pass-id="confirm_password" class="btn btn-nq-70 reveal-password" name="button">
                                                    <i class="fas fa-eye icon"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="input_msg" data-id="confirm_password"></div>
                                    </div>

                                    <div class="form-group mt-4">
                                        <button type="submit" class="btn btn-orange w-100" name="button">zmeniť heslo</button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>

                @endif

            </div>
        </div>

    </section>

@endsection