<?php

namespace App\Services;

use App\Models\Product;

class DiscountCalculatorService
{
    public function calculate(Product $product): array
    {
        $originalPrice = (float) $product->price;
        $totalDiscount = 0;
        $discountBreakdown = [];

        foreach ($product->discounts as $discount) {
            $amount = 0;

            if ($discount->type === 'percentage') {
                $amount = ($originalPrice * (float) $discount->value) / 100;
            } elseif ($discount->type === 'fixed') {
                $amount = (float) $discount->value;
            }

            $totalDiscount += $amount;

            $discountBreakdown[] = [
                'id' => $discount->id,
                'title' => $discount->title,
                'type' => $discount->type,
                'value' => (float) $discount->value,
                'discount_amount' => round($amount, 2),
            ];
        }

        $finalPrice = max($originalPrice - $totalDiscount, 0);

        return [
            'original_price' => round($originalPrice, 2),
            'total_discount' => round($totalDiscount, 2),
            'final_price' => round($finalPrice, 2),
            'discounts' => $discountBreakdown,
        ];
    }
}