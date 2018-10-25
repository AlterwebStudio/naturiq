<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class OrderNotification extends Mailable
{
    use Queueable, SerializesModels;

	/**
	 * Create a new message instance.
	 */
    public function __construct()
    {
    	//
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
    	$order = (new \App\Order)->get();
        return $this->view('mail.order')
            ->from('tetrev@alterweb.sk', config('app.name'))
			->subject(config('app.name') . ' - Potvrdenie objednávky')
			->with('order',$order);
    }
}
