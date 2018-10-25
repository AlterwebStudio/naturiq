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

    @if (isset($order))

        <h1 class="title text-center mt-5 mb-5">Naturiq.sk</h1>

        <p class="alert alert-secondary mb-5">
            Ďakujeme za vašu objednávku na NATURIQ.SK.<br/>
            Číslo vašej objednávky: <b>{{ $order->number }}</b>
        </p>

        <table class="table mb-5">
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

                <tr class="bg-light">
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
            @if (isset($order->coupon))
                <tr>
                    <td>
                        <b>Kupónová zľava</b><br/>
                        {{ $order->coupon->title }}
                    </td>
                    <td colspan="2"></td>
                    <td class="font-weight-bold">- {!! $order->discountAmount($order->total_price) !!}</td>
                </tr>
            @endif
            <tr>
                <td>
                    <b>Doprava</b><br/>
                    {{ $order->shipping->name }}
                </td>
                <td colspan="2"></td>
                <td class="font-weight-bold">{{ format_money($order->shipping->price) }}</td>
            </tr>
            <tr>
                <td>
                    <b>Platba</b><br/>
                    {{ $order->payment->name }}
                </td>
                <td colspan="2"></td>
                <td class="font-weight-bold">{{ format_money($order->payment->price) }}</td>
            </tr>
            <tr>
                <td class="font-weight-bold"><big>Celkom k úhrade</big></td>
                <td colspan="2"></td>
                <td class="table-success font-weight-bold"><big>{{ format_money($order->total_price) }}</big></td>
            </tr>
            </tfoot>
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

    @endif

    @include ('mail.signature')

</div>

</body>
</html>