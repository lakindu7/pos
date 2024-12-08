<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Offer extends Model
{
    protected $fillable = [
        'name',
        'offer',
        'offertype',
        'minval',
        'discountvalue',
        'discounttype',
        'vaildtill',
        'user_id'
    ];
}
