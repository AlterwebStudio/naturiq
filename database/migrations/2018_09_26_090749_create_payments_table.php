<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePaymentsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('payments', function(Blueprint $table)
		{
			$table->smallInteger('id', true)->unsigned();
			$table->string('name', 64)->nullable();
			$table->string('description')->nullable();
			$table->string('identifier', 64)->nullable();
			$table->float('price', 5)->nullable();
			$table->smallInteger('order')->nullable();
			$table->enum('active', array('0','1'))->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('payments');
	}

}
