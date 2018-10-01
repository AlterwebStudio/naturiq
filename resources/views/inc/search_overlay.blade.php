<section id="search-overlay" class="offcanvas">
  <div class="container">
    <span class="fa fa-times close"></span>
    <form class="" action="{{ route('search') }}" method="post">
      @csrf
      <div class="form-group">
        <input class="form-control" type="text" name="keyword" value="" id="search" >
      </div>
    </form>
  </div>
  <div class="search_close_area close"></div>
</section>
