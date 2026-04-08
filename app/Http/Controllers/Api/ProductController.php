<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Services\DiscountCalculatorService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function __construct(
        private DiscountCalculatorService $discountService
    ) {
    }

    public function index(Request $request): JsonResponse
    {
        $query = Product::with(['category', 'discounts', 'inventory']);

        if ($search = $request->get('search')) {
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                  ->orWhere('description', 'like', "%{$search}%");
            });
        }

        $products = $query->paginate(10);

        return response()->json($products);
    }

    public function show($id): JsonResponse  // ← CHANGED Product $product to $id
{
    $product = Product::with(['category', 'discounts', 'inventory'])->findOrFail($id);

    $pricing = $this->discountService->calculate($product);

    return response()->json([
        'product' => $product,
        'pricing' => $pricing,
    ]);
}
}