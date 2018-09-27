<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateShippingsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('shippings', function(Blueprint $table)
		{
			$table->smallInteger('id', true)->unsigned();
			$table->float('price', 5)->nullable();
			$table->string('name', 64)->nullable();
			$table->string('description')->nullable();
			$table->smallInteger('order')->nullable();
			$table->string('icon', 64)->nullable();
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
		Schema::drop('shippings');
	}

}
