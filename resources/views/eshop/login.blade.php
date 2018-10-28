@extends ('master')

@section ('content')

    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">Domov</a></li>
                    <li class="breadcrumb-item active">Prihlásenie</li>
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

                <div class="col-12">
                    <h2 class="text-center">
                        {{ Auth::user()->name }}
                        <div class="line">
                        </div>
                    </h2>
                    <p class="alert text-center mt-3">Vitajte {{ App\Client::getFirstname() }}, máme tu pre vás<br/>zoznam Vašich predchádzajúcich nákupov:</p>

                    <table class="table table-striped mb-6">
                        <thead>
                            <tr>
                                <th>Číslo objednávky</th>
                                <th>Dátum</th>
                                <th class="text-center">Stav spracovania</th>
                                <th class="text-right">Hodnota v EUR</th>
                                <th class="text-right">Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                        @forelse ($client->orders as $order)
                            @if(is_set($order->status_id))
                            <tr>
                                <td class="font-weight-bold">{{ $order->number }}</td>
                                <td>{{ $order->created_at }}</td>
                                <td class="text-center">{{ $order->status->name }}</td>
                                <td class="text-right">{{ format_money($order->total_price) }}</td>
                                <td class="text-right"><a class="btn btn-sm btn-orange" href="{{ route('eshop.order',[$order->number]) }}">Zobraziť</a></td>
                            </tr>
                            @endif
                        @empty
                            <tr>
                                <td colspan="5" class="text-center">Z vášho konta sme zatiaľ nezaznamenali objednávku...<br/><a href="{{ route('eshop') }}" class="btn btn-sm btn-outline-orange mt-2">Začnite nakupovať v E-shope</a></td>
                            </tr>
                        @endforelse
                        </tbody>
                    </table>
                    
                    <div class="form-group text-right" >
                        <div class="row">
                            <div class="col-md-auto ml-auto mr-auto order-1 order-md-2 mb-3 mb-md-0">
                                <a href="{{ route('eshop.profile') }}" class="btn btn-secondary d-inline">Zmeniť prístupové heslo</a>
                                <a href="{{ route('eshop.logout') }}" class="btn btn-orange d-inline">Odhlásiť sa z účtu</a>
                            </div>
                        </div>
                    </div>
                </div>

                @else

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

                            <p class="text-center m-0">
                                <small>Nemáte ešte u nás účet? <a href="{{ route('register') }}" class="font-weight-bold">Založte si konto Naturiq</a></small>
                            </p>

                            <form id="text-form" action="{{ route('login') }}" method="post" class="validate-form my-4">
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
                                    <a href="{{ route('eshop.forgotten_password') }}" class="font-weight-bold">Zabudli ste svoje heslo ?</a>
                                </small>
                            </p>

                        </div>
                    </div>
                </div>

                @endif

            </div>
        </div>

    </section>

@endsection