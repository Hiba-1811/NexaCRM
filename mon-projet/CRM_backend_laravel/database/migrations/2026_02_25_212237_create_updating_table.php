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
        Schema::create('updating', function (Blueprint $table) {
            $table->integer('updating_id')->primary();
            $table->timestamp('updating_created');
            $table->timestamp('updating_updated');
            $table->string('updating_type', 100);
            $table->string('updating_name', 100)->nullable();
            $table->string('updating_function_name', 150)->nullable();
            $table->string('updating_update_version', 10)->nullable();
            $table->string('updating_request_path', 250)->nullable();
            $table->string('updating_update_path', 250)->nullable();
            $table->text('updating_notes')->nullable();
            $table->text('updating_payload_1')->nullable();
            $table->text('updating_payload_2')->nullable();
            $table->text('updating_payload_3')->nullable();
            $table->timestamp('updating_started_date')->nullable();
            $table->timestamp('updating_completed_date')->nullable();
            $table->text('updating_system_log')->nullable();
            $table->string('updating_status', 50)->nullable()->default('new');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('updating');
    }
};
