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
		'country_id',
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

		$request->client['address_id'] = $address_id;
		$request->client['company_id'] = $company_id;

		return DB::table('clients')->insertGetId($request->client);

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
