<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Stock extends Model
{
    protected $fillable = [
        'stockid',
        'reference',
        'quantity',
        'availablequantity',
        'price',
        'buyingprice',
        'marketprice',
        'total',
        'buyingtotal',
        'product_id',
        'user_id',
        'expiredate'
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
