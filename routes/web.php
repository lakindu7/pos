<?php

use App\Http\Controllers\BrandController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ChildCategoryController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\Pos\PosController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RewardSettingController;
use App\Http\Controllers\SectionController;
use App\Http\Controllers\SettingsController;
use App\Http\Controllers\StockController;
use App\Http\Controllers\SubcategoryController;
use App\Http\Controllers\SupplierController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return redirect('/login');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

// Route::get('/apidata', [ProductController::class, 'getapi']);

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

        Route::controller(CustomerController::class)->group(function () {
            Route::get('/customers', 'index')->name('customers');
            Route::get('/customers/create', 'create')->name('customers.create');
            Route::post('/customers/store', 'store')->name('customers.store');
            Route::get('/customers/{id}', 'edit')->name('customers.edit');
            Route::post('/customers/{id}', 'update')->name('customers.update');
            Route::post('/customers/delete/{id}', 'destroy')->name('customers.destroy');
        });

        Route::controller(SupplierController::class)->group(function () {
            Route::get('/suppliers', 'index')->name('suppliers');
            Route::get('/suppliers/create', 'create')->name('suppliers.create');
            Route::post('/suppliers/store', 'store')->name('suppliers.store');
            Route::get('/suppliers/{id}', 'edit')->name('suppliers.edit');
            Route::post('/suppliers/{id}', 'update')->name('suppliers.update');
            Route::post('/suppliers/delete/{id}', 'destroy')->name('suppliers.destroy');
        });

        Route::controller(InvoiceController::class)->group(function () {
            Route::get('/invoices', 'index')->name('invoices');
            Route::get('/invoices/create', 'create')->name('invoices.create');
            Route::post('/invoices/store', 'store')->name('invoices.store');
            Route::get('/invoices/{id}', 'edit')->name('invoices.edit');
            Route::post('/invoices/{id}', 'update')->name('invoices.update');
            Route::post('/invoices/delete/{id}', 'destroy')->name('invoices.destroy');
        });

        Route::controller(SettingsController::class)->group(function () {
            Route::get('/settings', 'index')->name('settings');
            Route::post('/settings/update', 'update')->name('settings.update');
        });

        Route::controller(RewardSettingController::class)->group(function () {
            Route::get('/settings/rewards', 'index')->name('rewards');
            Route::post('/settings/rewards/update', 'update')->name('rewards.update');
            Route::post('/update-toggle-status',  'updateToggleStatus');
        });
    });

    Route::prefix('pos')->group(function () {
        Route::get('/', [PosController::class, 'index'])->name('pos');
    });
});



require __DIR__ . '/auth.php';
