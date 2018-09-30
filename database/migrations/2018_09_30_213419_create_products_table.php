<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateProductsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('products', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('product_id')->nullable();
			$table->string('name', 128)->nullable();
			$table->integer('category_id')->nullable();
			$table->string('code', 11)->nullable();
			$table->float('price_default', 7)->nullable();
			$table->float('price_action', 7)->nullable();
			$table->string('weight', 32)->nullable();
			$table->text('contents', 65535)->nullable();
			$table->text('description', 65535)->nullable();
			$table->text('nutritions', 65535)->nullable();
			$table->string('image')->nullable();
			$table->text('gallery', 65535)->nullable();
			$table->simple_array('featured')->nullable()->default(0);
			$table->enum('active', array('0','1'))->nullable()->default('1');
			$table->integer('buys')->nullable();
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
		Schema::drop('products');
	}

}
