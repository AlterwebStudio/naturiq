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

	private $order = null;

	/**
	 * confirmationController constructor.
	 */
	public function set()
	{
		$this->order = (new Order)->get();
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

		if(Client::exists() and $this->order) {

			// Store Cart Content in DB
            Cart::instance('default')->store($this->order->id);

            // Set necessary variables and store it in DB
            $this->enclose();

            // Notify client and customer
			$this->notify(setting('admin.email')); // Client
			$this->notify($this->order->client->email); // Customer

			// Clear Sessions
			$this->clear();

			// Display greetings message to Customer
			return view('eshop.greetings')->with('order',$this->order);

		}
		else
		{
			return redirect()->back()
				->with('error','Objednávka alebo údaje o zákazníkovi nie sú k dispozícií.');
		}

	}

	/**
	 * Generate order number, change status and set final total price
	 */
	private function enclose() {

		$this->enhance_buys(); // Zvysit pocet nakupov jednotlivych produktov

		$this->order->number = date('Ymd-') . $this->order->id;
		$this->order->status_id = 1;
		$this->order->coupon_id = Coupon::get_id();
		$this->order->customer = $this->order->client->name;
		$this->order->total_price = $this->order->total();
		$this->order->temp = '0';

		$this->order->save();
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
    	if(Cart::instance('default')->count()>0) {
			foreach (Cart::instance('default')->content() as $item) {
				$product = Product::find($item->id);
				if($product) {
					$product->buys += 1;
					$product->save();
				}
			}
		}
    }


	/**
	 * Notify client and customer about order placement
	 * @param $email_address
	 */
	private function notify($email_address) {
		Mail::to($email_address)->send( new OrderNotification() );
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
