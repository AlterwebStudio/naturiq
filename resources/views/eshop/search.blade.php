@extends ('master')

@section ('content')

    <!-- BREADCRUMBS -->
    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Domov</a></li>
                    <li class="breadcrumb-item active">Vyhľadávanie</li>
                </ol>
            </div>
        </div>
    </nav>


    <!-- RECEPT -->
    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h2>
                        Výsledky vyhľadávania
                        <div class="line"></div>
                    </h2>
                </div>

                <div class="col-lg-8 mx-auto">
                    <form action="{{ route('search') }}" method="post">
                        @csrf
                        <div class="input-group">
                            <input class="form-control mr-2 rounded" type="text" name="keyword" value="{{ request('keyword') }}" placeholder="Vyhľadávanie">
                            <button type="submit" class="btn btn-orange" name="button">Hľadaj</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="row pt-5">
                <div class="col-12">
                    <ul class="nav nav-tabs tab-menu" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">PRODUKTY</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">RECEPTY</a>
                        </li>
                    </ul>
                </div>


                <div class="col-12">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="row">
                                @foreach ($products as $product)
									<div class="col-lg-3 col-sm-6 col-12 mb-5 mb-lg-5">
									@include ('inc.partials.product', ['product'=>$product])
									</div>
                                @endforeach
                            </div>
                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <div class="row">
                                @foreach ($recepts as $recept)
									<div class="col-lg-6 mb-lg-0">
									@include ('inc.partials.recept')
									</div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>

@endsection