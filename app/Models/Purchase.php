<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    protected $fillable = [
        'reference',
        'purchaseid',
        'total',
        'document',
        'paymentmethod',
        'cardno',
        'cardholdername',
        'chequeno',
        'chequedate',
        'chequebank',
        'paymentreference',
        'paymentnote',
        'paymentproof',
        'bankaccount',
        'bankname',
        'accountholdername',
        'branch',
        'supplier_id'
    ];

    public static function generatePurchaseId()
    {
        $prefix = 'PN';
        $year = date('y');
        $month = date('m');
        $formattedMonth = "I{$month}";

        $lastPurchase = self::whereYear('created_at', date('Y'))
            ->whereMonth('created_at', date('m'))
            ->orderBy('id', 'desc')
            ->first();

        $sequence = $lastPurchase
            ? (int)substr($lastPurchase->purchaseid, -3) + 1
            : 1;

        $sequenceFormatted = str_pad($sequence, 3, '0', STR_PAD_LEFT);

        return "{$prefix}{$year}{$formattedMonth}{$sequenceFormatted}";
    }

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }
}
