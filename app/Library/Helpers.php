<?php

/**
 * @desc Format money
 *
 * @param $price
 * @return string
 */

function format_money($price)
{
	setlocale(LC_MONETARY, 'de_DE');
	$price = float_price($price);
	return money_format('%!n €', floatval($price));
}


/**
 * @desc Convert output formatted price to float num
 * @param $price
 * @return string
 */
function float_price($price)
{
    $price = str_replace(['€', ' '], '', $price);
    $price = str_replace(',', '.', $price);
    return floatval($price);
}


/**
 * @desc Checks if the price is regular float number higher than 0
 * @param $price
 * @return string
 */
function regular_price($price)
{
    if($price > 0 and $price != '0,00 €') return true;
    return false;
}


/**
 * @desc Get requested thumbnail image path
 *
 * @param $image
 * @param string $type
 * @return string
 */
function image_get_thumbnail($image, $type='thumb')
{
	// We need to get extension type ( .jpeg , .png ...)
	$ext = pathinfo($image, PATHINFO_EXTENSION);

	// We remove extension from file name so we can append thumbnail type
	$ext_length = strlen($ext)+1; // Get the length of extension + 1 (dot)
	$name = substr($image,0,-$ext_length);

	// We merge original name + type + extension
	return $name.'-'.$type.'.'.$ext;
}


/**
 * @desc Returns true if current subpage is not part of E-shop Route group
 * or current Page is not part of Non-Master-Routes. This function serves
 * for displaying S2U messages on correct places
 *
 * @return boolean
 */
function master_message()
{
    $non_master_routes = ['kontakt'];

    $page = request()->segment(1);
    $prefix = substr(request()->route()->getPrefix(),1);

    if($prefix and $prefix === 'eshop') return false;
    elseif(in_array($page, $non_master_routes)) return false;

    return true;
}


/**
 * @desc Returns true if variable has no empty value
 *
 * @param $variable
 * @return boolean
 */
function is_set($variable)
{
	if(is_array($variable))
	{
		if(count($variable) > 0) return true;
	}
	else
    {
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