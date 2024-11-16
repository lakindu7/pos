<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $fillable = [
        'name',
        'email',
        'telephone',
        'address',
        'dob',
        'points',
        'creditlimit',
        'user_id',
    ];
}
