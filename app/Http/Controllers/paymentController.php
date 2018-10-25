<?php

namespace App\Http\Controllers;

use PayPal\Api\Amount;
use PayPal\Api\Item;
use PayPal\Api\ItemList;
use PayPal\Api\Payer;
use PayPal\Api\Payment;
use PayPal\Api\RedirectUrls;
use PayPal\Api\Transaction;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Exception\PayPalConnectionException;

use PayPal\Rest\ApiContext;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;

class paymentController extends Controller
{

	private $_api_context;

	/**
	 * paymentController constructor.
	 */
	public function __construct()
	{

		/** PayPal api context **/
		$paypal_conf = config()->get('paypal');
		$this->_api_context = new ApiContext(
			new OAuthTokenCredential(
				$paypal_conf['client_id'],
				$paypal_conf['secret']
			));
		$this->_api_context->setConfig($paypal_conf['settings']);

	}

	/**
	 * @param Request $request
	 * @return \Illuminate\Http\RedirectResponse
	 */
	public function payWithpaypal(Request $request)
	{

		$payer = new Payer();
		$payer->setPaymentMethod('paypal');

		$item_1 = new Item();

		$item_1->setName('Item 1') /** item name **/
		->setCurrency('EUR')
			->setQuantity(1)
			->setPrice(10); /** unit price **/

		$item_list = new ItemList();
		$item_list->setItems(array($item_1));

		$amount = new Amount();
		$amount->setCurrency('USD')
			->setTotal($request->get('amount'));

		$transaction = new Transaction();
		$transaction->setAmount($amount)
			->setItemList($item_list)
			->setDescription('Your transaction description');

		$redirect_urls = new RedirectUrls();
		$redirect_urls->setReturnUrl(URL::route('status')) /** Specify return URL **/
		->setCancelUrl(URL::route('status'));

		$payment = new Payment();
		$payment->setIntent('Sale')
			->setPayer($payer)
			->setRedirectUrls($redirect_urls)
			->setTransactions(array($transaction));
		/** dd($payment->create($this->_api_context));exit; **/
		try {

			$payment->create($this->_api_context);

		} catch (PayPalConnectionException $ex) {

			if (config()->get('app.debug')) {

				session()->put('error', 'Connection timeout');
				return redirect()->route('paywithpaypal');

			} else {

				session()->put('error', 'Some error occur, sorry for inconvenient');
				return redirect()->route('paywithpaypal');

			}

		}

		foreach ($payment->getLinks() as $link) {

			if ($link->getRel() == 'approval_url') {

				$redirect_url = $link->getHref();
				break;

			}

		}

		/** add payment ID to session **/
		session()->put('paypal_payment_id', $payment->getId());

		if (isset($redirect_url)) {

			/** redirect to paypal **/
			return redirect()->away($redirect_url);

		}

		session()->put('error', 'Unknown error occurred');
//		return redirect()->route('paywithpaypal');
		return view('eshop.payment');

	}

}
