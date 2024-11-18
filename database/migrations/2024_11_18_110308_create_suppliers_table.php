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
        Schema::create('suppliers', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('contactperson')->nullable();
            $table->string('telephone')->nullable();
            $table->string('address')->nullable();
            $table->string('delivaryday')->nullable();
            $table->string('frequency')->nullable();
            $table->date('lastdelivary')->nullable();
            $table->date('nextdelivary')->nullable();
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
        Schema::dropIfExists('suppliers');
    }
};
