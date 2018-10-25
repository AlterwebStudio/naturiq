<?php

namespace App\Http\Controllers;

use App\Product;
use App\Category;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class categoryController extends Controller
{

	/**
	 * @desc Share global important variables to Blade Views
	 * categoryController constructor.
	 */
	public function __construct()
	{
		$categories = Category::all()
            ->where('active','yes')
			->sortBy('order');
		view()->share('categories',$categories);
	}


	/**
	 * @desc List items with specified category
	 * @param Request $request
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function list(Request $request)
	{
		if(!$request->category_id) return $this->new();
		$products = Product::where('category_id', $request->category_id)
			->where('product_id','0')
            ->where('active','yes')
			->paginate(8); // Produkty z kategorie
		return view('eshop.category', compact('products'));
	}


	/**
	 * @desc List featured items (sorted by most wanted - how many times was item bought)
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function featured()
	{

		$subtitle = 'Najpredávanejšie';

        $products = Product::where('product_id','0')
            ->where('active','yes')
            ->orderByDesc('featured')
            ->orderByDesc('buys')
            ->groupBy("code")
            ->paginate(8);

		return view('eshop.category', compact('products', 'subtitle'));
	}


	/**
	 * @desc List products from category "Novinky" (New products)
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function new()
	{

		$subtitle = 'Novinky';

        $products = Product::where('product_id','0')
			->where('category_id','1')
            ->where('active','yes')
            ->orderByDesc('buys')
            ->groupBy("code")
            ->paginate(8);

        if($products->count()==0) return $this->featured();

		return view('eshop.category', compact('products','subtitle'));
	}

}
