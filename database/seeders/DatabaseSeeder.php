<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Discount;
use App\Models\Inventory;
use App\Models\Product;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        User::query()->delete();
        Category::query()->delete();
        Discount::query()->delete();
        Product::query()->delete();
        Inventory::query()->delete();
		
		$this->call([
            UserSeeder::class,
        ]);

        $user1 = User::create([
            'name' => 'Admin User',
            'email' => 'admin@example.com',
            'password' => Hash::make('password123'),
        ]);

        $user2 = User::create([
            'name' => 'Test User',
            'email' => 'user@example.com',
            'password' => Hash::make('password123'),
        ]);

        $electronics = Category::create([
            'name' => 'Electronics',
            'parent_id' => null,
        ]);

        $fashion = Category::create([
            'name' => 'Fashion',
            'parent_id' => null,
        ]);

        $mobiles = Category::create([
            'name' => 'Mobiles',
            'parent_id' => $electronics->id,
        ]);

        $laptops = Category::create([
            'name' => 'Laptops',
            'parent_id' => $electronics->id,
        ]);

        $mensWear = Category::create([
            'name' => 'Mens Wear',
            'parent_id' => $fashion->id,
        ]);

        $discount1 = Discount::create([
            'title' => 'Summer Sale 10%',
            'type' => 'percentage',
            'value' => 10,
        ]);

        $discount2 = Discount::create([
            'title' => 'Flat 500 Off',
            'type' => 'fixed',
            'value' => 500,
        ]);

        $discount3 = Discount::create([
            'title' => 'Festival 5%',
            'type' => 'percentage',
            'value' => 5,
        ]);

        $product1 = Product::create([
            'name' => 'iPhone 15',
            'description' => 'Apple smartphone with premium features',
            'price' => 79999,
            'category_id' => $mobiles->id,
        ]);

        $product2 = Product::create([
            'name' => 'Dell Inspiron',
            'description' => 'Dell laptop for work and study',
            'price' => 55999,
            'category_id' => $laptops->id,
        ]);

        $product3 = Product::create([
            'name' => 'Men Casual Shirt',
            'description' => 'Comfortable cotton casual shirt',
            'price' => 1499,
            'category_id' => $mensWear->id,
        ]);

        Inventory::create([
            'product_id' => $product1->id,
            'quantity' => 15,
            'last_restocked_at' => now(),
        ]);

        Inventory::create([
            'product_id' => $product2->id,
            'quantity' => 10,
            'last_restocked_at' => now(),
        ]);

        Inventory::create([
            'product_id' => $product3->id,
            'quantity' => 50,
            'last_restocked_at' => now(),
        ]);

        $product1->discounts()->attach([$discount1->id, $discount2->id]);
        $product2->discounts()->attach([$discount3->id]);
        $product3->discounts()->attach([$discount1->id]);
    }
}