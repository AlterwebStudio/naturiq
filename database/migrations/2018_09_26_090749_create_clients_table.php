<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateClientsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('clients', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('address_id')->nullable();
			$table->integer('company_id')->nullable();
			$table->string('name', 64)->nullable();
			$table->string('street', 64)->nullable();
			$table->string('zip', 8)->nullable();
			$table->string('city', 32)->nullable();
			$table->string('country', 32)->nullable();
			$table->string('phone', 16)->nullable();
			$table->string('email', 64)->nullable();
			$table->string('password', 64)->nullable();
			$table->string('remember_token', 100)->nullable();
//			$table->simple_array('type')->nullable()->default(0)->comment('0=neregistrovany,1=registrovany,2=velkoobchod');
			$table->enum('approved', array('0','1'))->nullable()->default('0');
			$table->enum('temp', array('0','1'))->nullable()->default('1');
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
		Schema::drop('clients');
	}

}
