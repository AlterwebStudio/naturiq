@extends ('master')

@section ('content')

    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.php">Domov</a></li>
                    <li class="breadcrumb-item active">Prihlásenie</li>
                </ol>
            </div>
        </div>
    </nav>



    <section>
        <div class="container py-5">
            <div class="row">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="text-center">
                                Vítame vás v našom obchode
                                <div class="line">
                                </div>
                            </h2>
                        </div>
                        <div class="col-md-5 mx-md-auto">

                            @if (Auth::check())
                                <p class="alert alert-secondary text-center mt-5">Autorizácia prebehla v poriadku, boli ste prihlásený!<br/><b>Prajeme vám príjemný nákup.</b></p>
                            @else

                            <p class="text-center m-0">
                                <small>Nemáte ešte u nás účet? <a href="novy_ucet.php" class="font-weight-bold">Založte si konto Naturiq</a></small>
                            </p>

                            <form id="text-form" action="#" method="post" class="validate-form my-4">
                                @csrf
                                <div class="form-group">
                                    <label for="login">Prihlasovacie meno / email</label>
                                    <input id="login" name="email" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte vaše prihlasovacie meno" value="">
                                    <div class="input_msg" data-id="login"></div>
                                </div>

                                <div class="form-group">
                                    <label for="password">Heslo</label>
                                    <div class="input-group">
                                        <input id="password" name="password" class="form-control required" type="password" data-invalid-response="Prosíme zadajte vaše heslo" value="">
                                        <div class="input-group-append">
                                            <button type="button" data-pass-id="password" class="btn btn-nq-70 reveal-password" name="button">
                                                <i class="fas fa-eye icon"></i>
                                            </button>
                                        </div>

                                    </div>
                                    <div class="input_msg" data-id="password"></div>
                                </div>

                                <div class="form-group mt-4">
                                    <button type="submit" class="btn btn-orange w-100" name="button">prihlásiť</button>
                                </div>

                            </form>
                            <p class="text-center m-0">
                                <small>
                                    <a href="{{ route('login.forgotten_password') }}" class="font-weight-bold">Zabudli ste svoje heslo ?</a>
                                </small>
                            </p>

                            @endif

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>

@endsection