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
        Schema::create('customers', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique()->nullable();
            $table->string('telephone')->nullable();
            $table->string('address')->nullable();
            $table->date('dob')->nullable();
            $table->double('points')->default(0);
            $table->double('creditlimit')->default(0);
            $table->string('outstandingbalance')->default(0);
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
        Schema::dropIfExists('customers');
    }
};