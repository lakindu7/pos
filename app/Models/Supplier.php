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

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function suppliercontacts()
    {
        return $this->hasMany(SupllierContact::class);
    }
}
