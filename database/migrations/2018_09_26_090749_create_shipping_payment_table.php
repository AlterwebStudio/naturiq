<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateShippingPaymentTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('shipping_payment', function(Blueprint $table)
		{
			$table->smallInteger('shipping_id')->unsigned()->index('shipping_id');
			$table->smallInteger('payment_id')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('shipping_payment');
	}

}
