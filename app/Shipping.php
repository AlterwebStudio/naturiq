<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Shipping extends Model
{
	public $timestamps = false;

	/**
	 * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
	 */
	public function payments()
	{
		return $this->belongsToMany('App\Payment')->where('active','1');
	}

}
