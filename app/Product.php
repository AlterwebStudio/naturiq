<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Product extends Model
{
	public $timestamps = false;


	/**
	 * @desc Vrati cenu produktu platnu pre konkretneho navstevnika / uzivatela
	 * @param $details
	 * @return mixed
	 */
	public function getPriceAttribute()
	{
		$price = ($this->price_action > 0 and $this->price_action < $this->price_default) ? $this->price_action : $this->price_default;
		return floatval($price);
	}


	/**
	 * @param $price
	 * @return string
	 */
	public function getPriceDefaultAttribute($price)
	{
		setlocale(LC_MONETARY, 'de_DE');
		return money_format('%!n €', $price);
	}


	/**
	 * @param $price
	 * @return string
	 */
	public function setPriceDefaultAttribute($price)
	{
		return $this->float_price($price);
	}


	/**
	 * @param $price
	 * @return string
	 */
	public function getPriceActionAttribute($price)
	{
		setlocale(LC_MONETARY, 'de_DE');
		return money_format('%!n €', $price);
	}


	/**
	 * @param $price
	 * @return string
	 */
	public function setPriceActionAttribute($price)
	{
		return $this->float_price($price);
	}


	/**
	 * @param $num1
	 * @param $num2
	 * @return mixed
	 */
	public function getNumDifference($num1, $num2)
	{
		return $num2 - $num1;
	}


	/**
	 * @desc Returns Product Category slug
	 * @param $product_id
	 * @return mixed
	 */
	public static function get_category_slug($product_id)
	{
		$product = self::find($product_id);
		if(isset($product->category)) return $product->category->slug;
		return null;
	}


	/**
	 * @desc get the most wanted products in category
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function featured()
	{
		if(isset($this->category_id)) {
			return Product::where('category_id', $this->category_id)
				->where('product_id', '0')
				->where('active', '1')
				->orderBy('buys')
				->inRandomOrder()
				->take(8)
				->get(); // Ini tiez kupili
		}
		return null;
	}


	/**
	 * @desc Returns product parent or self if this is the parent
	 * @return \Illuminate\Database\Eloquent\Relations\belongsTo
	 */
	public function parent()
	{
		// Product is parent - returns itself as main
		if ($this->product_id === 0) {
			return $this->belongsTo('App\Product', 'id');
		}
		// Product is child - returns parent
		return $this->belongsTo('App\Product', 'product_id');
	}


	/**
	 * @desc Returns product childs
	 * @return \Illuminate\Database\Eloquent\Relations\HasMany|\Illuminate\Database\Eloquent\Relations\HasOne
	 */
	public function childs()
	{
		return $this->hasMany('App\Product')->orderBy('weight');
	}


	/**
	 * @desc Returns product childs
	 * @return \Illuminate\Database\Eloquent\Relations\HasMany|\Illuminate\Database\Eloquent\Relations\HasOne
	 */
	public function getSlugAttribute()
	{
		return str_slug($this->name,'-');
	}


	/**
	 * @desc Returns all product variants (parent product with all child)
	 * @return \Illuminate\Support\Collection
	 */
	public function variants()
	{
		return DB::table('products')
			->where('id', '=', $this->parent->id)
			->orWhere('product_id', '=', $this->parent->id)
			->orderBy('weight')
			->get();
	}


	/**
	 * @desc Returns tags belonging to Product
	 * @return mixed
	 */
	public function tags()
	{
		return $this->BelongsToMany('App\Tag', 'product_tag');
	}


	/**
	 * @desc Returns attributes belonging to Product
	 * @return mixed
	 */
	public function attributes()
	{
		return $this->BelongsToMany('App\Attribute', 'attribute_product');
	}


	/**
	 * @desc Check if the product has action price set and is lower than it's default price
	 * @return boolean
	 */
	public function in_action()
	{
		return ($this->price_action > 0 and $this->price_action < $this->price_default) ? true : false;
	}


	/**
	 * @desc Calculate discount value between action and default Product prices
	 * @return float|int
	 */
	public function get_discount()
	{
		$discount = 100 - (($this->float_price($this->price_default) / $this->float_price($this->price_action)) * 100);
		return round($discount) . '%';
	}


	/**
	 * @desc Convert output formatted price to float num
	 * @param $price
	 * @return string
	 */
	public function float_price($price)
	{
		$price = str_replace(['€', ' '], '', $price);
		$price = str_replace(',', '.', $price);
		return floatval($price);
	}


	/**
	 * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
	 */
	public function category()
	{
		return $this->belongsTo('App\Category');
	}


	/**
	 * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
	 */
	public function categoryId()
	{
		return $this->belongsTo('App\Category');
	}


	/**
	 * @desc Because image gallery is stored in DB as JSON
	 * method returns images prepared to print out as Associative Array
	 * @return mixed
	 */
	public function gallery()
	{
		return json_decode($this->image);
	}

}