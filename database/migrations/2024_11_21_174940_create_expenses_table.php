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
        Schema::create('expenses', function (Blueprint $table) {
            $table->id();
            $table->string('expenseid')->nullable();
            $table->string('reference')->nullable();
            $table->double('amount');
            $table->text('expensenote')->nullable();
            $table->text('deletenote')->nullable();
            $table->integer('user_id');
            $table->integer('expense_category_id');
            $table->integer('status')->default(1)->comment('0->deleted,1->active');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('expenses');
    }
};
