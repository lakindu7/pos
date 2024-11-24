<?php

namespace App\Http\Controllers;

use App\Models\Invoice;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        return view('dashboard');
    }

    public function getDailyAmounts()
    {
        $dailyTotals = Invoice::selectRaw('DATE(created_at) as date, SUM(amount) as total_amount')
            ->where('created_at', '>=', now()->subDays(30))
            ->where('status', 1)
            ->groupByRaw('DATE(created_at)')
            ->orderBy('date', 'asc')
            ->get();

        $chartData = [
            'labels' => $dailyTotals->pluck('date'),
            'data' => $dailyTotals->pluck('total_amount'),
        ];

        return response()->json($chartData);
    }
}
