<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SupllierContact extends Model
{
    protected $fillable = [
        'name',
        'position',
        'telephone',
    ];
}
