<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Request;

class Product extends Model
{
	public $timestamps = false;


    /**
     * @desc Returns individual price falling to a User
     * @return mixed
     */
	public function getPriceAttribute()
	{
		// Default Product Price
		$price = $this->price_default;

		// Action Price
		if($this->price_action > 0 and $this->price_action < $this->price_default) {
			$price = $this->price_action;
		}

		// Client Discount
		if(Auth::check())
		{

			// If Seller is logged, set seller price as default
			if(Client::is_seller()) $price = $this->price_seller;

			// Logged Client Instance
			$client = (new Client)->get();

			// Check if Client has Account Discount
			if($client->discount > 0)
			{
				// Apply client Discount to default Product Price
				$price_discount = $this->price_default * ((100 - $client->discount)/100);
				if($price_discount < $price) $price = $price_discount; // If discount price is lower than default or action price, returns it
			}

		}

		$price = floatval($price);

		if($price > 0) return round($price,2, PHP_ROUND_HALF_UP);
		else return 0;
	}


    /**
     * @desc Product can be possibly used in Recepts as ingredient
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function recepts()
    {
        return $this->belongsToMany('App\Recept')->orderBy('created_at');
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
     * @desc get the most wanted products in category or globaly
     * @param bool $paginate
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
	public function get_featured($paginate=true)
	{
		if(isset($this->category_id))
		{
            $products = Product::selectRaw("*, substring_index(code,'-',1) as `codeBase`")
                ->where('category_id', $this->category_id)
                ->where('active','yes')
                ->orderByDesc('featured')
                ->orderByDesc('buys')
                ->groupBy("codeBase")
                ->limit(8); // Ini tiez kupili
		}
		else
        {
		    $products = Product::selectRaw("*, substring_index(code,'-',1) as `codeBase`")
                ->where('active','yes')
                ->orderByDesc('featured')
                ->orderByDesc('buys')
                ->groupBy("codeBase")
                ->limit(8); // Najoblubenejsie produkty
        }
        return $paginate ? $products->paginate(8) : $products->get();
	}


	/**
	 * @desc get products in sale
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function sale()
	{
        return Product::where('price_action', '>', '0')
            ->where('active','yes')
            ->orderByDesc('buys')
            ->take(8)
            ->get(); // Akciove produkty
	}


	/**
	 * @desc Returns product parent or self if this is the parent
	 * @return \Illuminate\Database\Eloquent\Relations\belongsTo
	 */
	public function parent()
	{
		// Product is parent - returns itself as main
		if ($this->product_id === 0 or !$this->product_id) {
			return $this->belongsTo('App\Product', 'id');
		}
		// Product is child - returns parent
		return $this->belongsTo('App\Product', 'product_id');
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
	 */
	public function variants()
	{

		if(Client::is_seller()) {

			return $this->whereRaw("(`id` = '{$this->parent->id}' OR `product_id` = '{$this->parent->id}')")
				->where('price_seller','>',0)
				->where('active','yes')
				->orderBy('order')
				->get();

		} else {

			return $this->whereRaw("(`id` = '{$this->parent->id}' OR `product_id` = '{$this->parent->id}')")
				->where('active','yes')
				->orderBy('order')
				->get();
		}

	}


    /**
     * @desc Returns product childs
     * @return \Illuminate\Database\Eloquent\Relations\HasMany|\Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function childs()
    {
        return $this->hasMany('App\Product')->orderByDesc('order');
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
		$discount = 100 - ((float_price($this->price_default) / float_price($this->price_action)) * 100);
		return round($discount) . '%';
	}


	/**
	 * @desc Because image gallery is stored in DB as JSON
	 * method returns images prepared to print out as Associative Array
	 * @return mixed
	 */
	public function get_gallery()
	{
		return json_decode($this->image);
	}


    /**
     * @desc Returns readable format of current product status if output is in browse view
     * @param $status
     * @return string
     */
    public function getActiveAttribute($status)
    {
        if(Request::route()->getPrefix()=='admin' and empty(Request::segment(3))) {
            switch ($status) {
                case 'no':
                    return 'Neaktívny';
                    break;
                case 'yes':
                    return 'Aktívny';
                    break;
            }
        }
        return $status;
    }

}