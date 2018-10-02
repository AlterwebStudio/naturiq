@extends ('master')

@section ('content')

<nav aria-label="breadcrumb" class="breadcrumbs">
    <div class="container">
        <div class="row">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Domov</a></li>
                <li class="breadcrumb-item active"><a href="{{ route('login') }}">Prihlásenie</a></li>
                <li class="breadcrumb-item active">Zabudnuté heslo</li>
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

            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2 class="text-center">
                            Získajte späť svoje heslo
                            <div class="line"></div>
                        </h2>
                    </div>
                    <div class="col-md-5 mx-md-auto">

                        <p class="text-center">
                            <small>
                                Vpíšte mailovú adresu, ktorú ste zadávali pri vytváraní vášho konta a my vám na mail zašleme nové prihlasovacie údaje.
                            </small>
                        </p>
                        <form id="text-form" action="{{ route('eshop.forgotten_password') }}" method="post" class="validate-form my-4">
                            @csrf
                            <div class="form-group">
                                <label for="login">Vaša e-mailová adresa</label>
                                <input id="login" name="email" class="form-control required" type="text" data-invalid-response="Prosíme vyplňte vaše prihlasovacie meno" value="">
                                <div class="input_msg" data-id="login"></div>
                            </div>

                            <div class="form-group mt-4">
                                <button type="submit" class="btn btn-orange w-100" name="button">získať heslo</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>

</section>

@endsection