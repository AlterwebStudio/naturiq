<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderItems extends Model
{

    public $table = 'order-items';

    public function order()
    {
        return $this->belongsTo('App\Order','identifier');
    }

    public function getContentAttribute($json) {
        return unserialize($json);
    }

}
