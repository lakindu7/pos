<?php

namespace App\Http\Controllers;

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
        $dailyTotals = DB::table('invoices')
            ->select(
                DB::raw('DATE(created_at) as date'),
                DB::raw('SUM(amount) as total_amount')
            )
            ->where('created_at', '>=', now()->subDays(30))
            ->groupBy(DB::raw('DATE(created_at)'))
            ->orderBy('date', 'asc')
            ->get();

        $chartData = [
            'labels' => $dailyTotals->pluck('date'),
            'data' => $dailyTotals->pluck('total_amount'),
        ];

        return response()->json($chartData);
    }
}
