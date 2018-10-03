<?php

namespace App\Http\Controllers;

use App\Recept;
use App\ReceptTag;
use Illuminate\Http\Request;

class receptController extends Controller
{

    /**
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
