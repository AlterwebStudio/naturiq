<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    public $timestamps = false;

	/**
	 * @desc Get Coupon Eloquent Model by Code
	 * @return mixed
	 */
	public static function get()
	{
		if(session()->has('coupon')) {
			$code = session('coupon');
			return self::where('code', '=', $code)->first();
		}
		return false;
	}

	/**
	 * @desc Format Discount Value to printable
	 * @return string
	 */
	public function getDiscountAttribute()
	{
		$discount = number_format($this->value, 0);
		if($this->type == 'AMOUNT') return '- '. $discount .'&nbsp;&euro;';
		if($this->type == 'PERCENT') return '- '. $discount .'&nbsp;&#37;';
		return null;
	}

	/**
	 * Deactivate / Remove discount coupon from the order
	 * @return boolean
	 */
	public function remove()
	{
		if(session()->has('coupon')) {
			return session()->forget('coupon');
		}
		return false;
	}

}
