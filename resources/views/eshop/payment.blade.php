@extends ('master')

@section ('content')
    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">Domov</a></li>
                    <li class="breadcrumb-item">Objednávka</li>
                    <li class="breadcrumb-item active">Online platba objednávky</li>
                </ol>
            </div>
        </div>
    </nav>



    <section>
        <div class="container py-5">
            <div class="row">
                <div class="container">

                    <div class="row">

                        <div class="col-lg-12">

                            <h1 class="title text-center mt-5 mb-5">Platba online</h1>

                            <p class="alert bg-light lh-15">Paypal</p>

                        </div>

                    </div>

                </div>
            </div>
        </div>
    </section>

@stop