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
        Schema::create('reward_settings', function (Blueprint $table) {
            $table->id();
            $table->integer('spendamount')->default(100);
            $table->integer('mintotal')->default(1);
            $table->integer('maxpoint')->nullable();
            $table->integer('pointvalue')->default(1);
            $table->integer('min_redeem_total')->default(1);
            $table->integer('min_redeem_per_invoice')->nullable();
            $table->integer('max_redeem_per_invoice')->nullable();
            $table->integer('exp_period')->default(12);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reward_settings');
    }
};
