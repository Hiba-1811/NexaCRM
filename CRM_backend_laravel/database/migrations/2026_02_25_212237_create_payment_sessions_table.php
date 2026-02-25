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
        Schema::create('payment_sessions', function (Blueprint $table) {
            $table->integer('session_id')->primary();
            $table->timestamp('session_created')->nullable();
            $table->timestamp('session_updated')->nullable();
            $table->integer('session_creatorid')->nullable();
            $table->string('session_creator_fullname', 150)->nullable();
            $table->string('session_creator_email', 150)->nullable();
            $table->string('session_gateway_name', 150)->nullable();
            $table->string('session_gateway_ref', 150)->nullable();
            $table->decimal('session_amount', 10)->nullable();
            $table->string('session_invoices', 250)->nullable();
            $table->integer('session_subscription')->nullable();
            $table->text('session_payload')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payment_sessions');
    }
};
