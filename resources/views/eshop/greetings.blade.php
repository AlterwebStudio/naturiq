@extends ('master')

@section ('content')
    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">Domov</a></li>
                    <li class="breadcrumb-item">Objednávka</li>
                    <li class="breadcrumb-item active">Potvrdenie vašej objednávky</li>
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

                        <h1 class="title text-center mt-5 mb-5">Ďakujeme za vašu objednávku!</h1>

                        <p class="alert bg-light lh-15">Práve sme vám odoslali e-mail s potvrdením vašej objednávky a všetkými potrebnými informáciami. Číslo vašej objednávky: <b>{{ $dataset['order']->number }}</b></p>

                        @if (isset($dataset['order']))

                            @if (Cart::count() > 0)
                            <table class="table mb-5">
                                <thead>
                                <tr>
                                    <th colspan="2" class="col-6">Názov položky</th>
                                    <th class="col-2 text-center">Množstvo</th>
                                </tr>
                                </thead>

                                <tbody>

                                @foreach (Cart::instance('default')->content() as $row)

                                    <tr class="bg-light">
                                        <td class="col-2">
                                            <div class="bg-light rounded"><img src="{{ image_get_thumbnail(asset('storage/'.$row->options->image),'mini') }}" /></div>
                                        </td>
                                        <td class="align-middle lh-15">
                                            <strong class="big">{{ $row->name }}</strong>
                                            <p>@if ($row->options->has('weight')) Balenie: {{ $row->options->weight }} @endif</p>
                                        </td>
                                        <td class="align-middle text-center">{{ $row->qty }}x</td>
                                    </tr>

                                @endforeach

                                </tbody>
                            </table>
                            @endif


                            <table class="table mb-5">
                                <tr>
                                    <td class="col-3">
                                        <h5 class="font-weight-bold">Fakturačné údaje</h5>
                                        {{ $dataset['order']->client->name }}<br/>
                                        {{ $dataset['order']->client->street }}<br/>
                                        {{ $dataset['order']->client->zip }}<br/>
                                        {{ $dataset['order']->client->city }}
                                    </td>

                                    @if (is_set($dataset['order']->client->address->street))
                                    <td class="col-3">
                                        <h5 class="font-weight-bold">Firemné údaje</h5>
                                        {{ $dataset['order']->client->address->street }}<br/>
                                        {{ $dataset['order']->client->address->zip }}<br/>
                                        {{ $dataset['order']->client->address->city }}<br/>
                                        {{ $dataset['order']->client->address->country }}
                                    </td>
                                    @endif

                                    @if (is_set($dataset['order']->client->company->name))
                                    <td class="col-3">
                                        <h5 class="font-weight-bold">Doručovacie údaje</h5>
                                        {{ $dataset['order']->client->company->name }}<br/>
                                        IČO: {{ $dataset['order']->client->company->ico }}<br/>
                                        DIČ: {{ $dataset['order']->client->company->dic }}<br/>
                                        IČ DPH: {{ $dataset['order']->client->company->icdph }}
                                    </td>
                                    @endif

                                    <td class="col-3">
                                        <h5 class="font-weight-bold">Kontaktné údaje</h5>
                                        {{ $dataset['order']->client->phone }}<br/>
                                        {{ $dataset['order']->client->email }}
                                    </td>
                                </tr>
                            </table>

                            <a href="{{ route('eshop') }}" class="btn btn-lg btn-orange">Zatvoriť a prejsť do e-shopu</a>

                        @endif

                    </div>

                </div>

                <!-- END Shipping Cart -->

            </div>
        </div>
    </div>
</section>

@stop