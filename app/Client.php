<?php

namespace App;

use Auth;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Client extends Model
{

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
		if(Auth::check() or session()->has('client')) return true;
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
			return Auth::user();
		}

		// User has own model eloquent generated
		// and stored in the session
		if(session()->has('client')) {
			return session('client');
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
	 * Generate new client with aditional connections in DB
	 * Store generated Client model into the session
	 * @param Request $request
	 * @return int
	 */
	public function generate(Request $request)
	{

		if(!$request->address) $request->address = [];
		if(!$request->company) $request->company = [];

		$address_id = DB::table('addresses')->insertGetId($request->address);
		$company_id = DB::table('companies')->insertGetId($request->company);

		$client = $request->client;
		$client['address_id'] = $address_id;
		$client['company_id'] = $company_id;

		$client_id = DB::table('clients')->insertGetId($client);
		session(['client'=>$this->find($client_id)]);

		return $client_id;

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
