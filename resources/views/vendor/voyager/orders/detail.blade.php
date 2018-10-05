@extends('voyager::master')

@section('page_title', 'Detail objednávky')

@section('page_header')
    <h1 class="page-title">
        <i class="voyager-bag"></i> Objednávka {{ $order->number }}
    </h1>
@stop

@section('content')

    <div class="page-content container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">
                    <div class="panel-body">




                        <div class="card" style="width:100%;float:none;">
                            <div class="card-header" style="background-color: #22A7F0; color:white; padding:15px">
                                <h4 style="margin:0">Údaje o objednávke</h4>
                            </div>
                            <div class="card-body">

                                <div class="card">
                                    <div class="card-header">
                                        <h4 style="margin-bottom:0">Základné údaje</h4>
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title">Číslo objednávky: {{ $order->number }}</h5>
                                        <p>Dátum odoslania: {{ $order->created_at }}</p>
                                        <h4 style="margin-top:15px">Suma k fakurácií: {{ $order->total_price }}</h4>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-header">
                                        <h4 style="margin-bottom:0">Doprava</h4>
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title">{{ $order->shipping->name }}</h5>
                                        <p>{{ $order->shipping->desc }}</p>
                                        <p>Cena dopravy: {{ format_money($order->shipping->price) }}</p>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-header">
                                        <h4 style="margin-bottom:0">Platba</h4>
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title">{{ $order->payment->name }}</h5>
                                        <p>Stav platby: <b>@if (is_set($order->payment_status_id)) {{ $order->payment_status->name }} @else Platba nebola vyžadovaná @endif</b></p>
                                        <p>Cena platby: {{ format_money($order->payment->price) }}</p>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-header">
                                        <h4 style="margin-bottom:0">Stav objednávky</h4>
                                    </div>
                                    <div class="card-body">
                                        <form method="post" action="">
                                            @csrf
                                            <div class="form-group">
                                                <select name="status_id" class="form-control">
                                                    @foreach ($order->statuses() as $status)
                                                        <option value="{{ $status->id }}" @if ($order->status_id == $status->id) selected @endif>{{ $status->name }}</option>
                                                    @endforeach
                                                </select>
                                                <input type="submit" name="update_status" class="btn btn-success" value="Uložiť" />
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="card" style="width:100%;float:none;">
                            <div class="card-header" style="padding:15px">
                                <h4 style="margin-bottom:0">Údaje o zákazníkovi</h4>
                            </div>
                            <div class="card-body">

                                <div class="card">
                                    <div class="card-header" style="background-color: #22A7F0; color:white;">
                                        <h4 style="margin-bottom:0">Fakturačné údaje</h4>
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title">{{ $order->client->name }}</h5>
                                        <p>Ulica a číslo: {{ $order->client->street }}</p>
                                        <p>Mesto: {{ $order->client->city }}</p>
                                        <p>PSČ: {{ $order->client->zip }}</p>
                                    </div>
                                </div>

                                <div class="card" style="float: left">
                                    <div class="card-header">
                                        <h4 style="margin-bottom:0">Firemné údaje</h4>
                                    </div>
                                    <div class="card-body">
                                        @if (empty($order->client->company->name))
                                            <p class="text-secondary font-italic">Neboli vyplnené...</p>
                                        @else
                                            <h5 class="card-title">{{ $order->client->company->name }}</h5>
                                            <p>IČO: {{ $order->client->company->ico }}</p>
                                            <p>DIČ: {{ $order->client->company->dic }}</p>
                                            <p>IČ DPH: {{ $order->client->company->icdph }}</p>
                                        @endif
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-header">
                                        <h4 style="margin-bottom:0">Doručovacie údaje</h4>
                                    </div>
                                    <div class="card-body">
                                        @if (empty($order->client->address->name))
                                            <p class="text-secondary font-italic">Totožné s fakturačnými...</p>
                                        @else
                                            <h5 class="card-title">{{ $order->client->address->name }}</h5>
                                            <p>Ulica a číslo: {{ $order->client->address->street }}</p>
                                            <p>Mesto: {{ $order->client->address->city }}</p>
                                            <p>PSČ: {{ $order->client->address->zip }}</p>
                                        @endif
                                    </div>
                                </div>

                                <div class="card" style="float: left">
                                    <div class="card-header">
                                        <h4 style="margin-bottom:0">Kontaktné údaje</h4>
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title">{{ $order->client->email }}</h5>
                                        <p>Telefón: {{ $order->client->phone }}</p>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="card" style="width:100%;float:none;">
                            <div class="card-header" style="padding:15px">
                                <h4 style="margin:0">Položky objednávky</h4>
                            </div>
                            <div class="card-body">

                                <table class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th class="text-center">Foto</th>
                                        <th class="text-center">Názov položky</th>
                                        <th class="text-center">Balenie</th>
                                        <th class="text-center">Množstvo</th>
                                        <th class="text-center">Celková cena</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    @foreach ($order->items->content as $row)

                                        <tr>
                                            <td class="text-center" style="width:20%">
                                                <div class="rounded">
                                                    @if (is_set($row->model->image))
                                                        <img src="{{ image_get_thumbnail(asset('/storage/'.$row->model->image),'mini') }}" style="max-height:5rem" />
                                                    @endif
                                                </div>
                                            </td>
                                            <td class="text-center align-middle lh-15">
                                                <b>{{ $row->name }}</b>
                                            </td>
                                            <td class="align-middle text-center">@if ($row->options->has('weight')) {{ $row->options->weight }} @endif</td>
                                            <td class="align-middle text-center">{{ $row->qty }}x</td>
                                            <td class="align-middle text-center">{{ format_money($row->price) }}</td>
                                        </tr>

                                    @endforeach

                                    </tbody>
                                </table>

                            </div>
                        </div>



                    </div>
                </div>
            </div>
        </div>
    </div>

@stop
