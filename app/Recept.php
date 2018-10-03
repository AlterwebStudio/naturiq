<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Recept extends Model
{

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function tags()
    {
        return $this->belongsToMany('App\ReceptTag', 'recept_recept-tag', 'recept_tag_id', 'recept_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function products()
    {
        return $this->belongsToMany('App\Product');
    }

}
