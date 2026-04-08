<?php

namespace Database\Seeders;

use App\Models\Discount;
use Illuminate\Database\Seeder;

class DiscountSeeder extends Seeder
{
    public function run(): void
    {
        Discount::updateOrCreate(
            ['title' => 'Summer Sale 10%'],
            [
                'type' => 'percentage',
                'value' => 10,
            ]
        );

        Discount::updateOrCreate(
            ['title' => 'Flat 500 Off'],
            [
                'type' => 'fixed',
                'value' => 500,
            ]
        );

        Discount::updateOrCreate(
            ['title' => 'Festival 5%'],
            [
                'type' => 'percentage',
                'value' => 5,
            ]
        );
    }
}