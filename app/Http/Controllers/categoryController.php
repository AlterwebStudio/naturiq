<?php

namespace App\Http\Controllers;

use App\Product;
use App\Category;

use Illuminate\Http\Request;

class categoryController extends Controller
{

	/**
	 * @desc Share global important variables to Blade Views
	 * categoryController constructor.
	 */
	public function __construct()
	{
		$categories = Category::all()
			->where('active',1)
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
		if(!$request->category_id) return $this->featured();
		$products = Product::where('category_id', $request->category_id)
			->where('product_id','0')
			->where('active','1')
			->paginate(2); // Produkty z kategorie
		return view('eshop.category', compact('products'));
	}


	/**
	 * @desc List featured items (sorted by most wanted - how many times was item bought)
	 * @param bool $paginate
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function featured($paginate=true)
	{
		$list = Product::where('featured','1')
			->where('product_id','0')
			->where('active','1')
			->orderBy('buys');
		$products = $paginate ? $list->paginate(2) : $list->get();
		return view('eshop.category', compact('products'));
	}

}
