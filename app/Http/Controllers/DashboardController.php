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

        return [
            'labels' => $dailyTotals->pluck('date')->map(fn($date) => \Carbon\Carbon::parse($date)->format('Y-m-d')),
            'data' => $dailyTotals->pluck('total_amount'),
        ];
    }



    public function getInvoiceCountsByInterval()
    {
        $startDate = now()->subDays(30)->startOfDay();
        $endDate = now()->endOfDay();

        $invoices = Invoice::selectRaw('
        FLOOR(HOUR(created_at) / 2) as period,
        COUNT(*) as count
    ')
            ->whereBetween('created_at', [$startDate, $endDate])
            ->groupByRaw('FLOOR(HOUR(created_at) / 2)')
            ->orderBy('period')
            ->get();

        $data = [];
        $labels = [];

        for ($i = 0; $i < 12; $i++) {
            $start = $i * 2;
            $end = $start + 2;
            $labels[] = "$start:00 - $end:00";
            $data[] = $invoices->firstWhere('period', $i)->count ?? 0;
        }

        return [
            'labels' => $labels,
            'data' => $data,
        ];
    }

    public function getChartData()
    {
        $dailyTotals = $this->getDailyAmounts();
        $twoHourIntervals = $this->getInvoiceCountsByInterval();

        return response()->json([
            'dailyTotals' => $dailyTotals,
            'twoHourIntervals' => $twoHourIntervals,
        ]);
    }
}
