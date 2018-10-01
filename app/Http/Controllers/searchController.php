<?php

namespace App\Http\Controllers;

use App\Product;
use App\Recept;
use Illuminate\Http\Request;
use Illuminate\Support\MessageBag;

class searchController extends Controller
{

	public $keyword;

	/**
	 * @desc Search Products and Recipes
	 * @param Request $request
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function search(Request $request)
	{
		$this->keyword = $request->keyword;
		if(is_set($this->keyword) and strlen($this->keyword)>3)
		{

			$products = Product::where('product_id', '=', '0')
				->Where(function ($query) {
					$query->where('name','like','%'.$this->keyword.'%')
						->orWhere('description','like','%'.$this->keyword.'%');
				})->get();

			$recepts = Recept::where('title','like','%'.$this->keyword.'%')
				->orWhere('content','like','%'.$this->keyword.'%')
				->get(); // Search recipes

			return view('eshop.search', compact('products','recepts'));
		}
		else
		{
			$error = new MessageBag(['Hľadaný výraz musí obsahovať aspoň 4 znaky.']);
			return view('eshop.search')->withErrors($error);
		}

	}

}
