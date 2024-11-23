<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Expense extends Model
{
    protected $fillable = [
        'expenseid',
        'reference',
        'amount',
        'expensenote',
        'deletenote',
        'user_id',
        'expense_category_id'
    ];

    public function category()
    {
        return $this->belongsTo(ExpenseCategory::class,  'expense_category_id', 'id');
    }

    public static function boot()
    {
        parent::boot();

        static::creating(function ($expense) {
            $year = now()->format('y');
            $month = now()->format('m');
            $lastExpense = static::where('expenseid', 'like', "EXP{$year}I{$month}%")
                ->orderBy('expenseid', 'desc')
                ->first();

            $nextSequence = 1;

            if ($lastExpense) {
                $lastSequence = (int)substr($lastExpense->expenseid, -4);
                $nextSequence = $lastSequence + 1;
            }

            $expense->expenseid = sprintf("EXP%sI%s%04d", $year, $month, $nextSequence);
        });
    }
}
