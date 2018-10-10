<?php

namespace App\Widgets;

use App\Recept;
use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;

class Recepts extends AbstractWidget
{
	/**
	 * The configuration array.
	 *
	 * @var array
	 */
	protected $config = [];

	/**
	 * Treat this method as a controller action.
	 * Return view() or other content to display.
	 */
	public function run()
	{
		$count = Recept::count();
		$string = trans_choice('voyager::dimmer.recept', $count);

		return view('voyager::dimmer', array_merge($this->config, [
			'icon'   => 'voyager-news',
			'title'  => "{$count} {$string}",
			'text'   => __('voyager::dimmer.recept_text', ['count' => $count, 'string' => Str::lower($string)]),
			'button' => [
				'text' => __('voyager::dimmer.recept_link_text'),
				'link' => '/admin/recepts',
			],
			'image' => voyager_asset('images/widget-backgrounds/02.jpg'),
		]));
	}

	/**
	 * Determine if the widget should be displayed.
	 *
	 * @return bool
	 */
	public function shouldBeDisplayed()
	{
		return true;
	}
}
