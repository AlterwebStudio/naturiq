<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class OrderStatusChanged extends Notification
{
    use Queueable;

    private $order;

	/**
	 * Create a new notification instance.
	 *
	 * @param $order_id
	 */
    public function __construct($order_id)
    {
        $this->order = \App\Order::find($order_id);
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
		return (new MailMessage)
			->from(setting('admin.email'), config('app.name'))
			->subject('Zmena stavu vašej objednávky')
			->greeting($this->order->status->name)
			->line('Číslo objednávky: '.$this->order->number)
			->line($this->order->status->notification)
			->action('Otvoriť objednávky', route('eshop.order',[$this->order->number]))
			->line('Ďakujeme za dôveru!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
