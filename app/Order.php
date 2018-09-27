<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use \Auth;
use Gloudemans\Shoppingcart\Facades\Cart;

class Order extends Model
{
	/**
	 * @var Order ID
	 */
//	public $id;

    public $fillable = [
    	'id',
    	'client_id',
    	'shipping_id',
    	'payment_id',
    	'status_id',
    	'discount_id',
    	'number',
    	'customer',
    	'shipping_price',
    	'payment_price',
    	'total_price',
    	'payment-status_id',
    	'note',
	];


	/**
	 * @desc Vrati collect instanciu rozpracovanej objednavky
	 *
	 * @return null
	 */
	public function get()
	{
		if($this->get_id()) {
			return $this->find($this->id);
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
	 * @return \Illuminate\Database\Eloquent\Relations\hasOne
	 */
	public function items()
	{
		return $this->hasOne('App\OrderItems','identifier');
	}


	/**
	 * @desc Vrati celkovu cenu objednavky vratane dopravy a platby
	 *
	 * @return mixed
	 */
	public function total()
	{
		$amount = floatval(str_replace(",", ".", Cart::subtotal()));
		return ($amount + floatval($this->shipping->price) + floatval($this->payment->price));
	}


	/**
	 * @param $price
	 * @return string
	 */
	public function getTotalPriceAttribute($price) {
		setlocale(LC_MONETARY, 'de_DE');
		return money_format('%!n €', $price);
	}


	/**
	 * @desc Vrati ID rozpracovanej objednavky prihlaseneho zakaznika
	 * Vrati false v pripade neprihlaseneho uzivatela, alebo
	 * v pripade, ze neexistuje ziadna rozpracovana objednavka
	 *
	 * @return bool
	 */
	public function get_id()
	{
    	if(Auth::check())
    	{
			$client_id = Auth::user()->id;
			$order = $this->where('client_id',$client_id)->where('status_id','0')->first();

			if($order and isset($order->id)) {
				$this->id = $order->id;
				return $order->id;
			}
			return null;
		}
		return false;
	}

}
