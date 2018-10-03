<?php

namespace App\Http\Controllers;

use App\Newsletter;
use Illuminate\Http\Request;

class newsletterController extends Controller
{

    /**
     * Subscribe E-mail address To Newsletter
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function subscribe(Request $request)
    {
        $request->validate([
            'newsletter.email' => 'required|email'
        ]);

        $email = $request->newsletter['email'];

        if($this->email_exists($email))
            return back()->with('error','Táto e-mailová adresa je do odberu našich noviniek zaradená. <a href="'.route('newsletter_unsubscribe', [$email]).'">Odhlásiť adresu z odberu</a>');

        $newsletter = Newsletter::updateOrCreate(
            ['email'=>$email],
            ['subscription'=>'1']
        );

        $newsletter->save();

        return back()->with('message', 'Ďakujeme, boli ste zaradení do odberu toho najzaujímavejšieho zo sveta '.config('app.name'));
    }


    /**
     * Unsubscribe E-mail address from Newsletter
     * @param $email
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function unsubscribe($email, Request $request)
    {
        $request->validate([
            'unsubscribe' => 'email'
        ]);

        $newsletter = Newsletter::where('email',$email)->first();
        $newsletter->subscription = '0';
        $newsletter->save();

        return back()->with('message', 'E-mailová adresa bola odhlásená z odberu našich noviniek.');
    }


    /**
     * Returns true if requested e-mail address already exists in db
     * @param $email
     * @return mixed
     */
    private function email_exists($email)
    {
        $exists = Newsletter::where('email',$email)->where('subscription','1')->first();
        if($exists) return true;
        return false;
    }

}
