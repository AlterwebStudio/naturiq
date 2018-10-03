@extends ('master')

@section ('content')

    <!-- BREADCRUMBS -->
    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Domov</a></li>
                    <li class="breadcrumb-item active">Predajne</li>
                </ol>
            </div>
        </div>
    </nav>

    @foreach ($cities as $city)
    <!-- PREDAJNE -->
    <section class="py-5">
        <div class="container">

            <div class="row">
                <div class="col-12">
                    <h2>
                        {{ $city->name }}
                        <div class="line"></div>
                    </h2>
                </div>

                @foreach ($city->stores as $store)
                <div class="col-lg-3">
                    @include ('inc.partials.store', ['store'=>$store])
                </div>
                @endforeach

            </div>

        </div>
    </section>
    @endforeach

@endsection