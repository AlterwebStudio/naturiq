<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Store extends Model
{
    public $timestamps = false;

    /**
     * Store Belongs To City relationship
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function city()
    {
        return $this->belongsTo('App\City');
    }

}
