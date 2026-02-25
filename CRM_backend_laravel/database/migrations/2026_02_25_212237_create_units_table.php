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
        Schema::create('units', function (Blueprint $table) {
            $table->integer('unit_id')->primary();
            $table->timestamp('unit_created')->nullable();
            $table->timestamp('unit_update')->nullable();
            $table->integer('unit_creatorid')->nullable()->default(1);
            $table->string('unit_name', 50);
            $table->string('unit_system_default', 50)->default('no');
            $table->string('unit_time_default', 50)->nullable()->default('no');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('units');
    }
};
