@extends ('master')

@section ('content')

    <!-- BREADCRUMBS -->
    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Domov</a></li>
                    <li class="breadcrumb-item active">{{ $page->title }}</li>
                </ol>
            </div>
        </div>
    </nav>

    <section>
        <div class="container py-5">
            <div class="row">
                <div class="col-12">
                    <h2>{{ $page->title }}
                        <div class="line"></div>
                    </h2>
                    {!! $page->body !!}
                </div>
            </div>
        </div>
    </section>

@endsection