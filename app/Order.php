<?php

namespace App;

use Auth;
use App\Client;
use Illuminate\Database\Eloquent\Model;
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
	 * @desc Returns Collect instance of the current Order
	 *
	 * @return false or Eloquent Order Model with all relations
	 */
	public function get()
	{
	    $order_id = $this->get_id();
		if($order_id) {
			return $this->find($order_id);
		}
		return false;
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
	 * @return \Illuminate\Database\Eloquent\Relations\hasOne
	 */
	public function items()
	{
		return $this->hasOne('App\OrderItems','identifier');
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
        return floatval($items) + floatval($others);
	}


	/**
	 * @desc Returns Order price without VAT
     * including prices for Shipping and Payment method
	 *
	 * @return mixed
	 */
	public static function subtotal()
	{
        return Cart::instance('default')->subtotal(2,'.','');
//        $others = Cart::instance('others')->subtotal(2,'.','');
//        return floatval($items) + floatval($others);
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

}
