<?php

namespace App\Http\Controllers;

use App\Product;
use App\Recept;
use App\ReceptTag;
use Illuminate\Http\Request;

class receptController extends Controller
{

    /**
	 * Get List of all Recipes
	 *
     * @param null $slug
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index($slug=null)
    {

        if($slug) {
            $tag = ReceptTag::where('slug',$slug)->first();
            $recepts = $tag->recepts()->paginate(8);
        } else {
            $recepts = Recept::paginate(8);
        }

        return view('recipes',compact('recepts'));
    }

	/**
	 * Get List of Recipes where the Product is used inside as Ingredient
	 *
	 * @param $product_slug
	 * @param $product_id
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
    public function product($product_slug, $product_id)
    {
    	$recepts = [];

        if($product_id) {
        	$product = (new Product)->find($product_id);
            $recepts = $product->recepts()->paginate(8);
        }

        return view('recipes',compact('recepts'));
    }


    /**
	 * Recipe Detail
	 *
     * @param $slug
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function show($slug, $id)
    {
        $recipe = Recept::find($id);
        return view('recipe', compact('recipe'));
    }



}
