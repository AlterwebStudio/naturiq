<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;

class productController extends Controller
{

	/**
	 * @desc Show Product Detail
	 * @param Request $request
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function show(Request $request)
	{
		$requested_product = Product::find($request->product_id); // Request product model
    	$product = $requested_product->parent; // Push the parent of request product to the blade view
    	return view('eshop.product',compact('product'));
	}

}
