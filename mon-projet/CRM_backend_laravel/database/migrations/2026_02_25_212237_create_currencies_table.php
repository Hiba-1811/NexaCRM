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
        Schema::create('currencies', function (Blueprint $table) {
            $table->integer('currency_id')->primary();
            $table->timestamp('currency_created');
            $table->timestamp('currency_update');
            $table->string('currency_code', 50);
            $table->string('currency_decimal_separator', 50);
            $table->string('currency_thousands_separator', 50);
            $table->string('currency_symbol', 50);
            $table->string('currency_symbol_position', 50);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('currencies');
    }
};
