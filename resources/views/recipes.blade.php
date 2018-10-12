@extends ('master')

@section ('content')

    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">Domov</a></li>
                    <li class="breadcrumb-item active">Recepty</li>
                </ol>
            </div>
        </div>
    </nav>

    <section class="py-3 filter-pane">
        <!-- Product row -->
        <div class="container" data-toggle="collapse" data-target="#filterPane" aria-expanded="false">
            <div class="row align-items-center">
                <div class="col-auto">
                    <h3><i class="fas fa-filter mr-2"></i>Kategórie receptov</h3>
                </div>
                <div class="col text-right">
                    <button class="close-btn" type="button">
                        <i class="fas fa-times"></i>
                    </button>
                </div>

            </div>
        </div>
        <div id="filterPane" class="container collapse">

            <div class="row product-categories py-4">
                @foreach (App\ReceptTag::all() as $item)
                <div class="col-4 col-sm mb-4 mb-lg-0"><a href="{{ asset('/recepty/'.$item->slug)  }}" class="tag {{ $item->class }}">{{ $item->name }}</a></div>
                @endforeach
            </div>

        </div>
    </section>


    @forelse ($recepts as $recept)

    @if ($loop->first)
    <section>
        <div class="container pt-5 pb-3">
            <div class="row">
    @endif

            <div class="col-lg-6 mb-lg-0">
                @include ('inc.partials.recipe', ['recept'=>$recept])
            </div>

    @if ($loop->iteration == 4)
            </div>
        </div>

        <!-- AKCIOVÝ BANNER  -->
        <section class="py-lg-4 py-0">
            <div class="container">
                <div class="row">
                    <div class="col-12">

                        @include ('inc.partials.shop-banner')

                    </div>
                </div>
            </div>
        </section>

        <section>
            <div class="container pt-5 pb-3">
                <div class="row">
        @endif

        @if ($loop->last)
                </div>
            </div>
        @endif

    @empty

        <div class="container">
            <p class="alert alert-light my-6">Žiaľ, nenašli sme žiadne recepty vyhovujúce týmto kritériám :/</p>
        </div>

    @endforelse

    @include ('inc.partials.pagination')

@endsection