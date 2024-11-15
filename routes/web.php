<?php

use App\Http\Controllers\BrandController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ChildCategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SectionController;
use App\Http\Controllers\StockController;
use App\Http\Controllers\SubcategoryController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\VariationController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return redirect('/login');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::middleware(('role:superadmin|admin'))->group(function () {
        Route::controller(UserController::class)->group(function () {
            Route::get('/users', 'index')->name('users');
            Route::get('/users/create', 'create')->name('users.create');
            Route::post('/users/store', 'store')->name('users.store');
            Route::get('/users/{id}', 'edit')->name('users.edit');
            Route::post('/users/{id}', 'update')->name('users.update');
            Route::post('/users/delete/{id}', 'destroy')->name('users.destroy');
        });

        Route::controller(CategoryController::class)->group(function () {
            Route::get('/categories', 'index')->name('categories');
            Route::get('/categories/create', 'create')->name('categories.create');
            Route::post('/categories/store', 'store')->name('categories.store');
            Route::get('/categories/{id}', 'edit')->name('categories.edit');
            Route::post('/categories/{id}', 'update')->name('categories.update');
            Route::post('/categories/delete/{id}', 'destroy')->name('categories.destroy');
        });

        Route::controller(SubcategoryController::class)->group(function () {
            Route::get('/subcategories',  'index')->name('subcategories');
            Route::get('/subcategories/create', 'create')->name('subcategories.create');
            Route::post('/subcategories/store', 'store')->name('subcategories.store');
            Route::get('/subcategories/{id}', 'edit')->name('subcategories.edit');
            Route::post('/subcategories/{id}', 'update')->name('subcategories.update');
            Route::post('/subcategories/delete/{id}', 'destroy')->name('subcategories.destroy');
        });

        Route::controller(ChildCategoryController::class)->group(function () {
            Route::get('/childcategories',  'index')->name('childcategories');
            Route::get('/childcategories/create', 'create')->name('childcategories.create');
            Route::post('/childcategories/store', 'store')->name('childcategories.store');
            Route::get('/childcategories/{id}', 'edit')->name('childcategories.edit');
            Route::post('/childcategories/{id}', 'update')->name('childcategories.update');
            Route::post('/childcategories/delete/{id}', 'destroy')->name('childcategories.destroy');
            Route::get('/getsubcategories/{categoryId}', 'getByCategory')->name('subcategories.byCategory');
        });

        Route::controller(BrandController::class)->group(function () {
            Route::get('/brands',  'index')->name('brands');
            Route::get('/brands/create', 'create')->name('brands.create');
            Route::post('/brands/store', 'store')->name('brands.store');
            Route::get('/brands/{id}', 'edit')->name('brands.edit');
            Route::post('/brands/{id}', 'update')->name('brands.update');
            Route::post('/brands/delete/{id}', 'destroy')->name('brands.destroy');
        });

        Route::controller(SectionController::class)->group(function () {
            Route::get('/sections',  'index')->name('sections');
            Route::get('/sections/create', 'create')->name('sections.create');
            Route::post('/sections/store', 'store')->name('sections.store');
            Route::get('/sections/{id}', 'edit')->name('sections.edit');
            Route::post('/sections/{id}', 'update')->name('sections.update');
            Route::post('/sections/delete/{id}', 'destroy')->name('sections.destroy');
        });

        Route::controller(ProductController::class)->group(function () {
            Route::get('/products',  'index')->name('products');
            Route::get('/products/view/{id}', 'view')->name('products.view');
            Route::get('/products/create', 'create')->name('products.create');
            Route::post('/products/store', 'store')->name('products.store');
            Route::get('/products/{id}', 'edit')->name('products.edit');
            Route::post('/products/{id}', 'update')->name('products.update');
            Route::post('/products/delete/{id}', 'destroy')->name('products.destroy');
            Route::get('/get-subcategories/{categoryId}', 'getSubcategories');
            Route::get('/get-childcategories/{subcategoryId}', 'getChildCategories');
        });

        Route::controller(StockController::class)->group(function () {
            Route::get('/stocks',  'index')->name('stocks');
            Route::get('/stocks/view/{id}', 'view')->name('stocks.view');
            Route::get('/stocks/create/{id}', 'create')->name('stocks.create');
            Route::post('/stocks/store/{id}', 'store')->name('stocks.store');
            Route::get('/stocks/{id}', 'edit')->name('stocks.edit');
            Route::post('/stocks/{id}', 'update')->name('stocks.update');
            Route::post('/stocks/delete/{id}', 'destroy')->name('stocks.destroy');
        });
    });
});



require __DIR__ . '/auth.php';
