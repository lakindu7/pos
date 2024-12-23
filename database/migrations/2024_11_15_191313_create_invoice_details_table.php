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
        Schema::create('invoice_details', function (Blueprint $table) {
            $table->id();
            $table->string('quantity');
            $table->string('itemtotal');
            $table->string('unitprice');
            $table->string('buyingtotal');
            $table->string('markettotal');
            $table->string('marketprice');
            $table->string('buyingprice');
            $table->integer('product_id');
            $table->integer('invoice_id');
            $table->integer('stock_id');
            $table->integer('status')->default(1)->comment('0->cancelled,1->completed,2->exchanged');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('invoice_details');
    }
};
