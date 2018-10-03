<div class="card store">
  <!-- OBRAZOK RECEPTU -->
  <div href="recept.php" class="recipe__image card-img-top">
    <figure class="content-image">
      <img src="{{ image_get_thumbnail(asset('storage/'.$store->image),'cropped') }}">
    </figure>
  </div>

  <div class="card-body">

    <!-- NAZOV RECEPTU -->
    <h3 class="store__name">
      {{ $store->name }}
    </h3>

    <p class="store__adress">
      {{ $store->street }}<br />
      {{ $store->zip }}, {{ $store->city->name }}
    </p>

    <div class="separator"></div>

    <div class="store__hours_container">
      {!! $store->hours !!}
    </div>

  </div>
</div>
