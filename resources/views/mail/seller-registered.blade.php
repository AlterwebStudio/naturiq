@component('mail::message')
# Oznámenie

Na webe sa práve zaregistroval zákazník so žiadosťou o pridelenie štatútu veľkoodberateľa.

@component('mail::button', ['url' => $url])
Otvoriť admina
@endcomponent

S pozdravom,<br>
{{ config('app.name') }}
@endcomponent
