<?php

namespace App\Http\Controllers;

use Srmklive\PayPal\Services\ExpressCheckout;
use Srmklive\PayPal\Services\AdaptivePayments;

class paymentController extends Controller
{

	// private $_api_context;

	public function payWithpaypal()
	{
		try {

			$data = [];
			$data['items'] = [
				[
					'name' => 'Product 1',
					'price' => 9.99,
					'qty' => 1
				],
				[
					'name' => 'Product 2',
					'price' => 4.99,
					'qty' => 2
				]
			];

			$data['invoice_id'] = 1;
			$data['invoice_description'] = "Order #{$data['invoice_id']} Invoice";
			$data['return_url'] = url('/payment/success');
			$data['cancel_url'] = url('/cart');

			$total = 0;
			foreach($data['items'] as $item) {
				$total += $item['price']*$item['qty'];
			}

			$data['total'] = $total;

			//give a discount of 10% of the order amount
			$data['shipping_discount'] = round((10 / 100) * $total, 2);

			$provider = new ExpressCheckout;
			$provider->setCurrency('EUR');

			$response = $provider->setExpressCheckout($data);

			dd($response);

			// This will redirect user to PayPal
			return view('eshop.payment');

		} catch (\Exception $e) {

			return redirect()->route('paywithpaypal')
				->with('error', 'Problém pri spracovaní platby');

		}

	}

	/*
	public function __construct()
	{

		$paypal_conf = config()->get('paypal');
		$this->_api_context = new ApiContext(
			new OAuthTokenCredential(
				$paypal_conf['client_id'],
				$paypal_conf['secret']
			));
		$this->_api_context->setConfig($paypal_conf['settings']);

	}

	public function payWithpaypal(Request $request)
	{

		$payer = new Payer();
		$payer->setPaymentMethod('paypal');

		$item_1 = new Item();

		$item_1->setName('Item 1')
		->setCurrency('EUR')
			->setQuantity(1)
			->setPrice(10);

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
		$redirect_urls->setReturnUrl(URL::route('status')) // Specify return URL
		->setCancelUrl(URL::route('status'));

		$payment = new Payment();
		$payment->setIntent('Sale')
			->setPayer($payer)
			->setRedirectUrls($redirect_urls)
			->setTransactions(array($transaction));
		//dd($payment->create($this->_api_context));exit;
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

		// add payment ID to session
		session()->put('paypal_payment_id', $payment->getId());

		if (isset($redirect_url)) {

			// redirect to paypal
			return redirect()->away($redirect_url);

		}

		session()->put('error', 'Unknown error occurred');
//		return redirect()->route('paywithpaypal');
		return view('eshop.payment');

	}*/

}
