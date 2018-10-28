<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    public $timestamps = false;

	/**
	 * @desc Get Coupon Eloquent Model by Code
	 * @param null $code
	 * @return mixed
	 */
	public static function get($code=null)
	{
		// If Coupon was successfuly activated before
		// and is stored in sessions, get it
		if(self::exists()) {
			$code = session('coupon');
			return self::where('code', $code)->first();
		}

		// Find available coupon by code
		$coupon = self::where('code', $code)->where('available','yes')->first();

		if($coupon) {

			// Only once usable coupon
			if ($coupon->usage == 'ONCE') {
				// Check if the coupon wasn't used yet
				if (!$coupon->used_at) return $coupon;
			}

			// Permanent coupon or limited by date
			if ($coupon->usage == 'PERMANENT') {
				$today = date('Y-m-d');
				if ((!$coupon->available_from or $today >= $coupon->available_from) and
					(!$coupon->available_to or $today <= $coupon->available_to))
					return $coupon;
			}
		}

		return null;
	}

	/**
	 * @desc Returns true if Coupon is activated
	 * @return bool
	 */
	public static function exists()
	{
		if(session()->has('coupon')) {
			return true;
		}
		return false;
	}

	/**
	 * @desc Get Activated Coupon ID
	 * returns NULL if Coupon does not exist
	 */
	public static function get_id()
	{
		if(self::exists())
		{
			$coupon = self::get();
			if(isset($coupon->id)) return $coupon->id;
		}
		return NULL;
	}

	/**
	 * @desc Format Discount Value to printable
	 * @return string
	 */
	public function getDiscountAttribute()
	{
		$discount = number_format($this->value, 0);
		if($this->type == 'AMOUNT') return '-'. $discount .'&nbsp;&euro;';
		if($this->type == 'PERCENT') return '-'. $discount .'&nbsp;&#37;';
		return null;
	}

	/**
	 * Deactivate / Remove discount coupon from the order
	 * @return boolean
	 */
	public static function remove()
	{
		if(session()->has('coupon')) {
			return session()->forget('coupon');
		}
		return false;
	}

}
