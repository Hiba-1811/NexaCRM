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
        Schema::create('webhooks', function (Blueprint $table) {
            $table->integer('webhooks_id')->primary();
            $table->timestamp('webhooks_created');
            $table->timestamp('webhooks_updated');
            $table->integer('webhooks_creatorid')->nullable()->default(0);
            $table->string('webhooks_gateway_name', 100)->nullable();
            $table->string('webhooks_type', 100)->nullable();
            $table->string('webhooks_payment_type', 30)->nullable();
            $table->decimal('webhooks_payment_amount', 10)->nullable();
            $table->string('webhooks_payment_transactionid', 150)->nullable();
            $table->string('webhooks_matching_reference', 100)->nullable();
            $table->string('webhooks_matching_attribute', 100)->nullable();
            $table->text('webhooks_payload')->nullable();
            $table->text('webhooks_comment')->nullable();
            $table->timestamp('webhooks_started_at')->nullable();
            $table->timestamp('webhooks_completed_at')->nullable();
            $table->smallInteger('webhooks_attempts')->nullable()->default(0);
            $table->string('webhooks_status', 20)->nullable()->default('new');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('webhooks');
    }
};
