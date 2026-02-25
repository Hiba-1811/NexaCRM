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
        Schema::create('taxrates', function (Blueprint $table) {
            $table->integer('taxrate_id')->primary();
            $table->string('taxrate_uniqueid', 200);
            $table->timestamp('taxrate_created');
            $table->timestamp('taxrate_updated');
            $table->integer('taxrate_creatorid');
            $table->string('taxrate_name', 100);
            $table->decimal('taxrate_value', 10);
            $table->string('taxrate_type', 100)->default('user');
            $table->integer('taxrate_clientid')->nullable();
            $table->integer('taxrate_estimateid')->nullable();
            $table->integer('taxrate_invoiceid')->nullable();
            $table->string('taxrate_status', 20)->default('enabled');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('taxrates');
    }
};
