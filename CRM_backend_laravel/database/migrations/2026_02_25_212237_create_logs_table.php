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
        Schema::create('logs', function (Blueprint $table) {
            $table->integer('log_id')->primary();
            $table->string('log_uniqueid', 100)->nullable();
            $table->timestamp('log_created');
            $table->timestamp('log_updated');
            $table->integer('log_creatorid')->nullable();
            $table->text('log_text')->nullable();
            $table->string('log_text_type', 20)->nullable()->default('text');
            $table->string('log_data_1', 250)->nullable();
            $table->string('log_data_2', 250)->nullable();
            $table->string('log_data_3', 250)->nullable();
            $table->text('log_payload')->nullable();
            $table->string('logresource_type', 60)->nullable();
            $table->integer('logresource_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('logs');
    }
};
