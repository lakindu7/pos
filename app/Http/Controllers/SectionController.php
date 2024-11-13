<?php

namespace App\Http\Controllers;

use App\Models\Section;
use Illuminate\Http\Request;

class SectionController extends Controller
{
    public function index()
    {
        $sections = Section::where('status', '1')->get();
        return view('sections.index', compact('sections'));
    }

    public function create()
    {
        return view('sections.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:categories|max:255'
        ]);

        $section = Section::create($request->all());

        return redirect()->route('sections')->with('success', 'Section created successfully.');
    }

    public function edit($id)
    {
        $section = Section::find($id);
        return view('sections.edit', compact('section'));
    }


    public function update(Request $request, $id)
    {
        $section = Section::findOrFail($id);
        $section->update($request->all());

        return redirect()->route('sections')->with('success', 'Section updated successfully.');
    }

    public function destroy($id)
    {
        $section = Section::findOrFail($id);
        $section->status = 0;
        $section->save();
        return redirect()->route('sections')->with('success', 'Section deleted successfully.');
    }
}
