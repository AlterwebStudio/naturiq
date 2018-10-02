<!DOCTYPE html>
<html lang="en">
<head>
    <title>{{ config('name') }}</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Colo Shop Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="{{ asset('css/bootstrap4/bootstrap.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('css/style.css') }}">
</head>
<body>

<div class="container">

    <h1 class="title text-center mt-5 mb-5">Nové prihlasovacie údaje</h1>

    <p class="alert alert-secondary mb-5">
        Zaznamenali sme požiadavku na vygenerovanie nového prihlasovacieho hesla pre vaše konto.<br/>
        Kliknutím na tlačidlo nižšie prihlasovacie údaje potvrdíte a aktivujete.
    </p>

    <table class="table table-striped">
        <tbody>
        <tr>
            <td style="width:20%">Prihlasovacie meno</td>
            <td>{{ $credentials['login'] }}</td>
        </tr>
        <tr>
            <td>Nové heslo</td>
            <td>{{ $credentials['password'] }}</td>
        </tr>
        </tbody>
    </table>

    <a href="{{ config('app.url') }}/eshop/confirm-password/{{ $credentials['password_hash'] }}" class="btn btn-lg btn-success mt-3">Potvrdiť prihlasovacie údaje</a>

    @include ('mail.signature')

</div>

</body>
</html>