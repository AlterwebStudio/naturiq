@extends ('master')

@section ('content')

    <nav aria-label="breadcrumb" class="breadcrumbs">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">Domov</a></li>
                    <li class="breadcrumb-item"><a href="{{ route('login') }}">Objednávky</a></li>
                    <li class="breadcrumb-item active">Detail objednávky</li>
                </ol>
            </div>
        </div>
    </nav>

    <section>
        <div class="container py-5">
            <div class="row">

                <div class="col-12 mb-5">
                    @include ('inc.partials.messages')
                </div>

                <div class="col-12">
                    <h2 class="text-center mb-4">
                        Objednávka {{ $order->number }}
                        <div class="line"></div>
                    </h2>

                    <div class="alert alert-light my-5 border border-light">
                        <h4 class="text-secondary">{{ $order->status->name }}</h4>
                        {{ $order->status->desc }}
                    </div>

                    <div class="shopping-cart">

                        <div class="shopping-cart__body">

                            @foreach ($order->items->content as $item)
                                @include ('inc.partials.shopping_cart_row_static', ['item' => $item])
                            @endforeach

                            {{-- SHIPPING ROW --}}
                            <div class="shopping-cart__row other_row">
                                <div class="col-sm-8 col-auto">
                                    <div class="name">
                                        <span class="heading">
                                            {{ $order->shipping->name }}
                                        </span>
                                        <span class="subheading">
                                            {{ $order->shipping->description }}
                                        </span>
                                    </div>
                                </div>
                                <div class="col"></div>
                                <div class="col prices text-sm-center text-lg-right">
                                    <div class="price_total">
                                        {{ format_money($order->shipping->price) }}
                                    </div>
                                </div>
                            </div>

                            {{-- PAYMENT ROW --}}
                            <div class="shopping-cart__row other_row">
                                <div class="col-sm-8 col-auto">
                                    <div class="name">
                                        <span class="heading">
                                            {{ $order->payment->name }}
                                        </span>
                                        <span class="subheading">
                                            {{ $order->payment->description }}
                                        </span>
                                    </div>
                                </div>
                                <div class="col"></div>
                                <div class="col prices text-sm-center text-lg-right">
                                    <div class="price_total">
                                        {{ format_money($order->payment->price) }}
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="shopping-cart__footer col-12">
                            <div class="row">
                                <div class="col-8 text-left">
                                    <div class="text-bg font-weight-bold">Celkom vrátane dopravy:</div>
                                    <div class="text-sm">Cena za dopravu:</div>
                                </div>
                                <div class="col text-right">
                                    <div class="text-bg font-weight-bold">{{ format_money( $order->total_price ) }}</div>
                                    <div class="text-sm">{{ format_money( $order->shipping_price ) }}</div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

            <div class="row mt-4">
                <div class="col-6">
                    <a href="{{ route('login') }}" class="btn btn-secondary">späť na objednávky</a>
                </div>
                <div class="col">
                    <form name="ReOrder" method="post" action="{{ route('eshop.order.reorder', $order->number) }}">
                        @csrf
                        <input type="submit" name="reorder" value="zopakovať objednávku" class="btn btn-orange float-right" />
                    </form>
                </div>
            </div>
        </div>

    </section>

@endsection