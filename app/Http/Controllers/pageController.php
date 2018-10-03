<?php

namespace App\Http\Controllers;

use App\Mail\RequestFormNotification;
use App\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use TCG\Voyager\Models\Page;

class pageController extends Controller
{

    /**
     * Get static Text subpage. Fill content from db table: Pages
     *
     * @blade View: /text.blade.php
     * @param $slug
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index($slug)
    {
        $page = Page::where('slug',$slug)->first();
        return view('text', compact('page'));
    }

    /**
     * Display Homepage Based on Blade View
     *
     * @blade View: /home.blade.php
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function home()
    {
        $featured = (new Product)->featured();
        $sale = (new Product)->sale();
        return view('home', compact('featured', 'sale'));
    }

    /**
     * Display Contact Category Based on Blade View
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function contact()
    {
        return view('contact');
    }


    /**
     * Execute Contact Form
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function form(Request $request)
    {
        $request->validate([
            'contact.name' => 'required|min:5',
            'contact.email' => 'required|email',
            'contact.message' => 'required|min:20',
            'gdpr_consent' => 'required',
        ]);

        Mail::to(setting('admin.email'))->send( new RequestFormNotification($request->contact) );

        return back()->with('message','Vaša správa nám bola doručená.');
    }

}
