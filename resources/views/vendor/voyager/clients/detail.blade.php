@extends('voyager::master')

@section('page_title', 'Detail objednávky')

@section('page_header')
    <h1 class="page-title">
        <i class="voyager-bag"></i> {{ $client->name }} / {{ $client->type }}
    </h1>
@stop

@section('content')

    <div class="page-content container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered panel-warning">

                    <div class="panel-heading">
                        <h3 class="panel-title">Registračné údaje</h3>
                    </div>

                    <div class="panel-body">

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="card">
                                            <div class="card-header text-center">
                                                <h4 style="margin-bottom:0;">Základné údaje</h4>
                                            </div>
                                            <div class="card-body text-center">
                                                <p>{{ $client->name }}</p>
                                                <p>{{ $client->street }}</p>
                                                <p>{{ $client->zip }}</p>
                                                <p>{{ $client->city }}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="card">
                                            <div class="card-header text-center">
                                                <h4 style="margin-bottom:0">Doručovacia adresa</h4>
                                            </div>
                                            <div class="card-body text-center">
                                                @if (is_set($client->address->street))
                                                    <p>{{ $client->address->street }}</p>
                                                    <p>{{ $client->address->zip }}</p>
                                                    <p>{{ $client->address->city }}</p>
                                                    <p>{{ $client->address->country }}</p>
                                                @else
                                                    <p>Doručovacie údaje sú zhodné so základnými...</p>
                                                @endif
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="card">
                                            <div class="card-header text-center">
                                                <h4 style="margin-bottom:0">Fakturačné údaje</h4>
                                            </div>
                                            <div class="card-body text-center">
                                                @if (is_set($client->company->name))
                                                <p>{{ $client->company->name }}</p>
                                                <p>{{ $client->company->ico }}</p>
                                                <p>{{ $client->company->dic }}</p>
                                                <p>{{ $client->company->icdph }}</p>
                                                @else
                                                    <p>Fakturačné údaje neboli vyplnené...</p>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">

                                        <div class="card">
                                            <div class="card-header text-center">
                                                <h4 style="margin-bottom:0">Kontaktné údaje</h4>
                                            </div>
                                            <div class="card-body text-center">
                                                <p>Telefón: {{ $client->phone }}</p>
                                                <p><a href="mailto:{{ $client->email }}">{{ $client->email }}</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>


                <div class="panel panel-bordered panel-primary">

                    <div class="panel-heading">
                        <h3 class="panel-title">Objednávky zákazníka</h3>
                    </div>

                    <div class="panel-body">

                                <table id="dataTable" class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>Číslo objednávky</th>
                                        <th>Hodnota objednávky</th>
                                        <th>Dátum prijatia</th>
                                        <th>Aktuálny stav</th>
                                        <th class="actions text-right">Zobraziť</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @forelse($client->orders as $order)
                                        <tr>
                                            <td><a href="{{ route('voyager.orders.show', $order->id) }}">{{ $order->number }}</a></td>
                                            <td>{{ format_money($order->total_price) }}</td>
                                            <td>{{ $order->created_at }}</td>
                                            <td>{{ $order->status->name }}</td>
                                            <td class="no-sort no-click bread-actions">
                                                <a href="{{ route('voyager.orders.show', $order->id) }}" class="btn btn-sm btn-warning pull-right edit">
                                                    <i class="voyager-edit"></i> Detail objednávky
                                                </a>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="7">
                                                <p class="m-3">Zákazník nezrealizoval žiadnu objednávku...</p>
                                            </td>
                                        </tr>
                                    @endforelse
                                    </tbody>
                                </table>

                            </div>
                        </div>

                    </div>
                </div>


@stop
