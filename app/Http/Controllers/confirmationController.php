<?php

namespace App\Http\Controllers;

use App\Client;
use App\Order;
use App\Mail\OrderNotification;
use Illuminate\Http\Request;
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

	/**
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function index()
	{
		$data = [];

		$Order = new Order;
		$order = $Order->get();

		$Client = new Client;
		$client = $Client->get();

		if(!$order or !$client) $data['warning'] = 'Objednávka neexistuje, <a href="/prihlasenie">prihláste sa prosím</a>.';

		return view('eshop.confirmation')->with([
			'client' => $client,
			'order' => $order,
		]);
	}

	/**
	 * @param Request $request
	 * @return \Illuminate\Http\RedirectResponse
	 */
	public function store(Request $request)
	{

		if($request->session()->exists('client_id') and null != $this->order) {

			Cart::store($this->order_id);

			//$this->payment_gopay();

			$this->prepare();
			$this->notify('tetrev@alterweb.sk'); // Notifikacia klientovi
			$this->notify($this->data['order']->client->email); // Notifikacia zakaznikovi
			$this->enclose();
			$this->clear();

			return view('eshop.greetings')->with([
				'order' => $this->data
			]);

		} else {
			return back();
		}

	}

	/**
	 * @desc Execute payment by GoPay service
	 * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
	 */
	private function payment_gopay() {
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
			/*
			$msg = "hooray, API returned {$response}<br />\n";
			$msg .= "Gateway url: {$response->json['gw_url']}";
			dd($msg);
			*/
			return redirect($response->json['gw_url']);
		} else {
			// errors format: https://doc.gopay.com/en/?shell#http-result-codes
			dd("Chyba pri spracovaní platby {$response->statusCode}: {$response}");
		}
	}

	/**
	 * Prepare values to update in db [order number, status ...]
	 */
	private function prepare() {
		$this->order->number = date('Ymd-') . $this->order_id;
		$this->order->status_id = 1;
		$this->order->customer = $this->data['order']->client->name;
		$this->order->total_price = $this->data['total'];
	}

	/**
	 * Notify client and customer about order placement
	 */
	private function notify($email_address) {
		Mail::to($email_address)->send( new OrderNotification($this->data) );
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
	}

}
