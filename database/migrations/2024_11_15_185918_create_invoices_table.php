<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('invoices', function (Blueprint $table) {
            $table->id();
            $table->string('invoiceid')->nullable();
            $table->string('invoicetype')->nullable();
            $table->string('amount');
            $table->string('payment');
            $table->string('balance');
            $table->string('discounttype')->nullable();;
            $table->string('discount')->nullable();
            $table->string('payable');
            $table->string('discountamount')->nullable();;
            $table->string('markettotal')->nullable();
            $table->string('buyingtotal')->nullable();
            $table->string('points')->default(0);
            $table->string('customer_id')->nullable();
            $table->string('user_id')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('invoices');
    }
};
