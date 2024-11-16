<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;

class SettingsController extends Controller
{
    public function index()
    {
        $settings = Setting::first();
        return view('settings.index', compact('settings'));
    }

    public function update(Request $request)
    {
        $setting = Setting::updateOrCreate(
            ['id' => 1],
            $request->all()
        );

        if ($request->hasFile('logo')) {
            $image = $request->file('logo');
            $imageName = 'logo' . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('uploads/settings/');

            if (!File::exists($destinationPath)) {
                File::makeDirectory($destinationPath, 0755, true);
            }

            if ($setting->logo && File::exists($destinationPath . '/' . $setting->logo)) {
                File::delete($destinationPath . '/' . $setting->logo);
            }

            $image->move($destinationPath, $imageName);
            $setting->logo = $imageName;
            $setting->save();
        }
        return redirect()->back()->with('success', 'Settings updated successfully.');
    }
}
