<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ResetPasswordNotification extends Mailable
{
    use Queueable, SerializesModels;

    private $credentials;

    /**
     * Create a new message instance.
     * @param array $credentials
     */
    public function __construct($credentials = [])
    {
        $this->credentials = $credentials;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('mail.forgotten-password')
            ->from('tetrev@alterweb.sk', config('app.name'))
			->subject(config('app.name') . ' - Vaše prihlasovacie údaje')
            ->with('credentials',$this->credentials);
    }
}
