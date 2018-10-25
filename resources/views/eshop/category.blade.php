@extends ('master')

@section ('content')

    {{-- BREADCRUMB SECTION --}}
    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">Domov</a></li>
                    <li class="breadcrumb-item active">E-shop</li>
                </ol>
            </div>
        </div>
    </nav>
    {{-- END BREADCRUMB SECTION --}}


    {{-- CATEGORY LOOP SECTION --}}
    <section class="py-3 alt-bg-200 filter-pane">
      <div class="container" data-toggle="collapse" data-target="#filterPane" aria-expanded="true">
      <div class="row align-items-center">
        <div class="col-auto">
          <h3><i class="fas fa-filter mr-2"></i>Kategórie</h3>
        </div>
        <div class="col text-right">
          <button class="close-btn" type="button">
            <i class="fas fa-times"></i>
          </button>
        </div>

      </div>
    </div>
        <div id="filterPane" class="container collapse show">
            <div class="row product-categories py-4">
                @include ('inc.partials.categories', ['categories'=>$categories])
            </div>
        </div>
    </section>
    {{-- END CATEGORY LOOP SECTION --}}

    {{-- PRODUCT LOOP --}}
    <section>

        @if (isset($subtitle))
        <div class="container pt-3">
            <div class="row">
                <div class="col">
                    <h3>{{ $subtitle }}
                        <span class="line"></span>
                    </h3>
                </div>
            </div>
        </div>
        @endif

        @include ('inc.partials.messages')

        @forelse (collect($products->items()) as $key=>$product)

            @if ($loop->first)
            <div class="container py-5">
                <div class="row">
            @endif

            <div class="col-lg-3 mb-5 mb-lg-0">
                @include ('inc.partials.product', ['product' => $product])
            </div>

            @if ($loop->iteration == 4)

                </div>
            </div>

            <!-- BANNER  -->
            <section class="py-4">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            @include ('inc/partials/shop-banner')
                        </div>
                    </div>
                </div>
            </section>

            <div class="container py-5">
                <div class="row">

            @endif

            @if ($loop->last)
                </div>
            </div>
            @endif

            @empty

            <div class="alert alert-secondary text-center my-4"><p class="m-0">V tejto kategórií za nenachádzajú žiadne produkty vyhovujúce kritériám filtrácie.</p></div>

        @endforelse
    </section>
    {{-- END PRODUCT LOOP --}}


    {{-- PAGINATION --}}

    @include('inc.partials.pagination')

    {{-- END PAGINATION --}}

@endsection
