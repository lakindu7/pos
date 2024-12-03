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
        Schema::create('dailydetails', function (Blueprint $table) {
            $table->id();
            $table->double('startingbalance');
            $table->double('sales')->default(0);
            $table->double('purchases')->default(0);
            $table->double('expenses')->default(0);
            $table->double('endingbalance')->default(0);
            $table->integer('totalinvoices')->default(0);
            $table->integer('started_by');
            $table->integer('ended_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dailydetails');
    }
};
