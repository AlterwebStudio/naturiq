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

    <h1 class="title text-center mt-5 mb-5">Dopyt z webu</h1>

    <p class="alert alert-secondary mb-5">
        Z webu brogy.sk bol práve odoslaný kontaktný formulár. Info o zákazníkovi:
    </p>

    <table class="table table-striped">
        <tbody>
        <tr>
            <td style="width:20%">Meno a priezvisko</td>
            <td>{{ $data['request']['name'] }}</td>
        </tr>
        <tr>
            <td>E-mail</td>
            <td>{{ $data['request']['email'] }}</td>
        </tr>
        <tr>
            <td>Telefón</td>
            <td>{{ $data['request']['phone'] }}</td>
        </tr>
        <tr>
            <td>Poznámka</td>
            <td>{{ $data['request']['note'] }}</td>
        </tr>
        </tbody>
    </table>

    @include ('mail.signature')

</div>

</body>
</html>