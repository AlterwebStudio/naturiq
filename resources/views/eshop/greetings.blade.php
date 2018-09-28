@extends ('master')

@section ('content')
    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Domov</a></li>
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
                                    <th colspan="2" class="col-6">Položka na objednanie</th>
                                    <th class="col-2 text-center">Množstvo</th>
                                </tr>
                                </thead>

                                <tbody>

                                @foreach (Cart::content() as $row)

                                    <tr class="bg-light">
                                        <td class="col-2">
                                            <div class="bg-light rounded"><img src="{{ asset($row->model->image) }}" /></div>
                                        </td>
                                        <td class="align-middle lh-15">
                                            <strong class="big"><a href="{{ route('product_detail', [str_slug($row->name),$row->id]) }}">{{ $row->name }}</a></strong>
                                            <p>@if ($row->options->has('size')) Veľkosť: {{ $row->options->size }} @endif</p>
                                        </td>
                                        <td class="align-middle text-center">{{ $row->qty }}</td>
                                    </tr>

                                @endforeach

                                </tbody>
                            </table>
                            @endif


                            <table class="table mb-5 text-center">
                                <tr>
                                    <td class="col-3 bg-light"><h5 class="font-weight-bold">Fakturačné údaje</h5></td>
                                    <td class="col-3"><h5 class="font-weight-bold">Firemné údaje</h5></td>
                                    <td class="col-3 bg-light"><h5 class="font-weight-bold">Doručovacie údaje</h5></td>
                                    <td class="col-3"><h5 class="font-weight-bold">Kontaktné údaje</h5></td>
                                </tr>
                                <tr>
                                    <td class="bg-light">{{ $dataset['order']->client->name }}</td>
                                    <td>{{ $dataset['order']->client->company->name }}</td>
                                    <td class="bg-light">{{ $dataset['order']->client->address->street }}</td>
                                    <td>{{ $dataset['order']->client->phone }}</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">{{ $dataset['order']->client->street }}</td>
                                    <td>IČO: {{ $dataset['order']->client->company->ico }}</td>
                                    <td class="bg-light">{{ $dataset['order']->client->address->zip }}</td>
                                    <td>{{ $dataset['order']->client->email }}</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">{{ $dataset['order']->client->zip }}</td>
                                    <td>DIČ: {{ $dataset['order']->client->company->dic }}</td>
                                    <td class="bg-light">{{ $dataset['order']->client->address->city }}</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="bg-light">{{ $dataset['order']->client->city }}</td>
                                    <td>IČ DPH: {{ $dataset['order']->client->company->icdph }}</td>
                                    <td class="bg-light">{{ $dataset['order']->client->address->country }}</td>
                                    <td></td>
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