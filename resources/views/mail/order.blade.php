<!DOCTYPE html>
<html lang="en">
<head>
    <title>DANIEL BROGYANYI</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Colo Shop Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="{{ asset('css/bootstrap4/bootstrap.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('css/style.css') }}">
</head>
<body>

<div class="container">

    @if (isset($data))

        <h1 class="title text-center mt-5 mb-5">Naturiq.sk</h1>

        <p class="alert alert-secondary mb-5">
            Ďakujeme za vašu objednávku na NATURIQ.SK.<br/>
            Číslo vašej objednávky: <b>{{ $data->number }}</b>
        </p>

        <table class="table table-striped mb-5">
            <thead>
            <tr>
                <th class="col-6" style="width:40%">Názov položky</th>
                <th class="col text-center" style="width:20%">Množstvo</th>
                <th class="col" style="width:20%">Cena za kus</th>
                <th class="col" style="width:20%">Cena celkom</th>
            </tr>
            </thead>

            <tbody>

            @foreach (Cart::instance('default')->content() as $row)

                <tr>
                    <td class="align-middle lh-15">
                        <strong class="big"><a href="{{ route('product_detail', [App\Product::get_category_slug($row->id),str_slug($row->name),$row->id]) }}">{{ $row->name }}</a></strong><br/>
                        <span>@if ($row->options->has('weight')) Balenie: {{ $row->options->weight }} @endif</span>
                    </td>
                    <td class="align-middle text-center">{{ $row->qty }}x</td>
                    <td class="align-middle">{{ number_format($row->price,2, ',', ' ') }} &euro;</td>
                    <td class="align-middle font-weight-bold">{{ number_format($row->subtotal,2, ',', ' ') }} &euro;</td>
                </tr>

            @endforeach

            </tbody>

            <tfoot>
            <tr>
                <td colspan="2">&nbsp;</td>
                <td>{{ $data['shipping']->name }}</td>
                <td>{{ format_money($data['shipping']->price) }}</td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
                <td>{{ $data['payment']->name }}</td>
                <td>{{ format_money($data['payment']->price) }}</td>
            </tr>
            <tr class="font-weight-bold">
                <td colspan="2">&nbsp;</td>
                <td>Celkom k úhrade</td>
                <td class="table-primary"><big>{{ $data->total_price }}</big></td>
            </tr>
            </tfoot>
        </table>

        <table class="table mb-5">
            <tr>
                <td width="25%">
                    <h5 class="font-weight-bold">Fakturačné údaje</h5>
                    {{ $data->client->name }}<br/>
                    {{ $data->client->street }}<br/>
                    {{ $data->client->zip }}<br/>
                    {{ $data->client->city }}
                </td>

                @if (is_set($data->client->address->street))
                    <td width="25%">
                        <h5 class="font-weight-bold">Firemné údaje</h5>
                        {{ $data->client->address->street }}<br/>
                        {{ $data->client->address->zip }}<br/>
                        {{ $data->client->address->city }}<br/>
                        {{ $data->client->address->country }}
                    </td>
                @endif

                @if (is_set($data->client->company->name))
                    <td width="25%">
                        <h5 class="font-weight-bold">Doručovacie údaje</h5>
                        {{ $data->client->company->name }}<br/>
                        IČO: {{ $data->client->company->ico }}<br/>
                        DIČ: {{ $data->client->company->dic }}<br/>
                        IČ DPH: {{ $data->client->company->icdph }}
                    </td>
                @endif

                <td width="25%">
                    <h5 class="font-weight-bold">Kontaktné údaje</h5>
                    {{ $data->client->phone }}<br/>
                    {{ $data->client->email }}
                </td>
            </tr>
        </table>

    @endif

    @include ('mail.signature')

</div>

</body>
</html>