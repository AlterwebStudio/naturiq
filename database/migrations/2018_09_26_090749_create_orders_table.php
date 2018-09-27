<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateOrdersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('orders', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('client_id')->nullable();
			$table->smallInteger('shipping_id')->nullable();
			$table->smallInteger('payment_id')->nullable();
			$table->smallInteger('status_id')->nullable();
			$table->smallInteger('discount_id')->nullable();
			$table->string('number', 16)->nullable();
			$table->string('customer', 64)->nullable();
			$table->float('shipping_price', 5)->nullable();
			$table->float('payment_price', 5)->nullable();
			$table->float('total_price', 7)->nullable();
			$table->integer('payment-status_id')->nullable();
			$table->text('note', 65535)->nullable();
			$table->text('note_internal', 65535)->nullable();
			$table->timestamps();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('orders');
	}

}
