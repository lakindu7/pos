<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    protected $fillable = [
        'invoiceid',
        'invoicetype',
        'amount',
        'payment',
        'balance',
        'markettotal',
        'buyingtotal',
        'points',
        'customer_id',
        'user_id',
    ];

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function invoicedetails()
    {
        return $this->hasMany(InvoiceDetail::class);
    }
}