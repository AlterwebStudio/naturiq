<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{

	/**
	 * @return mixed
	 */
	public function products()
	{
		return $this->hasMany('App\Product');
	}

	/**
	 * @return \Illuminate\Database\Eloquent\Relations\HasMany
	 */
	public function subcategories()
	{
		return $this->hasMany('App\Category','category_id','id') ;
	}

}
