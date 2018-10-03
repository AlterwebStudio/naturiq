<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ReceptTag extends Model
{
    protected $table = 'recept-tags';

    public function recepts()
    {
        return $this->belongsToMany('App\Recept', 'recept_recept-tag', 'recept_id', 'recept_tag_id');
    }
}
