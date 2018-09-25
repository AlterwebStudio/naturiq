<?php

namespace App\Http\Controllers;

use App\Coupon;
use Illuminate\Http\Request;
use Illuminate\Support\MessageBag;
use Gloudemans\Shoppingcart\Facades\Cart;

class CouponController extends Controller
{

	/**
	 * @desc Active Discount Coupon to the Order
	 * @param Request $request
	 * @param MessageBag $errors
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function activate(Request $request, MessageBag $errors)
	{
		if(isset($request->coupon['code']) and !empty($request->coupon['code']))
		{
			$code = $request->coupon['code'];
			$coupon = Coupon::get($code);

			// Coupon does not exists
			if(!$coupon) $errors->add('coupon', 'Zľavový kupón so zadaným kódom neexistuje');

			// Coupon was already activated
			if($this->can_be_activated() === false) $errors->add('coupon', 'Jednorazový zľavový kupón už bol na túto objednávku aplikovaný');

			// No errors - pass the coupon
			if($errors->count() == 0) {
				session(['coupon' => $coupon->code]);
				return redirect()->back()->with('message', 'Zľavový kupón bol aktivovaný');
			}

		} else $errors->add('coupon', 'Zadajte kód zľavového kupónu');

		return redirect()->back()->withErrors($errors);
	}


	/**
	 * @desc Checks if Coupon can be activated (wasn't used for this order yet)
	 * @return bool
	 */
	private function can_be_activated()
	{
		if(session()->has('coupon')) return false;
		return true;
	}

}
