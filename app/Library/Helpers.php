<?php

use App\Client;

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
function decide($name) {

	if(old($name)) return old($name);

	if(Client::exists()) {

		$model = new Client;
		$client = $model->get();

		if(strstr($name,'.')) list($table, $column) = explode('.', $name);
		else $column = $name;
		if (isset($table) and isset($client->$table->$column)) return $client->$table->$column;
		if (isset($client->$column)) return $client->$column;
	}

	return null;

}


/**
 * @desc Returns true if variable has no empty value
 * @param $variable
 * @return boolean
 */
function is_set($variable) {
	if(is_array($variable)) {
		if(count($variable) > 0) return true;
	}
	else {
		if(isset($variable)
			and $variable != ''
			and $variable != 'NULL'
			and $variable != null
			and empty($variable) == false
			and strlen($variable) > 0) {
			return true;
		}
	}
	return false;
}