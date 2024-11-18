<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'name',
        'name_si',
        'slug',
        'description',
        'barcode',
        'sku',
        'expiredate',
        'image',
        'alertlimit',
        'youtubelink',
        'tags',
        'sellingtype',
        'isFeatured',
        'category_id',
        'subcategory_id',
        'childcategory_id',
        'brand_id',
        'section_id',
        'supplier_id',
        'user_id'
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function subcategory()
    {
        return $this->belongsTo(Subcategory::class);
    }

    public function childcategory()
    {
        return $this->belongsTo(Childcategory::class);
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }

    public function section()
    {
        return $this->belongsTo(Section::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function stock()
    {
        return $this->hasMany(Stock::class);
    }

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }
}
