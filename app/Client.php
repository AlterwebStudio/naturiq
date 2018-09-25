<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Client extends Model
{

	public $timestamps = false;

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
	 * Get Logged User or Registered Client Eloquent Model
	 * @return mixed
	 */
	public function get()
	{
		// User is logged in and authorized
		if(\Auth::user()) {
			$client = \Auth::user();
			return $this->find($client->id);
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
		session('client_id', $client_id);

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
