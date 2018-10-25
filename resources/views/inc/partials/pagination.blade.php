{{--<nav class="pagination pt-0 pb-5">

  <a href="#" class="pagination-item active">1</a>
  <a href="#" class="pagination-item">2</a>
  <a href="#" class="pagination-item">3</a>
  <a href="#" class="pagination-item">4</a>
  <a href="#" class="pagination-item">5</a>

</nav>--}}
<section class="pt-0 pb-5">


@if (isset($products))

    {{ $products->links() }}

@elseif (isset($recepts))

    {{ $recepts->links() }}

@endif

</section>
