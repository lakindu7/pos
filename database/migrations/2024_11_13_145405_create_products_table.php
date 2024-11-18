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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('name_si')->nullable();
            $table->string('slug')->nullable();
            $table->text('description')->nullable();
            $table->text('barcode')->nullable();
            $table->string('sku')->nullable();
            $table->date('expiredate')->nullable();
            $table->string('image')->nullable();
            $table->integer('alertlimit')->nullable();
            $table->text('youtubelink')->nullable();
            $table->text('tags')->nullable();
            $table->string('sellingtype');
            $table->integer('status')->default(1)->comment('0->disabled,1->active,2->deleted');
            $table->integer('isFeatured')->default(0)->comment('0->no,1->yes');
            $table->integer('category_id')->nullable();
            $table->integer('subcategory_id')->nullable();
            $table->integer('childcategory_id')->nullable();
            $table->integer('brand_id')->nullable();
            $table->integer('section_id');
            $table->integer('supplier_id')->nullable();
            $table->integer('user_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
