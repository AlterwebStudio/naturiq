<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderItems extends Model
{

    public $table = 'order-items';

	/**
	 * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
	 */
	public function order()
    {
        return $this->belongsTo('App\Order','identifier');
    }

	/**
	 * @param $json
	 * @return mixed
	 */
	public function getContentAttribute($json) {
        return unserialize($json);
    }

}
