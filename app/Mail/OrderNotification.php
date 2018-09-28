<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class OrderNotification extends Mailable
{
    use Queueable, SerializesModels;

    public $data = [];

	/**
	 * Create a new message instance.
	 *
	 * @param null $order
	 */
    public function __construct($order=null)
    {
        $this->data = $order;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('mail.order')
			->subject('Naturiq.sk - Potvrdenie objednávky')
			->with('data',$this->data);
    }
}
