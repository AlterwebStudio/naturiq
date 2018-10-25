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

                        <p class="alert bg-light lh-15">Práve sme vám odoslali e-mail s potvrdením vašej objednávky a všetkými potrebnými informáciami. Číslo vašej objednávky: <b>{{ $order->number }}</b></p>

                        @if (isset($order))

                            <table class="table mb-5">
                                <tbody>

                                @foreach ($order->items->content as $row)

                                    <tr class="bg-light">
                                        <td width="20%">
                                            <div class="bg-light rounded"><img src="{{ image_get_thumbnail(asset('storage/'.$row->options->image),'mini') }}" /></div>
                                        </td>
                                        <td class="align-middle lh-15" width="40%">
                                            <strong class="big">{{ $row->name }}</strong>
                                            <p>@if ($row->options->has('weight')) Balenie: {{ $row->options->weight }} @endif</p>
                                        </td>
                                        <td class="align-middle text-center" width="40%">{{ $row->qty }}x</td>
                                    </tr>

                                @endforeach

                                </tbody>
                            </table>


                            <table class="table mb-5">
                                <tr>
                                    <td width="25%">
                                        <h5 class="font-weight-bold">Fakturačné údaje</h5>
                                        {{ $order->client->name }}<br/>
                                        {{ $order->client->street }}<br/>
                                        {{ $order->client->zip }}<br/>
                                        {{ $order->client->city }}
                                    </td>

                                    @if (is_set($order->client->address->street))
                                    <td width="25%">
                                        <h5 class="font-weight-bold">Firemné údaje</h5>
                                        {{ $order->client->address->street }}<br/>
                                        {{ $order->client->address->zip }}<br/>
                                        {{ $order->client->address->city }}<br/>
                                        {{ $order->client->address->country }}
                                    </td>
                                    @endif

                                    @if (is_set($order->client->company->name))
                                    <td width="25%">
                                        <h5 class="font-weight-bold">Doručovacie údaje</h5>
                                        {{ $order->client->company->name }}<br/>
                                        IČO: {{ $order->client->company->ico }}<br/>
                                        DIČ: {{ $order->client->company->dic }}<br/>
                                        IČ DPH: {{ $order->client->company->icdph }}
                                    </td>
                                    @endif

                                    <td width="25%">
                                        <h5 class="font-weight-bold">Kontaktné údaje</h5>
                                        {{ $order->client->phone }}<br/>
                                        {{ $order->client->email }}
                                    </td>
                                </tr>
                            </table>

                            <a href="{{ route('login') }}" class="btn btn-lg btn-orange">Ukončiť a prejsť na zoznam objednávok</a>

                        @endif

                    </div>

                </div>

                <!-- END Shipping Cart -->

            </div>
        </div>
    </div>
</section>

@stop