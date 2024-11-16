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
        Schema::create('settings', function (Blueprint $table) {
            $table->id();
            $table->string('businessname');
            $table->string('registrationno')->nullable();
            $table->string('registrationtype')->nullable();
            $table->string('contactperson')->nullable();
            $table->string('contact')->nullable();
            $table->string('email')->nullable();
            $table->string('address1')->nullable();
            $table->string('address2')->nullable();
            $table->string('city')->nullable();
            $table->string('logo')->nullable();
            $table->string('greetingmessage')->default('***ස්තූතියි, නැවත එන්න.***');
            $table->string('devname')->default('TekSalad (Pvt) Ltd.');
            $table->string('devcontact')->default('077 068 7287');
            $table->date('startdate')->nullable();
            $table->boolean('loyaltypoints')->default(0);
            $table->boolean('emailnotification')->default(0);
            $table->boolean('smsnotification')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('settings');
    }
};
