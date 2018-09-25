<?php

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