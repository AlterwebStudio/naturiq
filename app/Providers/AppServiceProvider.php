<?php

namespace App\Providers;

use App\Banner;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {

    	// Set default db string length
		Schema::defaultStringLength(191);

		// Share variables used in most of subcategories
		$banner = Banner::inRandomOrder()->first();

		view()->share([
			'banner'=>$banner
		]);
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
		if ($this->app->environment() !== 'production') {
			$this->app->register(\Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider::class);
		}
    }
}
