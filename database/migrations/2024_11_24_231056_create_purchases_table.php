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
        Schema::create('purchases', function (Blueprint $table) {
            $table->id();
            $table->string('reference')->nullable();
            $table->string('purchaseid')->nullable();
            $table->string('total');
            $table->string('document')->nullable();
            $table->string('paymentmethod');
            $table->string('cardno')->nullable();
            $table->string('cardholdername')->nullable();
            $table->string('chequeno')->nullable();
            $table->string('chequedate')->nullable();
            $table->string('chequebank')->nullable();
            $table->string('paymentreference')->nullable();
            $table->string('paymentnote')->nullable();
            $table->string('paymentproof')->nullable();
            $table->string('bankaccount')->nullable();
            $table->string('bankname')->nullable();
            $table->string('accountholdername')->nullable();
            $table->string('branch')->nullable();
            $table->integer('supplier_id');
            $table->integer('status')->default(1)->comment('0->deleted,1->active');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('purchases');
    }
};
