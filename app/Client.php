<?php

namespace App;

use Auth;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\DB;

class Client extends Model
{

    use Notifiable;

	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'address_id',
		'company_id',
		'name',
		'street',
		'zip',
		'city',
		'country',
		'phone',
		'email',
		'password',
        'password_reset',
		'type',
		'temp'
	];


	/**
	 * The attributes that should be hidden for arrays.
	 *
	 * @var array
	 */
	protected $hidden = [
		'password', 'remember_token',
	];


	/**
	 * Client has model assigned or User is logged in
	 * @return bool
	 */
	public static function exists()
	{
		if(Auth::check() or session()->has('client_id')) return true;
		return false;
	}


    /**
     * Get Logged User or Registered Client Eloquent Model
     * @return mixed
     */
    public function get()
    {

        // User is logged in and authorized
        if(Auth::check()) {
            return $this->find(Auth::user()->id);
        }

        // User is going to update his
        // temporary profile
        if(session()->has('client_id')) {
            $client_id = session('client_id');
            return $this->find($client_id);
        }

        // User is not authorized and hasn't
        // created profile yet
        return null;
    }


    /**
     * Get User ID or Temporary Client ID
     * @return \Illuminate\Session\SessionManager|\Illuminate\Session\Store|mixed
     */
    public static function id()
    {
	    if(self::exists()) {

            if(Auth::check()) {
                return Auth::user()->id; // User id
            } else return session('client_id'); // Temporary Client id

        }
    }


    /**
     * Get Client Firstname
     * @return mixed
     */
    public static function getFirstname() {
        if(self::exists()) {
            $id = self::id();
            $fullname = Client::find($id)->name;
            list($firstname,$lastname) = explode(' ',$fullname);
            return $firstname;
        }
        return false;
    }

    /**
     * Get Client Registration Type Attribute
     * @param $type
     * @return string
     */
    public function getTypeAttribute($type) {
        switch($type) {
            case 0: return 'Návštevník'; break;
            case 1: return 'Užívateľ'; break;
            case 2: return 'Veľkoodberateľ'; break;
        }
    }

    /**
     * Get Client Registration Type Attribute
     * @param $type
     * @return string
     */
    public function getTempAttribute($status) {
        switch($status) {
            case 0: return 'Nie'; break;
            case 1: return 'Áno'; break;
        }
    }

    /**
     * Get Current Seller Acceptation Status
     * @param $status
     * @return string
     */
    public function getApprovedAttribute($status) {
        switch($status) {
            case 0: return 'Čaká na schválenie'; break;
            case 1: return 'Schválený'; break;
        }
    }


	/**
	 * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
	 */
	public function company()
	{
		return $this->belongsTo('App\Company');
	}


	/**
	 * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
	 */
	public function address()
	{
		return $this->belongsTo('App\Address');
	}


	/**
	 * @return \Illuminate\Database\Eloquent\Relations\HasMany
	 */
	public function orders()
	{
		return $this->hasMany('App\Order');
	}

}
