<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RewardSetting extends Model
{
    protected $fillable = [
        'spendamount',
        'mintotal',
        'maxpoint',
        'pointvalue',
        'min_redeem_total',
        'min_redeem_per_invoice',
        'max_redeem_per_invoice',
        'exp_period'
    ];
}
