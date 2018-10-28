<?php

namespace App\Http\Controllers;

use Anouar\Paypalpayment\PaypalPayment;
use App\Order;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Support\Facades\Request;
use PayPal\Exception\PayPalConnectionException;

class paymentController extends Controller
{

	private $config;

	public function __construct()
	{
		$this->config = [
			'mode' => config('paypal_payment.mode'),

			'account' => [
				'client_id' => config('paypal_payment.account.client_id'),
				'client_secret' => config('paypal_payment.account.client_secret'),
			],

			'http' => [
				'connection_time_out' => config('paypal_payment.http.connection_time_out'),
			],

			'log' => [
				'log_enabled' => config('paypal_payment.log.log_enabled'),
				'file_name' => config('paypal_payment.log.file_name'),
				'log_level' => config('paypal_payment.log.log_level'),
			],
		];
	}

	/*
	* Process payment using credit card
	*/
	/**
	 * Payment by PayPal Credit card
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function paywithCreditCard()
	{
		$PaypalPayment = new PaypalPayment($this->config);

		// ### Address
		// Base Address object used as shipping or billing
		// address in a payment. [Optional]
		$shippingAddress = $PaypalPayment->shippingAddress();
		$shippingAddress->setLine1("3909 Witmer Road")
			->setLine2("Niagara Falls")
			->setCity("Niagara Falls")
			->setState("NY")
			->setPostalCode("14305")
			->setCountryCode("US")
			->setPhone("716-298-1822")
			->setRecipientName("Jhone");

		// ### CreditCard
		$card = $PaypalPayment->creditCard();
		$card->setType("visa")
			->setNumber("4758411877817150")
			->setExpireMonth("05")
			->setExpireYear("2019")
			->setCvv2("456")
			->setFirstName("Joe")
			->setLastName("Shopper");

		// ### FundingInstrument
		// A resource representing a Payer's funding instrument.
		// Use a Payer ID (A unique identifier of the payer generated
		// and provided by the facilitator. This is required when
		// creating or using a tokenized funding instrument)
		// and the `CreditCardDetails`
		$fi = $PaypalPayment->fundingInstrument();
		$fi->setCreditCard($card);

		// ### Payer
		// A resource representing a Payer that funds a payment
		// Use the List of `FundingInstrument` and the Payment Method
		// as 'credit_card'
		$payer = $PaypalPayment->payer();
		$payer->setPaymentMethod("credit_card")
			->setFundingInstruments([$fi]);

		$item1 = $PaypalPayment->item();
		$item1->setName('Ground Coffee 40 oz')
			->setDescription('Ground Coffee 40 oz')
			->setCurrency('EUR')
			->setQuantity(1)
			->setTax(0.3)
			->setPrice(7.50);

		$item2 = $PaypalPayment->item();
		$item2->setName('Granola bars')
			->setDescription('Granola Bars with Peanuts')
			->setCurrency('EUR')
			->setQuantity(5)
			->setTax(0.2)
			->setPrice(2);


		$itemList = $PaypalPayment->itemList();
		$itemList->setItems([$item1,$item2])
			->setShippingAddress($shippingAddress);


		$details = $PaypalPayment->details();
		$details->setShipping("1.2")
			->setTax("1.3")
			//total of items prices
			->setSubtotal("17.5");

		//Payment Amount
		$amount = $PaypalPayment->amount();
		$amount->setCurrency("EUR")
			// the total is $17.8 = (16 + 0.6) * 1 ( of quantity) + 1.2 ( of Shipping).
			->setTotal("20")
			->setDetails($details);

		// ### Transaction
		// A transaction defines the contract of a
		// payment - what is the payment for and who
		// is fulfilling it. Transaction is created with
		// a `Payee` and `Amount` types

		$transaction = $PaypalPayment->transaction();
		$transaction->setAmount($amount)
			->setItemList($itemList)
			->setDescription("Payment description")
			->setInvoiceNumber(uniqid());

		// ### Payment
		// A Payment Resource; create one using
		// the above types and intent as 'sale'

		$payment = $PaypalPayment->payment();

		$payment->setIntent("sale")
			->setPayer($payer)
			->setTransactions([$transaction]);

		try {
			// ### Create Payment
			// Create a payment by posting to the APIService
			// using a valid ApiContext
			// The return object contains the status;
			$payment->create($PaypalPayment->apiContext());
		} catch (PayPalConnectionException $ex) {
			return response()->json(["error" => $ex->getMessage()], 400);
		}

		return response()->json([$payment->toArray()], 200);
	}


	/**
	 * Payment by PayPal Express Checkout
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function paywithPaypal()
	{

		$PaypalPayment = new PaypalPayment($this->config);
		$Order = (new Order)->get();
		
		// ### Address
		// Base Address object used as shipping or billing
		// address in a payment. [Optional]
		$shippingAddress= $PaypalPayment->shippingAddress();
		$shippingAddress->setLine1($Order->client->street)
			->setCity($Order->client->city)
			->setState($Order->client->country)
			->setCountryCode('SK')
			->setPostalCode($Order->client->zip)
			->setPhone($Order->client->phone)
			->setRecipientName($Order->client->name);

		// ### Payer
		// A resource representing a Payer that funds a payment
		// Use the List of `FundingInstrument` and the Payment Method
		// as 'credit_card'
		$payer = $PaypalPayment->payer();
		$payer->setPaymentMethod("paypal");

		$items = [];
		if(Cart::instance('default')->count() > 0) {

			foreach(Cart::instance('default')->content() as $key => $item)
			{

				$PPitem = $PaypalPayment->item();
				$PPitem->setName($item->name)
					->setDescription($item->weight)
					->setCurrency('EUR')
					->setQuantity($item->qty)
					->setPrice($item->price);

				$items[] = $PPitem;
			}

		}


		$itemList = $PaypalPayment->itemList();
		$itemList->setItems($items)
			->setShippingAddress($shippingAddress);


		$details = $PaypalPayment->details();
		$details->setShipping($Order->shipping->price)
			->setTax(0)
			->setSubtotal(Order::subtotal());

		//Payment Amount
		$amount = $PaypalPayment->amount();
		$amount->setCurrency("EUR")
			->setTotal($Order->total_price)
			->setDetails($details);

		// ### Transaction
		// A transaction defines the contract of a
		// payment - what is the payment for and who
		// is fulfilling it. Transaction is created with
		// a `Payee` and `Amount` types

		$transaction = $PaypalPayment->transaction();
		$transaction->setAmount($amount)
			->setItemList($itemList)
			->setDescription("Platba za objednávku (".$Order->number.") na ". config('name'))
			->setInvoiceNumber(uniqid());

		// ### Payment
		// A Payment Resource; create one using
		// the above types and intent as 'sale'

		$redirectUrls = $PaypalPayment->redirectUrls();
		$redirectUrls->setReturnUrl(url("/eshop/platba/uspesna"))
			->setCancelUrl(url("/eshop/platba/zlyhala"));

		$payment = $PaypalPayment->payment();

		$payment->setIntent("sale")
			->setPayer($payer)
			->setRedirectUrls($redirectUrls)
			->setTransactions([$transaction]);

		try {
			// ### Create Payment
			// Create a payment by posting to the APIService
			// using a valid ApiContext
			// The return object contains the status;
			$payment->create($PaypalPayment->apiContext());
		} catch (PayPalConnectionException $ex) {
			return response()->json(["error" => $ex->getMessage()], 400);
		}

		return redirect()->away($payment->getApprovalLink());
		// return response()->json([$payment->toArray(), 'approval_url' => $payment->getApprovalLink()], 200);
	}


	public function paymentSuccessful()
	{
		// Retrieve Order Data to use them
		$order = new confirmationController;
		$order->set();
		$order->set_payment_success();
		$order->clear();

		// Display greetings message to Customer
		return view('eshop.greetings')
			->with('order',$order->get())
			->with('message', 'Platba bola úspešne zaznamenaná, ďakujeme.');
	}


	public function paymentFailure()
	{

		// Display Error message to Customer
		return view('eshop.payment')->with('error','Platba nebola zrealizovaná. Vašu objednávku sme však obdržali spolu s informáciou o zlyhaní vašej online platby.
                                Budeme vás kontaktovať ohľadom výberu iného spôsobu platby. Platbu prípadne môžete skúsiť zopakovať opätovným <a href="'. route('eshop.confirmation') .'">odoslaním objednávky</a>.');

	}

}
