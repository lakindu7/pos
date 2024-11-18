<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    protected $fillable = [
        'name',
        'contactperson',
        'telephone',
        'address',
        'delivaryday',
        'frequency',
        'nextdelivary',
        'user_id',
    ];

    public function products()
    {
        return $this->hasMany(Product::class);
    }
}
