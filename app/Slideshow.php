<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Slideshow extends Model
{

    public $timestamps = false;

    protected $table = 'slideshow';


    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function background()
    {
        return $this->belongsTo('App\Background');
    }


    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function product()
    {
        return $this->belongsTo('App\Product');
    }

}
