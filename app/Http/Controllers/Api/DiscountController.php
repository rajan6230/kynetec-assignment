<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Discount;
use Illuminate\Http\JsonResponse;

class DiscountController extends Controller
{
    public function index(): JsonResponse
    {
        $discounts = Discount::paginate(10);

        return response()->json($discounts);
    }
}