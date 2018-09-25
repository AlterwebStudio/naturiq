<?php

use Illuminate\Database\Seeder;

class ProductsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('products')->insert([
			'name' => str_random(10),
			'category_id' => rand(1,5),
			'code' => str_random(5),
			'price_default' => rand(20.3,25.8),
			'price_action' => rand(15.0,20.3),
			'weight' => '200',
			'description' => str_word_count(500),
			'image' => 'images/produkty/1.png',
			'nutritions' => str_random(200),
			'recept_id' => rand(1,5),
			'active' => 1,
		]);
    }
}
