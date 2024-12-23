<?php

namespace App\Http\Controllers;

use App\Models\Expense;
use App\Models\Invoice;
use App\Models\Purchase;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        $totalpurchase = Purchase::where('status', 1)
            ->whereDate('created_at', today())
            ->sum(DB::raw("CASE
        WHEN paymentmethod = 'cash' THEN total
        WHEN paymentmethod = 'Half' THEN payment
        ELSE 0
        END"));
        $totalincome = Invoice::where('status', 1)->where('invoicetype', 'cash')->whereDate('created_at', today())->sum('amount');
        $totalexpense = Expense::where('status', 1)->whereDate('created_at', today())->sum('amount');
        $profit = $totalincome - ($totalexpense);

        $startDate = now()->subDays(30);
        $startDate365 = now()->subDays(365);
        $endDate = now();
        $totalpurchase30 = Purchase::where('status', 1)
            ->whereBetween('created_at', [$startDate, $endDate])
            ->sum(DB::raw("CASE
        WHEN paymentmethod = 'cash' THEN total
        WHEN paymentmethod = 'Half' THEN payment
        ELSE 0
    END"));

        $totalincome30 = Invoice::where('status', 1)
            ->where('invoicetype', 'cash')
            ->whereBetween('created_at', [$startDate, $endDate])
            ->sum('amount');
        $totalexpense30 = Expense::where('status', 1)
            ->whereBetween('created_at', [$startDate, $endDate])
            ->sum('amount');
        $profit30 = $totalincome30 - ($totalexpense30);

        $totalpurchase365 = Purchase::where('status', 1)
            ->whereBetween('created_at', [$startDate365, $endDate])
            ->sum(DB::raw("CASE
        WHEN paymentmethod = 'cash' THEN total
        WHEN paymentmethod = 'Half' THEN payment
        ELSE 0
    END"));

        // Calculate total income
        $totalincome365 = Invoice::where('status', 1)
            ->where('invoicetype', 'cash')
            ->whereBetween('created_at', [$startDate365, $endDate])
            ->sum('amount');

        // Calculate total expense
        $totalexpense365 = Expense::where('status', 1)
            ->whereBetween('created_at', [$startDate365, $endDate])
            ->sum('amount');

        // Calculate profit
        $profit365 = $totalincome365 - ($totalexpense365);

        return view('dashboard', compact(
            'totalpurchase',
            'totalincome',
            'totalexpense',
            'profit',
            'totalpurchase30',
            'totalincome30',
            'totalexpense30',
            'profit30',
            'totalpurchase365',
            'totalincome365',
            'totalexpense365',
            'profit365',
        ));
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
