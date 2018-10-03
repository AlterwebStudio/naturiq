<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
//use Illuminate\Contracts\Queue\ShouldQueue;

class RequestFormNotification extends Mailable
{
    use Queueable, SerializesModels;

    public $data = [];

    /**
     * Create a new message instance.
     * @param $data
     * @return void
     */
    public function __construct($data=null)
    {
        if(is_array($data)) $this->data = $data;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('mail.request-form')
            ->from(setting('admin.email'), config('app.name'))
			->subject(config('app.name') . ' - Kontaktný formulár')
			->with('form',$this->data);
    }
}
