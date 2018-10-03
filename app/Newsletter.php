<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Newsletter extends Model
{
    protected $table = 'newsletter';

    public $fillable = ['email','subscription'];

    public function getSubscriptionAttribute($status)
    {
        switch($status)
        {
            case 0: return 'Odhlásený'; break;
            case 1: return 'Aktívny'; break;
        }
    }
}
