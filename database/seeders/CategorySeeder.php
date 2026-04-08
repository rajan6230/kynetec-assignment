<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    public function run(): void
    {
        $electronics = Category::updateOrCreate(
            ['name' => 'Electronics', 'parent_id' => null],
            ['name' => 'Electronics', 'parent_id' => null]
        );

        $fashion = Category::updateOrCreate(
            ['name' => 'Fashion', 'parent_id' => null],
            ['name' => 'Fashion', 'parent_id' => null]
        );

        Category::updateOrCreate(
            ['name' => 'Mobiles', 'parent_id' => $electronics->id],
            ['name' => 'Mobiles', 'parent_id' => $electronics->id]
        );

        Category::updateOrCreate(
            ['name' => 'Laptops', 'parent_id' => $electronics->id],
            ['name' => 'Laptops', 'parent_id' => $electronics->id]
        );

        Category::updateOrCreate(
            ['name' => 'Mens Wear', 'parent_id' => $fashion->id],
            ['name' => 'Mens Wear', 'parent_id' => $fashion->id]
        );
    }
}