<?php
/**
 * @desc Format money
 * @param $price
 * @return string
 */

function format_money($price)
{
	setlocale(LC_MONETARY, 'de_DE');
	return money_format('%!n €', floatval($price));
}


/**
 * @desc Get requested thumbnail image path
 * @param $image
 * @param string $type
 * @return string
 */
function image_get_thumbnail($image, $type='thumb') {

	// We need to get extension type ( .jpeg , .png ...)
	$ext = pathinfo($image, PATHINFO_EXTENSION);

	// We remove extension from file name so we can append thumbnail type
	$ext_length = strlen($ext)+1; // Get the length of extension + 1 (dot)
	$name = substr($image,0,-$ext_length);

	// We merge original name + type + extension
	return $name.'-'.$type.'.'.$ext;

}


/**
 * @desc Deside what
 * @param $name
 * @return mixed
 */
function deside($name) {

	if(old($name)) return old($name);

	if(Auth::user() or session()->has('client_id')) {
		$model = new \App\Client;
		$client = $model->get();
		list($table, $column) = explode('.', $name);
		if (isset($client->$column)) return $client->$column;
		if (isset($client->$table->$column)) return $client->$table->$column;
	}

}