@extends ('master')

@section ('content')

    <!-- BREADCRUMBS -->
    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Domov</a></li>
                    <li class="breadcrumb-item active">Kontakt</li>
                </ol>
            </div>
        </div>
    </nav>


    <!-- Kontakt -->
    <section>
        <div class="container py-5">
            <div class="row">
                <div class="col-lg-5">
                    <h2>Kontakt
                        <div class="line"></div>
                    </h2>

                    <div id="map_card" style="min-height:300px;"></div>

                    <h4 class="mt-4">NATURIQ s.r.o.</h4>
                    <p>
                        Krivec 298, 962 05 Hriňová<br>
                        Slovak Republic<br>
                        e-mail: <a href="mailto:info@naturiq.sk">info@naturiq.sk</a>
                    </p>

                </div>

                <div class="col-lg-7">
                    <h2>Napíšte nám
                        <div class="line"></div>
                    </h2>

                    @include ('inc.partials.messages')

                    <form id="contact_form" data-sender="" class="validate-form" method="post" action="{{ route('contact') }}">

                        @csrf

                        <div class="row form-group">
                            <div class="col-sm-6"><label for="name">Meno a priezvisko*:</label><input id="name" name="contact[name]" placeholder="Meno a priezvisko" class="form-control required" type="text" data-invalid-response="Prosíme, vyplňte vaše krstné meno" /><span data-id="name" class="input_msg"></span></div>
                            <div class="col-sm-6"><label for="eml">E-mail*:</label><input id="eml" name="contact[email]" placeholder="E-mail" class="form-control required" type="eml" data-invalid-response="Prosíme, vyplňte pole e-mail" /><span data-id="eml" class="input_msg"></span></div>
                        </div>

                        <div class="row form-group">
                            <div class="col-12">
                                <label for="msg">Správa</label>
                                <textarea name="contact[message]" id="msg" class="form-control required" data-invalid-response="Vyplňte prosím správu" placeholder="Správa" rows="8" cols="80"></textarea>
                                <div class="input-msg" data-id="msg"></div>
                            </div>
                        </div>

                        <div class="row pt-3">
                            <div class="col-sm-9">

                                <div class="form-group">

                                    <input style="margin-left:0;" class="form-check-input required" type="checkbox" value="áno" id="gdpr_consent" name="gdpr_consent" data-invalid-response="Ľutujeme, no bez vášho súhlasu nieje možné formulár odoslať">
                                    <label style="margin:0;margin-left:1.5em;" class="form-check-label" for="gdpr_consent">
                                        Zadaním Vaších osobných údajov a odoslaním formuláru, súhlasíte s&nbsp;pravidlami ochrany osobných údajov.
                                    </label>
                                    <span data-id="gdpr_consent" class="input_msg"></span>

                                </div>

                                <a class="text-sm" data-toggle="modal" data-modal-relation="gdpr" data-modal-content="gdpr" data-target="#baseModal" href="#">Viac informácii o ochrane osobných údajov</a>

                                <!-- <p>
                                    <strong>Údaje označené * sú povinné.</strong>
                                </p> -->



                            </div>
                            <div class="col-sm-3">
                                <button type="submit" name="button" class="btn btn-orange w-100">Odoslať</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </section>

@endsection

@section ('custom-js-scripts')
    <!-- GOOGLE MAP -->
    <script>
        const latVar = 48.565350,
            lngVar = 19.478164;
        var map;

        function initMap() {
            map = new google.maps.Map(document.getElementById('map_card'), {
                center: {
                    lat: latVar,
                    lng: lngVar
                },
                zoom: 16,
                disableDefaultUI: true
            });

            var icon = {
                url: "images/map_marker.svg",
                scaledSize: new google.maps.Size(200, 90),
            }

            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(latVar, lngVar),
                icon: icon,
                map: map,
                optimized: false
            });
        }
    </script>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0C_RPvQQBVbjBqa9pazPyhGBnUAGIIzo&callback=initMap">
    </script>
@endsection