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
        Schema::create('email_log', function (Blueprint $table) {
            $table->integer('emaillog_id')->primary();
            $table->timestamp('emaillog_created')->nullable();
            $table->timestamp('emaillog_updated')->nullable();
            $table->string('emaillog_email', 100)->nullable();
            $table->string('emaillog_subject', 200)->nullable();
            $table->text('emaillog_body')->nullable();
            $table->string('emaillog_attachment', 250)->nullable()->default('attached file name');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('email_log');
    }
};
