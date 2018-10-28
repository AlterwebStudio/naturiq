<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Gloudemans\Shoppingcart\Facades\Cart;

class Order extends Model
{

    public $fillable = [
    	'id',
    	'client_id',
    	'shipping_id',
    	'payment_id',
    	'status_id',
    	'coupon_id',
    	'number',
    	'customer',
    	'shipping_price',
    	'payment_price',
    	'total_price',
    	'payment-status_id',
    	'note',
	];


	/**
	 * @desc Returns true if Order [order_id] is stored in session
	 * @return bool
	 */
	public static function exists()
	{
    	if(session()->has('order_id')) return true;
    	return false;
	}


    /**
     * Forget currently
     * Order [order_id],
     * Shipping [shipping_id],
     * Payment [payment_id]
     * stored in session
     */
    public static function forget()
    {
	    if(self::exists()) {
	        session()->forget('order_id');
	        session()->forget('shipping_id');
	        session()->forget('payment_id');
        }
    }


    /**
     * @desc Returns Order Instance
     *
     * @return false or Eloquent Order Model with all relations
     */
    public function get()
    {
        $order_id = $this->get_id();
        if($order_id) {
            return $this->findOrFail($order_id);
        }
        return false;
    }


    /**
     * @desc Returns Order ID or false in case of customer
	 * is not logged-in or in case no Order exists
     *
     * @return bool
     */
    public function get_id()
    {
        if(Order::exists())
        {
            return session('order_id');
        }

        if(Client::exists())
        {
            $client_id = session('client_id');
            $order = $this->where('client_id',$client_id)->where('status_id','0')->first();

            if(isset($order->id)) {
                return $order->id;
            }
        }

        return null;
    }


	/**
	 * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
	 */
	public function shipping()
	{
		return $this->belongsTo('App\Shipping');
	}


	/**
	 * @desc Restore order (Just in case user logged back after session expired)
	 * @param $order_id
	 */
	public function restore($order_id)
	{
		Cart::restore($order_id);
	}


	/**
	 * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
	 */
	public function status()
	{
		return $this->belongsTo('App\Status');
	}


	/**
	 * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
	 */
	public function payment_status()
	{
		return $this->belongsTo('App\PaymentStatus');
	}


    /**
     * @return \Illuminate\Database\Eloquent\Collection|static[]
     */
    public function statuses() {
		return Status::all();
	}


	/**
	 * @param $stamp
	 * @return false|string
	 */
	public function getCreatedAtAttribute($stamp)
	{
		return date('d.n.Y, H:i:s', strtotime($stamp));
	}


	/**
	 * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
	 */
	public function payment()
	{
		return $this->belongsTo('App\Payment');
	}


	/**
	 * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
	 */
	public function client()
	{
		return $this->belongsTo('App\Client');
	}


	/**
	 * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
	 */
	public function coupon()
	{
		return $this->belongsTo('App\Coupon');
	}


	/**
	 * @param $id
	 * @return mixed
	 */
	public function getPaymentStatusAttribute($id)
	{
		return $id;
	}


	/**
	 * @return \Illuminate\Database\Eloquent\Relations\hasOne
	 */
	public function items()
	{
		return $this->hasOne('App\OrderItems','identifier');
	}


	/**
	 * @desc Returns Order price without VAT
	 * including prices for Shipping and Payment method
	 *
	 * @return mixed
	 */
	public static function subtotal()
	{
		$subtotal = Cart::instance('default')->subtotal(2,'.','');
		return self::discount($subtotal);
	}


	/**
	 * @desc Returns total price for the Order
     * including prices for Shipping and Payment method
	 *
	 * @return mixed
	 */
	public static function total()
	{
	    $items = Cart::instance('default')->subtotal(2,'.','');
	    $others = Cart::instance('others')->subtotal(2,'.','');
	    return self::discount(floatval($items)) + floatval($others);
	}


	/**
	 * @desc Apply Coupon Discount to the Order
	 * if Coupon was applied
	 *
	 * @param $amount
	 * @return float|int
	 */
	private static function discount($amount)
	{
		$coupon = (new Coupon)->get();
		if($coupon) {
			if ($coupon->type == 'PERCENT') {
				return $amount * (1 - ($coupon->value / 100));
			} elseif ($coupon->type == 'AMOUNT') {
				$discounted = $amount - floatval(trim($coupon->value));
				return ($discounted < 0) ? 0 : $discounted;
			}
		}
		return $amount;
	}


	/**
	 * @desc Get Discount Amount / Difference in Eur
	 *
	 * @param $amount
	 * @return float|int
	 */
	public static function discountAmount($amount)
	{
		$coupon = (new Coupon)->get();
		if($coupon) {
			if ($coupon->type == 'PERCENT') {
				return format_money($amount * ($coupon->value / 100));
			} elseif ($coupon->type == 'AMOUNT') {
				return format_money($coupon->value);
			}
		}
		return 0;
	}

}
