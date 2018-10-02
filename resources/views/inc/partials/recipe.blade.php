<div class="card recipe mb-4">
    <!-- ODZNAKY LAVA STRANA / -->
    <div class="recipe__tags_left">
        @foreach ($recept->tags as $tag)
        <div class="tag {{ $tag->class }}">{{ $tag->name }}</div>
        @endforeach
    </div>

    <!-- OBRAZOK RECEPTU -->
    <a href="/recepty/{{str_slug($recept->title)}}/{{$recept->id}}" class="recipe__image card-img-top">
        <figure class="content-image">
            <img src="{{ asset('/storage/'.$recept->illustration) }}">
        </figure>
    </a>

    <div class="card-body">
        <!-- NAZOV RECEPTU -->
        <h3 class="recipe__heading">
            {{ $recept->title }}
        </h3>
        <p class="recipe__description">
            {{ $recept->excerpt }}
        </p>
    </div>
</div>