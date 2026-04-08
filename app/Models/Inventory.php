<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Inventory extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = 'inventory';

    protected $fillable = [
        'product_id',
        'quantity',
        'last_restocked_at',
    ];

    protected $casts = [
        'last_restocked_at' => 'datetime',
        'quantity' => 'integer',
    ];

    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class);
    }
}