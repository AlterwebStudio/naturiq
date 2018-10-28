<section class="alt-bg-200 py-5">
    <div class="container">
        <div class="row justify-content-center">
            @foreach ($benefits as $benefit)
            <div class="col-6 mb-4 mb-lg-0 col-lg">
                <div class="tag-icon">
                    <div class="tag-icon__icon"><img src="{{ $benefit->icon }}" alt=""></div>
                    <span class="d-flex p-xl-3 text-center">{{ $benefit->name }}</span>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>


<footer class="alt-bg-300 py-5 py-lg-6">
    <div class="container">
        <div class="row">
            <div class="col-sm-5 mr-auto mb-4">
                <h4>Infolinka</h4>
                <div class="large-text">
                    {{ setting('site.infolinka') }}
                </div>
                <h4 class="mt-4">Newsletter</h4>
                <form class="validate-form" id="newsletter-form" action="{{ route('newsletter_subscribe') }}" method="post">
                    @csrf
                    <div class="input-group mb-4">
                        <input id="newsletter_eml" name="newsletter[email]" type="email" class="form-control required mr-2"
                               placeholder="Prosíme zadajte váš mail"
                               data-invalid-response="Prosíme, zadajte váš E-mail" aria-label="Recipient's username">
                        <button class="btn btn-orange px-md-5" type="submit">odoslať</button>
                        <div class="input-msg" data-id="newsletter_eml"></div>
                    </div>
                </form>
                <div class="social">
                    @if (is_set(setting('site.facebook')))<a href="{{ setting('site.facebook') }}"><i class="fab fa-facebook-f" aria-hidden="true"></i></a>@endif
                    @if (is_set(setting('site.pinterest')))<a href="{{ setting('site.pinterest') }}"><i class="fab fa-pinterest" aria-hidden="true"></i></a>@endif
                    @if (is_set(setting('site.instagram')))<a href="{{ setting('site.instagram') }}"><i class="fab fa-instagram" aria-hidden="true"></i></a>@endif
                </div>
            </div>
            <div class="col-sm-3 mb-4">
                <h4>Spoločnosť</h4>
                {!! setting('site.footer_contact') !!}
            </div>
            <div class="col-sm-3 mb-4">
                <h4>Dôležité informácie</h4>
                {{ menu('Footer') }}
            </div>
        </div>
    </div>
</footer>
