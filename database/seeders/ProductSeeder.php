<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Discount;
use App\Models\Inventory;
use App\Models\Product;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    public function run(): void
    {
        $mobiles = Category::where('name', 'Mobiles')->first();
        $laptops = Category::where('name', 'Laptops')->first();
        $mensWear = Category::where('name', 'Mens Wear')->first();

        $summerSale = Discount::where('title', 'Summer Sale 10%')->first();
        $flatOff = Discount::where('title', 'Flat 500 Off')->first();
        $festivalSale = Discount::where('title', 'Festival 5%')->first();

        $product1 = Product::updateOrCreate(
            ['name' => 'iPhone 15'],
            [
                'description' => 'Apple smartphone with premium features',
                'price' => 79999,
                'category_id' => $mobiles?->id,
            ]
        );

        $product2 = Product::updateOrCreate(
            ['name' => 'Dell Inspiron'],
            [
                'description' => 'Dell laptop for work and study',
                'price' => 55999,
                'category_id' => $laptops?->id,
            ]
        );

        $product3 = Product::updateOrCreate(
            ['name' => 'Men Casual Shirt'],
            [
                'description' => 'Comfortable cotton casual shirt',
                'price' => 1499,
                'category_id' => $mensWear?->id,
            ]
        );

        $product1->discounts()->sync(array_filter([$summerSale?->id, $flatOff?->id]));
        $product2->discounts()->sync(array_filter([$festivalSale?->id]));
        $product3->discounts()->sync(array_filter([$summerSale?->id]));

        Inventory::updateOrCreate(
            ['product_id' => $product1->id],
            [
                'quantity' => 15,
                'last_restocked_at' => now(),
            ]
        );

        Inventory::updateOrCreate(
            ['product_id' => $product2->id],
            [
                'quantity' => 10,
                'last_restocked_at' => now(),
            ]
        );

        Inventory::updateOrCreate(
            ['product_id' => $product3->id],
            [
                'quantity' => 50,
                'last_restocked_at' => now(),
            ]
        );
    }
}