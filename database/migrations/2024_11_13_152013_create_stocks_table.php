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
        Schema::create('stocks', function (Blueprint $table) {
            $table->id();
            $table->string('stockid')->nullable();
            $table->string('reference')->nullable();
            $table->string('quantity')->nullable();
            $table->string('availablequantity')->nullable();
            $table->string('price')->nullable();
            $table->string('buyingprice')->nullable();
            $table->string('marketprice')->nullable();
            $table->string('total')->nullable();
            $table->string('buyingtotal')->nullable();
            $table->integer('product_id')->nullable();
            $table->integer('user_id')->nullable();
            $table->integer('status')->default(1)->comment('0->disabled,1->active,2->deleted');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('stocks');
    }
};
