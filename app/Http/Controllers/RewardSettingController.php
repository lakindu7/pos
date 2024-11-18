<?php

namespace App\Http\Controllers;

use App\Models\RewardSetting;
use App\Models\Setting;
use Illuminate\Http\Request;

class RewardSettingController extends Controller
{
    public function index()
    {
        $reward = RewardSetting::first();
        $reward_status = Setting::first();
        return view('settings.rewards', compact('reward', 'reward_status'));
    }

    public function update(Request $request)
    {
        $setting = RewardSetting::updateOrCreate(
            ['id' => 1],
            $request->all()
        );
        return redirect()->back()->with('success', 'Settings updated successfully.');
    }

    public function updateToggleStatus(Request $request)
    {
        $request->validate([
            'toggle_status' => 'required|boolean',
        ]);

        $status = $request->toggle_status;

        $setting =  Setting::first();
        $setting->loyaltypoints = $status;
        $setting->save();
    }
}
