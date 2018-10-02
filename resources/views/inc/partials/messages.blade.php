@if (session()->has('message'))
<section class="container mt-3">
    <div class="alert alert-success">
        <strong class="d-block text-center border-bottom border-success pb-2">Hotovo!</strong>
        <p class="mt-3 mb-0 text-center">{!! session('message') !!}</p>
    </div>
</section>
@endif

@if (session()->has('error'))
<section class="container mt-3">
    <div class="alert alert-danger">
        <strong class="d-block text-center border-bottom border-danger pb-2">Požiadavku sa nepodarilo spracovať</strong>
        <p class="mt-3 mb-0 text-center">{!! session('error') !!}</p>
    </div>
</section>
@endif

@if (count($errors) > 0)
<section class="container mt-3">
    <div class="alert alert-danger">
        <strong class="d-block text-center border-bottom border-danger pb-2">Hop! Po ceste sa vyskytli komplikácie</strong>
        <ul class="mt-3 mb-0" style="list-style-type: none">
            @foreach ($errors->all() as $error)
            <li>{!! $error !!}</li>
            @endforeach
        </ul>
    </div>
</section>
@endif