<?php

namespace App\Http\Controllers;

use App\Coupon;
use App\Product;
use \Auth;
use App\Client;
use App\Order;
use App\Mail\OrderNotification;
use Illuminate\Http\Request;
use Illuminate\Mail\Message;
use Illuminate\Support\MessageBag;
use Illuminate\Support\Facades\Mail;
use Gloudemans\Shoppingcart\Facades\Cart;

//use GoPay;
//use GoPay\Definition\Language;
//use GoPay\Definition\Payment\Currency;
//use GoPay\Definition\Payment\PaymentInstrument;
//use GoPay\Definition\Payment\BankSwiftCode;
//use GoPay\Definition\Payment\Recurrence;

class confirmationController extends Controller
{

    private $order_id = null;
	private $order = null;
	private $data = null;

	/**
	 * confirmationController constructor.
	 */
	public function set()
	{
		$order = (new Order)->get();

		$this->order_id = $order->id;
		$this->order = $order;

		if($order) {
			$data = [];
			$data['order'] = $order;
			$data['shipping'] = $order->shipping;
			$data['payment'] = $order->payment;
			$data['total'] = $order->total();
			$this->set_data($data);
		}
	}

	/**
	 * @desc Set Order Data
	 * @param $data
	 */
	public function set_data($data) {
		$this->data = $data;
	}

	/**
	 * @desc Get Order Data
	 * @return null
	 */
	public function get_data() {
		return $this->data;
	}

	/**
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function index()
	{
		$this->set();

		if($this->order) {
			return view('eshop.confirmation')
				->with('order',$this->order);
		}
		else {
			$error = new MessageBag(['Objednávka neexistuje.']);
			return redirect(route('cart'))
				->withErrors($error);
		}
	}

	/**
	 * @return \Illuminate\Http\RedirectResponse
	 */
	public function store()
	{
		$this->set();

		if(Client::exists() and is_array($this->data)) {

            Cart::instance('default')->store($this->order_id);

			$this->enhance_buys(); // Zvysit pocet nakupov jednotlivych produktov

			//$this->payment_gopay();

			$this->prepare();
            $this->enclose();

			$this->notify(setting('admin.email')); // Notifikacia klientovi
			$this->notify($this->data['order']->client->email); // Notifikacia zakaznikovi

			$this->clear();

			return view('eshop.greetings')->with('dataset',$this->data);

		}
		else {
			$error = new MessageBag(['Objednávka alebo údaje o zákazníkovi nie sú k dispozícií.']);
			return redirect()->back()
				->withErrors($error);
		}

	}

	/**
	 * @desc Execute payment by GoPay service
	 * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
	 */
/*	private function payment_gopay() {
		$gopay = GoPay\payments([
			'goid' => config('gopay.goid'),
			'clientId' => config('gopay.clientId'),
			'clientSecret' => config('gopay.clientSecret'),
			'isProductionMode' => false,
			'language' => Language::SLOVAK
		]);

		$response = $gopay->createPayment([
			'payer' => [
				'default_payment_instrument' => PaymentInstrument::BANK_ACCOUNT,
				'allowed_payment_instruments' => [PaymentInstrument::BANK_ACCOUNT],
				'default_swift' => BankSwiftCode::FIO_BANKA,
				'allowed_swifts' => [BankSwiftCode::FIO_BANKA, BankSwiftCode::MBANK],
				'contact' => [
					'first_name' => 'Zbynek',
					'last_name' => 'Zak',
					'email' => 'zbynek.zak@gopay.cz',
					'phone_number' => '+420777456123',
					'city' => 'C.Budejovice',
					'street' => 'Plana 67',
					'postal_code' => '373 01',
					'country_code' => 'CZE',
				],
			],
			'amount' => 150,
			'currency' => Currency::EUROS,
			'order_number' => '001',
			'order_description' => 'pojisteni01',
			'items' => [
				['name' => 'item01', 'amount' => 50],
				['name' => 'item02', 'amount' => 100],
			],
			'additional_params' => [
				['name' => 'invoicenumber', 'value' => '2015001003']
			],
			'callback' => [
				'return_url' => 'http://www.your-url.tld/return',
				'notification_url' => 'http://www.your-url.tld/notify'
			],
			'lang' => Language::SLOVAK, // if lang is not specified, then default lang is used
		]);

		if ($response->hasSucceed()) {
			// response format: https://doc.gopay.com/en/?shell#standard-payment
			$msg = "hooray, API returned {$response}<br />\n";
			$msg .= "Gateway url: {$response->json['gw_url']}";
			return redirect($response->json['gw_url']);
		} else {
			// errors format: https://doc.gopay.com/en/?shell#http-result-codes
			dd("Chyba pri spracovaní platby {$response->statusCode}: {$response}");
		}
	}*/

    /**
     * Enhance count of Product buys
     */
    private function enhance_buys()
    {
        foreach(Cart::content() as $item)
        {
            $product = Product::find($item->id);
            $product->buys += 1;
            $product->save();
        }
    }

	/**
	 * Prepare values to update in db [order number, status ...]
	 */
	private function prepare() {
		$this->order->number = date('Ymd-') . $this->order_id;
		$this->order->status_id = 1;
		$this->order->customer = $this->data['order']->client->name;
		$this->order->total_price = $this->order->total();
		$this->order->temp = '0';
	}

	/**
	 * Notify client and customer about order placement
	 * @param $email_address
	 */
	private function notify($email_address) {
		Mail::to($email_address)->send( new OrderNotification($this->order) );
	}

	/**
	 * Generate order number, change status and set final total price
	 */
	private function enclose() {
		$this->order->save();
	}

	/**
	 * @desc Clear session data about client and order
	 */
	public function clear()
	{
		Cart::destroy();
		Coupon::remove();
        Order::forget();
	}

}
