<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Gloudemans\Shoppingcart\Facades\Cart;

class Order extends Model
{
	/**
	 * @var Order ID
	 */
	public $id = null;

    public $fillable = [
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
	 * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
	 */
	public function payment()
	{
		return $this->belongsTo('App\Payment');
	}


	/**
	 * @desc Vrati celkovu cenu objednavky vratane dopravy a platby
	 *
	 * @return mixed
	 */
	public function total()
	{
		$this->amount = floatval(Cart::total());
		return ($this->amount + $this->shipping->price + $this->payment->price);
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
			$order = $this->where([
				'client_id' => $client_id,
				'status_id' => '0'
			])->get()->first()->toArray();
			$this->id = $order['id'];
			return $order['id'];
		}
		return false;
	}

}
