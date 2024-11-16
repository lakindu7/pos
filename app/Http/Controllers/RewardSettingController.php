<?php

namespace App\Http\Controllers;

use App\Models\RewardSetting;
use Illuminate\Http\Request;

class RewardSettingController extends Controller
{
    public function index()
    {
        $reward = RewardSetting::first();
        return view('settings.rewards', compact('reward'));
    }
}
