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
        Schema::create('subscriptions', function (Blueprint $table) {
            $table->integer('subscription_id')->primary();
            $table->string('subscription_gateway_id', 250)->nullable();
            $table->timestamp('subscription_created')->nullable();
            $table->timestamp('subscription_updated')->nullable();
            $table->integer('subscription_creatorid');
            $table->integer('subscription_clientid');
            $table->integer('subscription_categoryid')->default(4);
            $table->integer('subscription_projectid')->nullable();
            $table->string('subscription_gateway_product', 250)->nullable();
            $table->string('subscription_gateway_price', 250)->nullable();
            $table->string('subscription_gateway_product_name', 250)->nullable();
            $table->integer('subscription_gateway_interval')->nullable();
            $table->string('subscription_gateway_period', 50)->nullable();
            $table->timestamp('subscription_date_started')->nullable();
            $table->timestamp('subscription_date_ended')->nullable();
            $table->date('subscription_date_renewed')->nullable();
            $table->date('subscription_date_next_renewal')->nullable();
            $table->text('subscription_gateway_last_message')->nullable();
            $table->timestamp('subscription_gateway_last_message_date')->nullable();
            $table->decimal('subscription_subtotal', 10)->default(0);
            $table->decimal('subscription_amount_before_tax', 10)->nullable()->default(0);
            $table->decimal('subscription_tax_percentage', 10)->nullable()->default(0);
            $table->decimal('subscription_tax_amount', 10)->nullable()->default(0);
            $table->decimal('subscription_final_amount', 10)->nullable()->default(0);
            $table->text('subscription_notes')->nullable();
            $table->string('subscription_status', 50)->nullable()->default('pending');
            $table->string('subscription_visibility', 50)->nullable()->default('visible');
            $table->string('subscription_cron_status', 20)->nullable()->default('none');
            $table->timestamp('subscription_cron_date')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('subscriptions');
    }
};
